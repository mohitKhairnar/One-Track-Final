// import 'dart:developer';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:lottie/lottie.dart';
// import 'package:mini_project_ui/Screens/Login.dart';
// import 'package:email_auth/email_auth.dart';
//
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({ Key? key }) : super(key: key);
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   // final _emailauth = FirebaseAuth.instance;
//   // EmailAuth emailAuth =  new EmailAuth(sessionName: "OneTrack session");
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController cPasswordController = TextEditingController();
//
//   void createAccount() async {
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//     String cPassword = cPasswordController.text.trim();
//
//     if(email == "" || password == "" || cPassword == "") {
//       log("Please fill all the details!");
//     }
//     else if(password != cPassword) {
//       log("Passwords do not match!");
//     }
//     else {
//       try {
//         UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
//         if(userCredential.user != null) {
//           Navigator.pop(context);
//         }
//       } on FirebaseAuthException catch(ex) {
//         log(ex.code.toString());
//       }
//     }
//   }
//
//   // void sendOtp() async {
//   //   var result = await emailAuth.sendOtp(
//   //       recipientMail: emailController.value.text, otpLength: 5
//   //   );
//   //   if(result)
//   //     {
//   //       print("OTP sent");
//   //     }else
//   //       {
//   //         print("Something went wrong");
//   //       }
//   // }
//   //
//   // bool verifyOTP() {
//   //   print(emailAuth.validateOtp(
//   //       recipientMail: emailController.value.text,
//   //       userOtp: otpController.value.text));
//   // }
//   // emailAuth.validateOtp(
//   // recipientMail: _emailcontroller.value.text,
//   // userOtp: _otpcontroller.value.text)
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//
//         title: Text("Create account"),
//       ),
//       body: SingleChildScrollView(
//
//         child: Column(
//           children: <Widget> [
//
//             Padding(
//               padding: EdgeInsets.all(15),
//               child: Column(
//                 children: <Widget> [
//                 //   SizedBox(
//                 //     height: 45,
//                 //   ),
//                 // SizedBox(
//                 //   height: 200,
//                 //   child: Image.asset("images/logo.png",
//                 //   fit: BoxFit.contain,),
//                 // ),
//                 //   SizedBox(
//                 //     height: 70,
//                 //   ),
//                   Lottie.asset('assets/Register.json'),
//                   SizedBox(height: 10,),
//                   TextField(
//                     controller: emailController,
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.mail),
//                       hintText: "Email Address",
//                       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)
//                       ),
//                     ),
//                     ),
//
//
//                   SizedBox(height: 10,),
//
//                   TextField(
//                     controller: passwordController,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.key),
//                         hintText: "Password",
//                         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10)
//                         ),
//                     ),
//                   ),
//
//                   SizedBox(height: 10,),
//
//                   TextField(
//                     controller: cPasswordController,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.vpn_key),
//                       hintText: "Confirm Password",
//                       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)
//                       ),
//                     ),
//                   ),
//
//                   SizedBox(height: 100,),
//
//                   Container(
//                     height: 50,
//                     width: 150,
//                     decoration: BoxDecoration(
//                         color: Colors.blue, borderRadius: BorderRadius.circular(20)),
//                     child: FlatButton(
//                       onPressed: () {
//                         //   Navigator.push(
//                         //       context, MaterialPageRoute(builder: (_) => MyApp()));
//                         //
//                         Login();
//                       },
//                       child: Text(
//                         'Register',
//                         style: TextStyle(color: Colors.white, fontSize: 25
//                         ),
//
//                       ),
//                     ),
//                   ),
//
//                 ],
//               ),
//             )
//
//           ],
//         ),
//       ),
//     );
//   }
// }

//----------------------------------------------------------------------
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_ui/Screens/HomeScreen.dart';
import 'Login.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  var confirmPassword = "";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  registration() async {
    if (password == confirmPassword) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(userCredential);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Registered Successfully. Please Login..",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print("Password Provided is too Weak");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          print("Account Already exists");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          );
        }
      }
    } else {
      print("Password and Confirm Password doesn't match");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "Password and Confirm Password doesn't match",
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        leading: InkWell(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    labelText: 'Email: ',
                    labelStyle: TextStyle(fontSize: 20.0),
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
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key),
                    labelText: 'Confirm Password: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                ),
              ),
              Container(
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
                            confirmPassword = confirmPasswordController.text;
                          });
                          registration();
                        }
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an Account? "),
                    TextButton(
                        onPressed: () => {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation1, animation2) =>
                                  Login(),
                              transitionDuration: Duration(seconds: 0),
                            ),
                          )
                        },
                        child: Text('Login'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}