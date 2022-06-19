import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_project_ui/Screens/forgetpassword_screen.dart';
import 'package:mini_project_ui/Screens/signup_screen.dart';
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
  bool isLoading = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  userLogin() async {
    try {
      showDialog(context: context, builder: (context){
        return Center(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0,end: 1.0),
                    duration: Duration(seconds: 4),
                    builder: (context,value, _)=>
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          value: value,
                          backgroundColor: Colors.white,
                          strokeWidth: 4,),
                ), )
              ],
            ));
      });

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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "No user found !",
              style: TextStyle(fontSize: 14.0, color: Colors.white),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Wrong Password entered!",
              style: TextStyle(fontSize: 14.0, color: Colors.white),
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
          SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('One',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 69.0)),
              SizedBox(width: 5.0),
              Text('Track',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.lightBlueAccent,
                      fontSize: 30.0))
            ],
          ),
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      height: 355,
                      child: Lottie.asset('images/ll.json')),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 2.0),
                              ),
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.black54,
                              ),
                              labelText: 'Email: ',
                              labelStyle: TextStyle(
                                  fontSize: 16.0, color: Colors.blueGrey),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 15, 20, 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorStyle: TextStyle(
                                  color: Colors.black, fontSize: 14),
                            ),
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Email';
                              } else if (!value.contains('@')) {
                                return 'Please enter valid email';
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
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 2.0),
                              ),
                              prefixIcon: Icon(
                                Icons.key,
                                color: Colors.black54,
                              ),
                              labelText: 'Password: ',
                              labelStyle: TextStyle(
                                  fontSize: 16.0, color: Colors.blueGrey),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 15, 20, 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              errorStyle: TextStyle(
                                  color: Colors.black, fontSize: 14),
                            ),
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.orangeAccent),
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
                                  style: TextStyle(fontSize: 18.0),),),
                              Center(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.black),
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
                                    style: TextStyle(fontSize: 21.0),
                                  ),
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
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.blueGrey),
                                  ),
                                ),
                              ),
                        //   ),
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an Account?",
                              style: TextStyle(fontSize: 16),
                            ),
                            TextButton(
                              onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()),
                                  // transitionDuration: Duration(seconds: 0),
                                ),
                                // (route) => false)
                              },
                              child: Text(
                                'Signup',
                                style: TextStyle(
                                    fontSize: 21, color: Colors.lightBlue),
                              ),
                            ),
                        ],
                        ),
                        ],),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
