import 'package:flutter/material.dart';
import 'views/login.dart';
import '/views/tabs.dart';
import '/views/form.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/tabs': (context) => const TabsPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/form': (context) => const FormPage(id: ""),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoginPage());
  }
}
