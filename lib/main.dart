import 'package:flutter/material.dart';
import 'package:designs/presentation/pages/list.dart';
import 'package:designs/presentation/pages/design/first_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.blue),
        textTheme: const TextTheme(
          button: TextStyle(color: Colors.blue),
        ),
      ),
      initialRoute: 'main-page',
      routes: {
        'main-page': (_) => const MainPage(),
        'first-design': (_) => const FirstDesign(),
      },
    );
  }
}
