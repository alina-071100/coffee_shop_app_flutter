import 'package:coffee_shop_app/screens/login/components/button.dart';
import 'package:coffee_shop_app/screens/login/components/register_button.dart';
import 'package:coffee_shop_app/screens/login/components/textfield.dart';
import 'package:coffee_shop_app/widgets/custom_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrePage extends StatefulWidget {
  const RegistrePage({super.key});

  @override
  State<RegistrePage> createState() => _RegistrePageState();
}

class _RegistrePageState extends State<RegistrePage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future registerUserIn() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: usernameController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF9F9F9),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              CustomAppBar(
                functionBackIcon: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),

              Image.asset(
                "assets/images/login_coffee.png",
                height: 200,
              ),

              const SizedBox(height: 25),

              Text(
                'Welcome to register!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              MyTextField(
                controller: usernameController,
                hintText: 'User Name',
                labelText: 'Enter your user name',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              MyTextField(
                controller: emailController,
                hintText: 'you@example.com',
                labelText: 'E-mail Address',
                obscureText: false,
              ),
              const SizedBox(height: 10),

              MyTextField(
                controller: addressController,
                hintText: 'Address',
                labelText: 'Address',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                labelText: 'Enter your password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                labelText: 'Enter your confirm password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot password?
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // sign in button
              MyButton(
                onTap: registerUserIn,
                title: "Sign Up",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
