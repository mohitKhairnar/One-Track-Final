import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_project_ui/Screens/signup_screen.dart';
import 'package:mini_project_ui/screens/Login.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  var email = "";

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Password reset email has been sent !',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              'No user found .',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(child: (Text("",))),
        backgroundColor: Color(0xff393940),
        leading: InkWell(
          onTap: (){
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body:
      Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/forget.png'), fit:BoxFit.fitWidth),
        ),
        child: Column(
          children: [
            Lottie.asset('assets/forgot_password.json'),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                'Reset link will be sent to your email id !',
                style: TextStyle(fontSize: 20.0,color:Colors.black),
              ),
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: ListView(
                    children: [
                      // SizedBox(height: 200,),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54, width: 2.0),
                            ),
                            prefixIcon: Icon(Icons.mail,color: Colors.black,),
                            labelText: 'Email: ',
                            labelStyle: TextStyle(fontSize: 20.0,color: Colors.black),
                            border: OutlineInputBorder(
                              borderSide:BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                                borderRadius: BorderRadius.circular(10),
                                // color: Colors.white,
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
                      SizedBox(height: 10,),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.black),
                              ),
                              onPressed: () {

                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    email = emailController.text;
                                  });
                                  resetPassword();
                                }
                              },
                              child: Text(
                                'Send Email',
                                style: TextStyle(fontSize: 18.0,),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25,),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an Account? ",
                              style: TextStyle(fontSize: 22.0,color:Colors.black),),
                            TextButton(
                                onPressed: () => {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, a, b) =>
                                            Signup(),
                                        transitionDuration:
                                        Duration(seconds: 0),
                                      ),
                                          (route) => false)
                                },
                                child: Text('Signup',style: TextStyle(color: Colors.white,fontSize: 23),))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}