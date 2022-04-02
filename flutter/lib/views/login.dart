import 'package:flutter/material.dart';
import 'tabs.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {

  @override
  void initState() {
    super.initState();
  }

  final _name = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final form = Column(mainAxisSize: MainAxisSize.min, children: [
      const Icon(Icons.maps_home_work_rounded, size: 80, color: Colors.black),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: _name,
          decoration: const InputDecoration(labelText: 'Name'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: _password,
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          decoration: const InputDecoration(labelText: 'Password'),
        ),
      ),
       ElevatedButton(
        style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20), minimumSize: const Size.fromHeight(40),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TabsPage()),
          );
        },
        child: const Text('Login'),
      ),
    ]);

    return Scaffold(
      body: SafeArea(child: Center(child: SingleChildScrollView(child:form))),
    );
  }
}
