import 'package:draggable/Chats/chatpage.dart';
import 'package:draggable/Chats/loginPage.dart';
import 'package:draggable/Chats/register.dart';
import 'package:draggable/Models/Data/db_helper.dart';
import 'package:draggable/Models/shared_preference.dart';
import 'package:draggable/SERVICES/data.dart';
import 'package:draggable/SERVICES/myhomepage.dart';
import 'package:draggable/SERVICES/selectedbutton.dart';
import 'package:draggable/Screens/drop_match.dart';
import 'package:draggable/Screens/login.dart';
import 'package:draggable/Screens/main_screen.dart';
import 'package:draggable/Storage/pick.dart';
import 'package:draggable/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'main.g.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await SimplePreferences.init(); // initialize sharedprefernce
  // DatabaseHelper.instance.database; // initialize local database(sqfile)

  // await Firebase.initializeApp(
  //   // initialize main databasef(firebase)
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(ProviderScope(
    child: Home(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drop Match Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

// final counterStateProvider = StateProvider<int>((ref) {
//   return 0;
// });

// class MyHomePage extends ConsumerWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var value = ref.watch(counterStateProvider);
//     return Scaffold(
//       body: Center(
//         child: Text(
//           'Value: $value',
//           style: Theme.of(context).textTheme.headlineMedium,
//         ),
//       ),
//       floatingActionButton: Padding(
//         padding: EdgeInsets.only(left: 30),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             FloatingActionButton(
//               // access the provider via ref.read(), then increment its state
//               onPressed: () => ref.read(counterStateProvider.state).state++,
//               child: Icon(Icons.add),
//             ),
//             Expanded(child: Container()),
//             FloatingActionButton(
//               // access the provider via ref.read(), then increment its state
//               onPressed: () => ref.read(counterStateProvider.state).state--,
//               child: Icon(Icons.remove),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//final stringLabelProvider = Provider<String>((ref) => 'Hello World');

@riverpod
String StringLabel(StringLabelRef ref) => 'Hello World Riverpod';

class Home extends ConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            ref.watch(stringLabelProvider),
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
