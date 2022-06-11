// import 'dart:developer';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:lottie/lottie.dart';
// import 'package:mini_project_ui/Screens/VerifyEmail.dart';
// import 'package:mini_project_ui/screens/signup_screen.dart';
// import 'package:mini_project_ui/screens/first_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({ Key? key }) : super(key: key);
//
//
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   void login() async {
//
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//
//     if(email == "" || password == "") {
//       log("Please fill all the fields!");
//     }
//     else {
//
//       try {
//         UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
//         if(userCredential.user != null) {
//
//           Navigator.popUntil(context, (route) => route.isFirst);
//           Navigator.pushReplacement(context, CupertinoPageRoute(
//               builder: (context) => MyApp()
//           ));
//
//         }
//       } on FirebaseAuthException catch(ex) {
//         log(ex.code.toString());
//       }
//     }
//   }
//   @override
//   void dispose(){
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: Text("User Login"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//           Lottie.asset('assets/lgin.json'),
//             Padding(
//               padding: const EdgeInsets.only(top: 60.0),
//               child: Center(
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(15),
//               child: Column(
//                 children: [
//
//
//                   TextField(
//                     controller: emailController,
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.mail),
//                         hintText: "Email Address",
//                         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)
//
//                       ),
//                     ),
//                     ),
//
//                     SizedBox(height: 10,),
//
//                     TextField(
//                     controller: passwordController,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.key),
//                     hintText: "Password",
//                     contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//                     border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10)
//                       ),
//                     ),
//                     ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                           Text("Don't have an account ? "),
//                         GestureDetector(
//                           onTap: (){
//                             Navigator.push(
//                                 context, MaterialPageRoute(builder: (_) => SignUpScreen()));
//                         },
//                           child: Text("Signup",
//                           style: TextStyle(
//                               color: Colors.teal,
//                               fontWeight: FontWeight.bold,
//                           ),),
//                         )
//                       ],
//                     ),
//                   SizedBox(
//                     height: 30,
//                   ),
//
//                     // CupertinoButton(
//                     // onPressed: () {
//                     // login();
//                     // },
//                     // color: Colors.teal,
//                     // child: Text("Login"),
//                     // ),
//
//                     // SizedBox(height: 5,),
//
//                     // CupertinoButton(
//                     // onPressed: () {
//                     //   Navigator.push(context, CupertinoPageRoute(
//                     //       builder: (context) => SignUpScreen()
//                     //   ));
//                     // },
//                     // child: Text("Create an Account", style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold),)
//               Container(
//                 height: 50,
//                 width: 150,
//                 decoration: BoxDecoration(
//                     color: Colors.teal, borderRadius: BorderRadius.circular(20)),
//                 child: FlatButton(
//                   onPressed: () {
//                   //   Navigator.push(
//                   //       context, MaterialPageRoute(builder: (_) => MyApp()));
//                   //
//                   login();
//                   },
//                   child: Text(
//                     'Login',
//                     style: TextStyle(color: Colors.white, fontSize: 25
//                     ),
//
//                   ),
//                 ),
//               ),
//
//
//
//                   ],
//
//
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }

// -------------------------------------------------------------------------------
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_project_ui/Screens/HomeScreen.dart';
import 'package:mini_project_ui/Screens/VerifyEmail.dart';
import 'package:mini_project_ui/Screens/forgetpassword_screen.dart';
import 'package:mini_project_ui/Screens/signup_screen.dart';
// import 'package:flutter_fb_auth_emailpass/pages/user/user_main.dart';
import 'first_screen.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyApp(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No User Found for that Email");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        print("Wrong Password Provided by User");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {

    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 75),
            Form(
              key: _formKey,
              child:SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                              Lottie.asset('assets/password_unlock.json'),
                            Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Center(
                    ),
                  ),
                Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          labelText: 'Email: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                          ),
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Email';
                          } else if (!value.contains('@')) {
                            return 'Please Enter Valid Email';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.key),
                          labelText: 'Password: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 60.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, otherwise false.
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  email = emailController.text;
                                  password = passwordController.text;
                                });
                                userLogin();
                              }
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          TextButton(
                            onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPassword(),
                                ),
                              )
                            },
                            child: Text(
                              'Forgot Password ?',
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an Account? "),
                          TextButton(
                            onPressed: () => {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, a, b) => Signup(),
                                    transitionDuration: Duration(seconds: 0),
                                  ),
                                      (route) => false)
                            },
                            child: Text('Signup'),
                          ),
                          // TextButton(
                          //   onPressed: () => {
                          //     Navigator.pushAndRemoveUntil(
                          //         context,
                          //         PageRouteBuilder(
                          //           pageBuilder: (context, a, b) => UserMain(),
                          //           transitionDuration: Duration(seconds: 0),
                          //         ),
                          //         (route) => false)
                          //   },
                          //   child: Text('Dashboard'),
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
    ),
    ),
            ),
          ],
        ),
      )
    );
  }
}