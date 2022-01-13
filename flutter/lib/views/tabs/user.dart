import 'package:flutter/material.dart';
import '../../services/user.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  @override
  Widget build(BuildContext context) {
    final builder = FutureBuilder<List>(
      future: UserService().getAllExample(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final item = snapshot.data![index];
              return Dismissible(
                key: Key(index.toString()),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  setState(() {
                    item.removeAt(index);
                  });
                },
                background: Container(
                    alignment: AlignmentDirectional.centerStart,
                    color: Colors.red,
                    child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.delete, color: Colors.white))),
                child: ListTile(
                  leading: const Icon(Icons.person),
                  subtitle: Text(item["address"]['street']),
                  title: Text(item["name"]),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );

    return Scaffold(
        body: RefreshIndicator(
            onRefresh: () async {
              UserService().getAllExample();
            },
            child: SafeArea(
              child: builder,
            )));
  }
}
