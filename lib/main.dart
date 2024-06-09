import 'package:flutter/material.dart';

import 'package:skycast/app.dart';
import 'package:skycast/bindings/general_bindings.dart';

void main() {
  GeneralBindings().dependencies();

  runApp(const App());
}
