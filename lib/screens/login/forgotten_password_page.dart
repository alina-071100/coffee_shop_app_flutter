import 'package:coffee_shop_app/screens/login/auth_status.dart';
import 'package:coffee_shop_app/screens/login/components/textfield.dart';
import 'package:coffee_shop_app/widgets/custom_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String id = 'reset_password';
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  static final auth = FirebaseAuth.instance;
  static late AuthStatus _status;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<AuthStatus> resetPassword({required String email}) async {
    await auth
        .sendPasswordResetEmail(email: email)
        .then((value) => _status = AuthStatus.successful)
        .catchError(
            (e) => _status = AuthExceptionHandler.handleAuthException(e));

    return _status;
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _key,
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

              const SizedBox(height: 40),

              const Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color:   Color(0xFFC67C4E),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 30),
                child:  Text(
                  'Please enter your email address to recover your password.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 146, 137, 131),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // const Text(
              //   'Email address',
              //   style: TextStyle(
              //     fontSize: 15,
              //     color: Colors.black,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              const SizedBox(height: 10),
              MyTextField(
                controller: _emailController,
                labelText: 'E-mail Address',
                hintText: 'you@example.com',
                obscureText: false,
              ),

              // TextFormField(

              //   obscureText: false,
              //   controller: _emailController,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Empty email';
              //     }
              //     return null;
              //   },
              //   autofocus: false,
              //   style: const TextStyle(
              //       fontSize: 15,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.grey),
              //   decoration: const InputDecoration(
              //     contentPadding:
              //         EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              //     border: OutlineInputBorder(
              //         borderRadius:
              //             BorderRadius.all(Radius.circular(30.0))),
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.white,
              //         width: 1,
              //       ),
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(
              //           30.0,
              //         ),
              //       ),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.blue, width: 2.0),
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(
              //           30.0,
              //         ),
              //       ),
              //     ),

              //     isDense: true,
              //     // fillColor: kPrimaryColor,
              //     filled: true,
              //     errorStyle: TextStyle(fontSize: 15),
              //     hintText: 'email address',
              //     hintStyle: TextStyle(
              //         fontSize: 17,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.grey),
              //   ),
              // ),
              const SizedBox(height: 40),
              // const Expanded(child: SizedBox()),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFC67C4E),
                  // color: Colors.red,
                  child: MaterialButton(
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        final _status = await resetPassword(
                            email: _emailController.text.trim());
                        if (_status == AuthStatus.successful) {
                          //your logic
                        } else {
                          //your logic or show snackBar with error message
                        }
                      }
                    },
                    minWidth: double.infinity,
                    child: const Text(
                      'Reset password',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class ForgottenPasswordPage extends StatefulWidget {
//   @override
//   _ForgottenPasswordPageState createState() => _ForgottenPasswordPageState();
// }

// class _ForgottenPasswordPageState extends State<ForgottenPasswordPage> {
//   final TextEditingController emailController = TextEditingController();
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   static late AuthStatus _status;
//     static final auth = FirebaseAuth.instance;


//   ServicFire servis = ServicFire();

//   Future<AuthStatus> resetPassword({required String email}) async {
//     String email = emailController.text;
//     await auth.sendPasswordResetEmail(email: email)
//     .then((value) => _status = AuthStatus.successful)
//         .catchError((e) => _status = AuthExceptionHandler.handleAuthException(e));
//     return _status;


//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Password reset link sent to $email'),
//         duration: Duration(seconds: 3),
//       ),
//     );
//   }


// // Future<ForgottenPasswordPage> resetPassword({required String email}) async {
// //     await Firebase
// //         .sendPasswordResetEmail(email: _emailController)
// //         .then((value) => _status = AuthStatus.successful)
// //         .catchError((e) => _status = AuthExceptionHandler.handleAuthException(e));
// //     return _status;
// //   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       key: _scaffoldKey,
//       backgroundColor: Color(0xFFF9F9F9),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30.0),
//           child: Column(
//             children: [
//               CustomAppBar(
//                 functionBackIcon: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               const SizedBox(height: 10),

//               Image.asset(
//                 "assets/images/login_coffee.png",
//                 height: 200,
//               ),

//               const SizedBox(height: 25),

//               Text(
//                 'Reset Password Page!',
//                 style: TextStyle(
//                   color: Colors.grey[700],
//                   fontSize: 16,
//                 ),
//               ),

//               SizedBox(
//                 height: 50,
//               ),
              
//               MyTextField(
//                 controller: emailController,
//                 labelText: 'E-mail Address',
//                 hintText: 'you@example.com',
//                 obscureText: false,
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Container(
//                 height: 65,
//                 width: 200,
//                 child: MyButton(
//                   onTap: () {
//                     resetPassword(email: '');
//                   },
//                   title: "Reset Password",
//                 ),
//               ),
          
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
