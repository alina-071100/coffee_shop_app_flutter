import 'package:coffee_shop_app/screens/login/components/button.dart';
import 'package:coffee_shop_app/screens/login/components/textfield.dart';
import 'package:coffee_shop_app/screens/login/firebase_helper.dart';
import 'package:coffee_shop_app/screens/login/forgotten_password_page.dart';
import 'package:coffee_shop_app/screens/login/registre_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  ServicFire servis = ServicFire();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const  Color(0xFFF9F9F9),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Image.asset(
                  "assets/images/login_coffee.png",
                  height: 200,
                  // width: 250,
                ),

                // logo
                // const Icon(
                //   Icons.coffee,
                //   size: 100,
                // ),

                const SizedBox(height: 25),

                // welcome back, you've been missed!
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: usernameController,
                  labelText: 'E-mail Address',
                  hintText: 'you@example.com',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  labelText: 'Enter your password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>const  ResetPasswordScreen()));
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  onTap: () {
                    servis.loginUser(context, usernameController.text,
                        passwordController.text);
                  },
                  title: "Sign In",
                ),

                const SizedBox(height: 25),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: const Color(0xFFC67C4E),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 45),

                // google + apple sign in buttons
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     // google button
                //     SquareTile(imagePath: 'assets/images/google.png'),

                //     SizedBox(width: 25),

                //     // apple button
                //     SquareTile(imagePath: 'assets/images/apple.png')
                //   ],
                // ),

                // const SizedBox(height: 40),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrePage()));
                      },
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Color(0xFFC67C4E),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
