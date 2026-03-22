import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'widgets/global_appbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Widget currentScreen = const LoginScreen();

  void navigate(Widget screen) {
    setState(() {
      currentScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1E1F22),
      ),

      home: Scaffold(
        appBar: GlobalAppBar(navigate: navigate),
        body: currentScreen,
      ),
    );
  }
}