import 'package:carting/app/app.locator.dart';
import 'package:carting/app/app.router.dart';
import 'package:carting/app/app.theme.dart';
import 'package:carting/views/cart/cart_v.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo',
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: CartView.routeName,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
