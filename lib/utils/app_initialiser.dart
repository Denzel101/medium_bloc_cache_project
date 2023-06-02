import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:medium_bloc_cache_project/utils/utils.dart';

Future<void> appInitialiser() async {
  // BindingBase.debugZoneErrorsAreFatal = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initialiseHive();
  await initialiseLocator();
}
