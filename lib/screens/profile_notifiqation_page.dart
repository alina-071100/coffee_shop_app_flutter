import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop_app/screens/login/firebase_helper.dart';
import 'package:coffee_shop_app/theme/app_theme.dart';
import 'package:coffee_shop_app/widgets/profil_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var loginUser = FirebaseAuth.instance.currentUser;

class ProfileNotificationPage extends StatefulWidget {
  const ProfileNotificationPage({super.key});

  @override
  State<ProfileNotificationPage> createState() =>
      _ProfileNotificationPageState();
}

class _ProfileNotificationPageState extends State<ProfileNotificationPage> {
  Service service = Service();
  final storeMessage = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  TextEditingController messageController = TextEditingController();

  getCurrentUser() {
    final user = auth.currentUser;

    if (user != null) {
      loginUser = user;
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  Future<String?> getUserName() async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(loginUser!.uid)
        .get();
    if (userDoc.exists) {
      return userDoc.get('name');
    } else {
      return null;
    }
  }

  ServicFire servicFire = ServicFire();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 249, 249),
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Center(
                      child: Text(
                        "Profile",
                        style: GoogleFonts.sora(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2F2D2C),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              CircleAvatar(
                backgroundColor:
                    const Color.fromARGB(255, 161, 99, 13).withOpacity(0.07),
                radius: 50,
                child: const Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 104, 93, 93),
                  size: 60,
                ),
              ),
              const SizedBox(height: 20),

              Text(loginUser!.email.toString()),
              const Divider(),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(
                  title: "Settings", icon: Icons.settings, onPress: () {}),
              ProfileMenuWidget(
                  title: "Billing Details", icon: Icons.wallet, onPress: () {}),
              ProfileMenuWidget(
                  title: "User Management",
                  icon: Icons.supervised_user_circle,
                  onPress: () {}),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Information", icon: Icons.info, onPress: () {}),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      radius: 20,
                      child: InkWell(
                        onTap: () {
                          servicFire.signOut(context);
                        },
                        child: const Icon(
                          Icons.logout,
                          color: AppTheme.buttonColor,
                          size: 25,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text('Log Out',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.apply(color: Colors.black)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
