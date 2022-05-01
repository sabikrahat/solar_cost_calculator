import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_cost_calculator/helpers/size_config/size_config.dart';
import 'package:solar_cost_calculator/providers/calculation/calculation_pd.dart';

import '../../../helpers/constants/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _pd = Provider.of<CalculationPd>(context);
    return SingleChildScrollView(
      child: Form(
        key: _pd.formKey,
        child: Column(
          mainAxisSize: mainMin,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: ScreenSize.height * 0.5,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _pd.totalTile,
                itemBuilder: (context, index) {
                  return SizedBox(
                    // height: 55.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: TextFormField(
                              controller: _pd.componentsCntrlrs[index],
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(fontSize: 14.0),
                              decoration: const InputDecoration(
                                labelText: 'Component *',
                                suffixIcon: Icon(Icons.power),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (v) {
                                if (v!.isEmpty) {
                                  return 'Enter component';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Expanded(
                            flex: 3,
                            child: TextFormField(
                              controller: _pd.wattageCntrlrs[index],
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(fontSize: 14.0),
                              decoration: const InputDecoration(
                                labelText: 'Wattage *',
                                suffixIcon: Icon(Icons.bolt),
                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (v) {
                                if (v!.isEmpty) {
                                  return 'Enter wattage';
                                }
                                if (double.tryParse(v) == null) {
                                  return 'Numeric value only';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Expanded(
                            flex: 2,
                            child: Container(
                              // height: 55.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                          '${_pd.pcsCntrlrs[index]} Pcs'),
                                    ),
                                  ),
                                  Container(
                                    height: 50.0,
                                    width: 25.0,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(5.0),
                                      border: Border.all(
                                        width: 0.5,
                                        color: Colors.grey[800]!,
                                      ),
                                    ),
                                    child: PopupMenuButton<int>(
                                      padding: EdgeInsets.zero,
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey[800],
                                        size: 22,
                                      ),
                                      onSelected: (v) {
                                        _pd.pcsCntrlrs[index] = v;
                                        _pd.reloadUi();
                                      },
                                      itemBuilder: (BuildContext context) =>
                                          List.generate(
                                        100,
                                        (index) => PopupMenuItem(
                                          value: index + 1,
                                          child: Text('${index + 1}'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: mainSpaceBetween,
              children: [
                _pd.totalTile > 1
                    ? KButton(
                        label: 'Remove',
                        iconData: Icons.remove,
                        onTap: () => _pd.removeTile(),
                      )
                    : const SizedBox.shrink(),
                KButton(
                  label: 'Add',
                  iconData: Icons.add,
                  onTap: () => _pd.addTile(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text('Calculate'),
              ),
              onPressed: () => _pd.calculateCost(context),
            ),
          ],
        ),
      ),
    );
  }
}

class KButton extends StatelessWidget {
  const KButton({
    Key? key,
    this.onTap,
    required this.label,
    required this.iconData,
  }) : super(key: key);

  final void Function()? onTap;
  final String label;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: kLightPrimaryColor,
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 35.0,
        width: 80.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: kLightPrimaryColor.withOpacity(0.5),
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: mainCenter,
          children: [
            Icon(
              iconData,
              size: 16.0,
              color: kLightPrimaryColor,
            ),
            const SizedBox(width: 2.0),
            Text(
              label,
              style: TextStyle(color: kLightPrimaryColor, fontSize: 13.0),
            ),
          ],
        ),
      ),
    );
  }
}
