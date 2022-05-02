import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../helpers/constants/constants.dart';
import '../../../helpers/routes/custom_routes.dart';
import '../../../providers/calculation/calculation_pd.dart';
import '../../visualization/visualization.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _pd = Provider.of<CalculationPd>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'For solarize your home, you need to know the following:',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kLightPrimaryColor,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'UPS/Invertor:',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              Expanded(
                child: Text(
                  _pd.inverterWattageP!.toStringAsFixed(1) + ' W',
                  style: const TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'DC Current Required:',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              Expanded(
                child: Text(
                  _pd.dcCurrentRequiredI!.toStringAsFixed(1) + ' Amp.',
                  style: const TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Battery Capacity:',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              Expanded(
                child: Text(
                  _pd.dcBatterySizeAH!.toStringAsFixed(1) + ' Ah.',
                  style: const TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Battery Charging Rate:',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              Expanded(
                child: Text(
                  _pd.batteryChargingRate!.toStringAsFixed(1) + ' Amp.',
                  style: const TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Solar Plates Current:',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              Expanded(
                child: Text(
                  _pd.solarPlatesCurrent!.toStringAsFixed(1) + ' Amp.',
                  style: const TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Solar Plates Power:',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              Expanded(
                child: Text(
                  _pd.solarPowerWattage!.toStringAsFixed(1) + ' W.',
                  style: const TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Solar Plates Voltage:',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              Expanded(
                child: Text(
                  _pd.solarPlatesVoltage!.toStringAsFixed(1) + ' V.',
                  style: const TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Solar Plate (125W) Need:',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              Expanded(
                child: Text(
                  _pd.solarPlate125Need!.toStringAsFixed(1) + ' pcs.',
                  style: const TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Solar Plate (180W) Need:',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              Expanded(
                child: Text(
                  _pd.solarPlate180Need!.toStringAsFixed(1) + ' pcs.',
                  style: const TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40.0),
          Text(
            'Cost of Solar Instruments',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: kLightPrimaryColor,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            children: const [
              Expanded(
                child: Text(
                  'If you use Solar Plate of 125 Wattage:',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '',
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Solar Plate Cost:',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              Expanded(
                child: Text(
                  (_pd.solarPlate125Need! * 5000).toStringAsFixed(1) + ' BDT.',
                  style: const TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'UPS/Invertor Cost:',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              Expanded(
                child: Text(
                  _pd.inverterPrice(_pd.inverterWattageP!).toStringAsFixed(1) +
                      ' BDT.',
                  style: const TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Battery Cost:',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              Expanded(
                child: Text(
                  _pd.batteryPrice(_pd.dcBatterySizeAH!).toStringAsFixed(1) +
                      ' BDT.',
                  style: const TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.0,
            color: kLightPrimaryColor,
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Total Cost:',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  ((_pd.solarPlate125Need! * 5000) +
                              _pd.inverterPrice(_pd.inverterWattageP!) +
                              _pd.batteryPrice(_pd.dcBatterySizeAH!))
                          .toStringAsFixed(1) +
                      ' BDT.',
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          Row(
            children: const [
              Expanded(
                child: Text(
                  'If you use Solar Plate of 180 Wattage:',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '',
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Solar Plate Cost:',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              Expanded(
                child: Text(
                  (_pd.solarPlate180Need! * 5000).toStringAsFixed(1) + ' BDT.',
                  style: const TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'UPS/Invertor Cost:',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              Expanded(
                child: Text(
                  _pd.inverterPrice(_pd.inverterWattageP!).toStringAsFixed(1) +
                      ' BDT.',
                  style: const TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Battery Cost:',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              Expanded(
                child: Text(
                  _pd.batteryPrice(_pd.dcBatterySizeAH!).toStringAsFixed(1) +
                      ' BDT.',
                  style: const TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.0,
            color: kLightPrimaryColor,
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Total Cost:',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  ((_pd.solarPlate180Need! * 5000) +
                              _pd.inverterPrice(_pd.inverterWattageP!) +
                              _pd.batteryPrice(_pd.dcBatterySizeAH!))
                          .toStringAsFixed(1) +
                      ' BDT.',
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Text('Visualize'),
            ),
            onPressed: () {
              Navigator.push(
                context,
                SlideLeftRoute(
                  page: const Visualization(),
                ),
              );
            },
          ),
          const SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
