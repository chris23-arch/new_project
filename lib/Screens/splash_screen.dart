import 'dart:async';

import 'package:draggable/Models/shared_preference.dart';
import 'package:draggable/Screens/login.dart';
import 'package:draggable/Screens/main_screen.dart';
import 'package:flutter/material.dart';

class SplashScree extends StatefulWidget {
  const SplashScree({super.key});

  @override
  State<SplashScree> createState() => _SplashScreeState();
}

class _SplashScreeState extends State<SplashScree> {
  final name = SimplePreferences.getName();

  @override
  void initState() {
    Timer(
      const Duration(seconds: 5),
      () async {
        if (name == '') {
          var route = MaterialPageRoute(
            builder: (context) => const Login(),
          );
          Navigator.push(context, route);
        } else {
          var route = MaterialPageRoute(
            builder: (context) => const MainScreen(),
          );
          Navigator.push(context, route);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        color: Colors.white10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: size.height / 2,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                image: const DecorationImage(
                  image: AssetImage("assets/images/animal3.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              "DROP MATCH GAME",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.lightBlueAccent,
              ),
            ),
            const CircularProgressIndicator(
              color: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
