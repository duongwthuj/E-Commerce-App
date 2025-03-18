import 'package:flutter/material.dart';
import 'package:thuctapcoso/utlis/theme/theme.dart'; // Đảm bảo đúng đường dẫn

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App'),
        ),
      ),
    );
  }
}
