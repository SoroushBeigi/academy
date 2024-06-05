import 'package:academy/src/app.dart';
import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/core/services/grpc_service.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await getIt<Storage>().init();
  GrpcService().init();
  runApp(
    ResponsiveSizer(
      builder: (context, orientation, screenType) => const App(),
    ),
  );
}
