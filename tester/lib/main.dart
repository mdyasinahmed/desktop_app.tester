import 'package:flutter/material.dart';
import 'package:tester/ui/screens/home_screen.dart';
import 'package:tester/ui/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // This removes the debug banner
      home: SplashScreenWrapper(),
    );
  }
}

class SplashScreenWrapper extends StatefulWidget {
  @override
  _SplashScreenWrapperState createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  Future<void> _simulateLoading() async {
    await Future.delayed(Duration(seconds: 5)); // Simulate loading
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomeScreen()), // Navigate to your main page
    );
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(); // Display splash screen
  }
}
