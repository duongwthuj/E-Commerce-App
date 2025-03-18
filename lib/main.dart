import 'package:flutter/material.dart';
import 'package:thuctapcoso/utlis/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? TAppTheme.darkTheme : TAppTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(title: Text("Chuyển đổi Theme")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Chế độ hiện tại: ${isDarkMode ? "Dark" : "Light"}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: toggleTheme,
                child: Text("Chuyển đổi Theme"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
