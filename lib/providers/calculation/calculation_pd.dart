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

  CalculationPd() {
    totalTile = 1;
    componentsCntrlrs.add(TextEditingController());
    wattageCntrlrs.add(TextEditingController());
    pcsCntrlrs.add(1);
  }

  addTile() {
    if (formKey.currentState!.validate()) {
      totalTile++;
      componentsCntrlrs.add(TextEditingController());
      wattageCntrlrs.add(TextEditingController());
      pcsCntrlrs.add(1);
      reloadUi();
    }
  }

  removeTile() {
    totalTile--;
    componentsCntrlrs.removeLast();
    wattageCntrlrs.removeLast();
    pcsCntrlrs.removeLast();
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
    reloadUi();
  }

  void calculateCost(BuildContext context) {
    if (formKey.currentState!.validate()) {
      EasyLoading.showSuccess('All Okay');
      Navigator.push(
        context,
        SlideLeftRoute(
          page: const ResultScreen(),
        ),
      );
    }
  }
}
