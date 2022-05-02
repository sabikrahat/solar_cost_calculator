import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:solar_cost_calculator/helpers/routes/custom_routes.dart';
import 'package:solar_cost_calculator/screens/result_screen/result_screen.dart';

class CalculationPd extends ChangeNotifier {
  reloadUi() => notifyListeners();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late int totalTile;
  List<TextEditingController> componentsCntrlrs = [];
  List<TextEditingController> wattageCntrlrs = [];
  List<int?> pcsCntrlrs = [];
  List<double?> hoursCntrlrs = [];

  // Calculation Result
  double? inverterWattageP;
  double? dcCurrentRequiredI;
  double? dcVoltageRequiredV = 12.0;

  double? dcBatterySizeAH; // (P * hrs)/V
  double? batteryChargingRate;
  double? solarPlatesCurrent;
  double? solarPlatesVoltage = 12.0;
  double? solarPowerWattage;
  double? solarPlate125Need;
  double? solarPlate180Need;
  double? wattageWithHrs;

  CalculationPd() {
    totalTile = 1;
    componentsCntrlrs.add(TextEditingController());
    wattageCntrlrs.add(TextEditingController());
    pcsCntrlrs.add(1);
    hoursCntrlrs.add(0.5);
  }

  addTile() {
    if (formKey.currentState!.validate()) {
      totalTile++;
      componentsCntrlrs.add(TextEditingController());
      wattageCntrlrs.add(TextEditingController());
      pcsCntrlrs.add(1);
      hoursCntrlrs.add(0.5);
      reloadUi();
    }
  }

  removeTile() {
    totalTile--;
    componentsCntrlrs.removeLast();
    wattageCntrlrs.removeLast();
    pcsCntrlrs.removeLast();
    hoursCntrlrs.removeLast();
    reloadUi();
  }

  clearAll() {
    totalTile = 1;
    componentsCntrlrs.clear();
    wattageCntrlrs.clear();
    pcsCntrlrs.clear();
    componentsCntrlrs.add(TextEditingController());
    wattageCntrlrs.add(TextEditingController());
    pcsCntrlrs.add(1);
    hoursCntrlrs.add(0.5);
    reloadUi();
  }

  void calculateCost(BuildContext context) {
    if (formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Calculating...');
      inverterWattageP = 0;
      dcCurrentRequiredI = 0;
      dcBatterySizeAH = 0;
      batteryChargingRate = 0;
      solarPlatesCurrent = 0;
      solarPowerWattage = 0;
      wattageWithHrs = 0;
      for (int i = 0; i < totalTile; i++) {
        inverterWattageP = inverterWattageP! +
            double.parse(wattageCntrlrs[i].text) *
                double.parse(pcsCntrlrs[i].toString());
        wattageWithHrs = wattageWithHrs! +
            double.parse(wattageCntrlrs[i].text) *
                double.parse(pcsCntrlrs[i].toString()) *
                double.parse(hoursCntrlrs[i].toString());
      }
      dcCurrentRequiredI = (inverterWattageP! / dcVoltageRequiredV!);
      dcBatterySizeAH = (wattageWithHrs! / dcVoltageRequiredV!).toDouble();
      batteryChargingRate = (dcBatterySizeAH! / 10).toDouble();
      solarPlatesCurrent = (dcCurrentRequiredI! + batteryChargingRate!);
      solarPowerWattage = (dcVoltageRequiredV! * solarPlatesCurrent!);
      solarPlate125Need = solarPowerWattage! / 125;
      solarPlate180Need = solarPowerWattage! / 180;
      debugPrint(
          'Inverter Wattage: $inverterWattageP\nDC Current Required: $dcCurrentRequiredI\nDC Battery Size: $dcBatterySizeAH\nBattery Charging Rate: $batteryChargingRate\nSolar Plates Current: $solarPlatesCurrent\nSolar Power Wattage: $solarPowerWattage\nSolar Plate 125 Need: $solarPlate125Need\nSolar Plate 180 Need: $solarPlate180Need\nWattage With Hours: $wattageWithHrs');
      EasyLoading.dismiss();
      Navigator.push(
        context,
        SlideLeftRoute(
          page: const ResultScreen(),
        ),
      );
    }
  }

  // battery Prices per Ah
  double batteryPrice(double ah) {
    if (ah <= 50) {
      return 8000.0;
    } else if (ah <= 100) {
      return 9500.0;
    } else if (ah <= 150) {
      return 12000.0;
    } else if (ah <= 200) {
      return 14000.0;
    } else if (ah <= 250) {
      return 16000.0;
    } else if (ah <= 300) {
      return 18000.0;
    } else if (ah <= 350) {
      return 20000.0;
    } else if (ah <= 400) {
      return 22000.0;
    } else if (ah <= 450) {
      return 24000.0;
    } else if (ah <= 500) {
      return 26000.0;
    } else {
      return 30000.0;
    }
  }

  double inverterPrice(double w) {
    if (w <= 50) {
      return 2500.0;
    } else if (w <= 100) {
      return 3000.0;
    } else if (w <= 150) {
      return 3500.0;
    } else if (w <= 200) {
      return 4000.0;
    } else if (w <= 250) {
      return 4500.0;
    } else if (w <= 300) {
      return 5000.0;
    } else if (w <= 350) {
      return 5500.0;
    } else if (w <= 400) {
      return 6000.0;
    } else if (w <= 450) {
      return 6500.0;
    } else if (w <= 500) {
      return 7000.0;
    } else {
      return 7500.0;
    }
  }
}
