import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/check_user.dart';
import 'package:flutter_application_1/repository/providers/db_helper.dart';
import 'package:flutter_application_1/repository/providers/page_provider.dart';
import 'package:flutter_application_1/repository/services/authentication_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthenticationService.intializeService();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
  ));
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Pages>(create: (_) => Pages()),
        ChangeNotifierProvider<DatabaseHelper>(create: (_) => DatabaseHelper()),
      ],
      child: MaterialApp(
        theme: ThemeData(appBarTheme: const AppBarTheme()),
        debugShowCheckedModeBanner: false,
        home: CkeckUser(),
      ),
    );
  }
}
