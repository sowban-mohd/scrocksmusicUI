import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srocksmusicapp/firebase_options.dart';
import 'package:srocksmusicapp/repository/repository.dart';
import 'package:srocksmusicapp/core/service_locator.dart';
import 'package:srocksmusicapp/view/home_screen_view.dart';
import 'package:srocksmusicapp/viewmodel/home_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupLocator();


  runApp(
    DevicePreview(
      builder:
          (_) => ChangeNotifierProvider(
            create: (_) => HomeViewmodel(repo : getIt<Repository>()),
            child: const MyApp(),
          ),
      enabled: true,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,
      title: 'S rocks music app',
      home: HomeScreenView(),
    );
  }
}
