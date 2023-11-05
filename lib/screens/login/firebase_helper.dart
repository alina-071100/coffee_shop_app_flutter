import 'package:coffee_shop_app/screens/login/login_page.dart';
import 'package:coffee_shop_app/widgets/navigator_widget.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ServicFire {
  final auth = FirebaseAuth.instance;

  void createUser(
      context, String email, String password, String confirmPassword) async {
    try {
      if (password != confirmPassword) {
        throw Exception("Your email or password is wrong.");
      } else {
        await auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()))
                });
      }
    } catch (e) {
      errorBox(context, e);
    }
  }

  void loginUser(context, String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NavigatorWidget()))
              });
    } catch (e) {
      errorBox(context, e);
    }
  }

  void signOut(context) async {
    try {
      await auth.signOut().then((value) => {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false)
          });
    } catch (e) {
      errorBox(context, e);
    }
  }

  void errorBox(context, e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(e.toString()),
          );
        });
  }
}
