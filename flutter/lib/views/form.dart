import 'package:flutter/material.dart';
import '/views/tabs.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPage createState() => _FormPage();
}

class _FormPage extends State<FormPage> {

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  String _language = 'ES';
  final _city = TextEditingController();
  double _latitude = 90.0;
  double _longitude = 180.0;

  @override
  Widget build(BuildContext context) {

    final form = Column(mainAxisSize: MainAxisSize.min, children: [
      Text('New user', style: Theme.of(context).textTheme.headline4),
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
          controller: _email,
          decoration: const InputDecoration(labelText: 'Email'),
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
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: _city,
          decoration: const InputDecoration(labelText: 'City'),
        ),
      ),
      DropdownButton<String>(
        value: _language,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? newValue) {
          setState(() {
            _language = newValue!;
          });
        },
        items:
            <String>['ES', 'EN'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value == 'ES' ? 'Spanish' : 'English'),
          );
        }).toList(),
      ),
      const Divider(color: Colors.transparent),
      Text('Latitude: $_latitude'),
      Slider(
        value: _latitude,
        max: 90.0,
        min: -90.0,
        onChanged: (double newValue) {
          setState(() {
            _latitude = newValue;
          });
        },
      ),
      const Divider(color: Colors.transparent),
      Text('Longitude: $_longitude'),
      Slider(
        value: _longitude,
        max: 180.0,
        min: -180.0,
        onChanged: (double newValue) {
          setState(() {
            _longitude = newValue;
          });
        },
      )
    ]);

    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(child:form)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TabsPage()),
        ),
        tooltip: 'Save',
        child: const Icon(Icons.check),
      ),
    );
  }
}
