import 'package:flutter/material.dart';
import '../../services/user.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _items = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    final list = ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];
        return Dismissible(
          key: Key(item),
          direction: DismissDirection.startToEnd,
          onDismissed: (direction) {
            setState(() {
              _items.removeAt(index);
            });
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('$item dismissed')));
          },
          background: Container(
              alignment: AlignmentDirectional.centerStart,
              color: Colors.red,
              child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.delete, color: Colors.white))),
          child: ListTile(
            title: Text(item),
          ),
        );
      },
    );

    /*final builder = FutureBuilder(
      future: UserService().getAllExample(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.toString());
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );*/

    return Scaffold(
        body: RefreshIndicator(
            onRefresh: () async {
              UserService().getAllExample();
            },
            child: SafeArea(
              child: list,
            )));
  }
}
