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
            SizedBox(height: 45),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('One',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 55.0)),
                SizedBox(width: 5.0),
                Text('Track',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.orangeAccent,
                        fontSize: 30.0))
              ],
            ),
            Form(
              key: _formKey,
              child:SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                              Lottie.asset('assets/password_unlock.json'),
                            Padding(
                    padding: const EdgeInsets.only(top: 25.0),
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
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orangeAccent, width: 2.0),
                          ),
                          prefixIcon: Icon(Icons.mail,color: Colors.orangeAccent,),
                          labelText: 'Email: ',
                          labelStyle: TextStyle(fontSize: 20.0,color: Colors.orangeAccent),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
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
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orangeAccent, width: 2.0),
                          ),
                          prefixIcon: Icon(Icons.key,color: Colors.orangeAccent,),
                          labelText: 'Password: ',
                          labelStyle: TextStyle(fontSize: 20.0,color: Colors.orangeAccent),
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
                            style:ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                            ),
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
                            child: Center(
                              child: Text(
                                'Forgot Password ?',
                                style: TextStyle(fontSize: 16.0,color: Colors.orangeAccent),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an Account?",style: TextStyle(fontSize: 18),),
                          TextButton(
                            onPressed: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()),
                                    // transitionDuration: Duration(seconds: 0),
                                  ),
                                      // (route) => false)
                            },
                            child: Text('Signup',style: TextStyle(fontSize: 21,color: Colors.orangeAccent),),
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