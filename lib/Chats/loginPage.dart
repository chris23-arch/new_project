import 'package:draggable/Chats/chatpage.dart';
import 'package:draggable/Chats/register.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
            .whenComplete(() {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                email: email,
              ),
            ),
          );
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          if (kDebugMode) {
            print('No user found for that email.');
          }
        } else if (e.code == 'wrong-password') {
          if (kDebugMode) {
            print('Wrong password provided for that user.');
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 40,
              ),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Email',
                enabled: true,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                final emailValid = EmailValidator.validate(value!);

                if (value.isEmpty) {
                  return "Email cannot be empty";
                } else if (!emailValid) {
                  return "Please enter a valid email";
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: _isObscure3,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure3 ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure3 = !_isObscure3;
                      });
                    }), 
                filled: true,
                fillColor: Colors.white,
                hintText: 'Password',
                enabled: true,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "password cannot be empty";
                } else if (value.length < 6) {
                  return ("please enter valid password min. 6 character");
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              elevation: 5.0,
              height: 40,
              onPressed: () {
                setState(() {
                  visible = true;
                });
                signIn(
                  emailController.text,
                  passwordController.text,
                );
              },
              color: Colors.white,
              child: const Text(
                "Login",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: visible,
              child: const SizedBox(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Do Not Have An Account ?",
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    var route = MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    );
                    Navigator.push(context, route);
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
