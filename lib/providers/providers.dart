import 'package:provider/provider.dart' show ChangeNotifierProvider;
import 'package:provider/single_child_widget.dart' show SingleChildWidget;
import 'package:solar_cost_calculator/providers/calculation/calculation_pd.dart';

import 'theme/theme.dart';

// Create all Providers here
final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ChangeNotifierProvider(create: (_) => CalculationPd()),
];
