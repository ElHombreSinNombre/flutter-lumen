import 'package:flutter/material.dart';
import '../../services/user.dart';
import '/views/form.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late Future _futureUsers;

  @override
  void initState() {
    super.initState();
    getValue();
  }

  Future getValue() async {
    _futureUsers = UserService().getAll();
  }

  @override
  Widget build(BuildContext context) {
    final userList = FutureBuilder(
      future: _futureUsers,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final item = snapshot.data![index];
              return Dismissible(
                key: Key(index.toString()),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  UserService()
                      .delete(item.id)
                      .then((value) => snapshot.data.removeAt(index));
                },
                background: Container(
                    alignment: AlignmentDirectional.centerStart,
                    color: Colors.red,
                    child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.delete, color: Colors.white))),
                child: ListTile(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                                builder: (context) =>
                                    FormPage(id: item.id.toString())),
                          )
                    },
                  leading: const Icon(Icons.person),
                    title: Text(item.name)
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
              setState(() {});
            },
            child: SafeArea(
              child: userList)));
  }
}
