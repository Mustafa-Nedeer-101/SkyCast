import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skycast/bindings/general_bindings.dart';
import 'package:skycast/weather/screens/home/home.dart';
import 'package:skycast/utils/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: CustomAppTheme.lightTheme,
        darkTheme: CustomAppTheme.darkTheme,
        // Initial Binding
        initialBinding: GeneralBindings(),
        home: const HomePage(),
      ),
    );
  }
}
