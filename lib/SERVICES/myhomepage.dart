import 'package:draggable/DIRECTORY/dataprovider.dart';
import 'package:draggable/MODEL/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(UserDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod"),
      ),
      body: _data.when(
          data: (_data) {
            List<UserModel> userList = _data.map((e) => e).toList();
            return Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (_, index) {
                    return Card(
                      color: Colors.blue,
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          userList[index].category,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          userList[index].name,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage(userList[index].image),
                        ),
                      ),
                    );
                  },
                ))
              ],
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
