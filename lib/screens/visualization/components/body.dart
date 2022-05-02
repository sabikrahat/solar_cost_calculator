import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_cost_calculator/components/kradiobutton.dart';
import 'package:solar_cost_calculator/helpers/size_config/size_config.dart';
import 'package:solar_cost_calculator/providers/calculation/calculation_pd.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int? groupValue = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: mainSpaceAround,
          children: [
            KRadioButton(
              value: 1,
              onChanged: (_) => setState(() => groupValue = 1),
              onLabelTap: () => setState(() => groupValue = 1),
              label: 'As Usual Cost',
              groupValue: groupValue!,
            ),
            KRadioButton(
              value: 2,
              onChanged: (_) => setState(() => groupValue = 2),
              onLabelTap: () => setState(() => groupValue = 2),
              label: 'Solar Cost',
              groupValue: groupValue!,
            ),
          ],
        ),
        Flexible(
          child: groupValue == 1 ? const AsUsualCost() : const SolarCost(),
        ),
      ],
    );
  }
}

class AsUsualCost extends StatefulWidget {
  const AsUsualCost({
    Key? key,
  }) : super(key: key);

  @override
  State<AsUsualCost> createState() => _AsUsualCostState();
}

class _AsUsualCostState extends State<AsUsualCost> {
  late List<GraphData> data;

  @override
  void initState() {
    var _pd = Provider.of<CalculationPd>(context, listen: false);
    double _totalCost = _pd.wattageWithHrs! * 6.0;
    data = [
      GraphData('Jan', _totalCost + Random().nextInt(300) - 150),
      GraphData('Feb', _totalCost + Random().nextInt(300) - 150),
      GraphData('Mar', _totalCost + Random().nextInt(300) - 150),
      GraphData('Apr', _totalCost + Random().nextInt(300) - 150),
      GraphData('May', _totalCost + Random().nextInt(300) - 150),
      GraphData('Jun', _totalCost + Random().nextInt(300) - 150),
      GraphData('Jul', _totalCost + Random().nextInt(300) - 150),
      GraphData('Aug', _totalCost + Random().nextInt(300) - 150),
      GraphData('Sep', _totalCost + Random().nextInt(300) - 150),
      GraphData('Oct', _totalCost + Random().nextInt(300) - 150),
      GraphData('Nov', _totalCost + Random().nextInt(300) - 150),
      GraphData('Dec', _totalCost + Random().nextInt(300) - 150),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        title: ChartTitle(text: 'As Usual Cost Analysis'),
        legend: Legend(
          isVisible: true,
        ),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries<GraphData, String>>[
          LineSeries<GraphData, String>(
            dataSource: data,
            xValueMapper: (GraphData sales, _) => sales.month,
            yValueMapper: (GraphData sales, _) => sales.value,
            name: 'Bill (Per unit 6.0 tk/-)',
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}

class SolarCost extends StatefulWidget {
  const SolarCost({
    Key? key,
  }) : super(key: key);

  @override
  State<SolarCost> createState() => _SolarCostState();
}

class _SolarCostState extends State<SolarCost> {
  late List<GraphData> data;

  @override
  void initState() {
    var _pd = Provider.of<CalculationPd>(context, listen: false);
    double _solarCost = ((_pd.solarPlate180Need! * 5000) +
        _pd.inverterPrice(_pd.inverterWattageP!) +
        _pd.batteryPrice(_pd.dcBatterySizeAH!));
    double serviceCharge = 500.0;
    data = [
      GraphData('Jan', _solarCost + Random().nextInt(1000)),
      GraphData('Feb', 0),
      GraphData('Mar', 0),
      GraphData('Apr', serviceCharge + Random().nextInt(1000)),
      GraphData('May', 0),
      GraphData('Jun', 0),
      GraphData('Jul', serviceCharge + Random().nextInt(1000)),
      GraphData('Aug', 0),
      GraphData('Sep', 0),
      GraphData('Oct', serviceCharge + Random().nextInt(1000)),
      GraphData('Nov', 0),
      GraphData('Dec', 0),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        title: ChartTitle(text: 'Solar Cost Analysis'),
        legend: Legend(
          isVisible: true,
        ),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries<GraphData, String>>[
          LineSeries<GraphData, String>(
            dataSource: data,
            xValueMapper: (GraphData sales, _) => sales.month,
            yValueMapper: (GraphData sales, _) => sales.value,
            name: 'Taka',
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}

class GraphData {
  final String month;
  final double value;

  GraphData(this.month, this.value);
}
