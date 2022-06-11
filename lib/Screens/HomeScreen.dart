import 'package:flutter/material.dart';
import 'package:mini_project_ui/Screens/Login.dart';
import 'Login.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  _HomeScreenPageState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff96dfdf),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                top: 50,
                left: 30,
                right: 30,
              ),
              decoration: const BoxDecoration(
                color: Color(0xff96dfdf),
                // image: DecorationImage(
                //   image: AssetImage('images/intro-bg.png'),
                //   fit: BoxFit.scaleDown,
                //   alignment: Alignment.bottomCenter,
                // ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // Text(
                  //   'Home \nFor Pet',
                  //   style: TextStyle(
                  //     fontSize: 30,
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  Expanded(
                      child: Image(image: AssetImage('images/WelcomeToHome.png'))),
                ],
              ),
            ),
          ),
          Expanded(
            child: ClipPath(
              clipper: ClipPathClass(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(25),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Text(
                    //   'OneTrack',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 35,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    const SizedBox(height: 25),
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Providing one stop solution\n to all your problems\n',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff949494),
                            ),
                          ),
                          TextSpan(
                            text: 'Guest Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    GestureDetector(
                      onTap: () {
                        print('Button Clicled');
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const HomePage(),
                        //   ),
                        // );
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) =>  Login()),
                                (Route<dynamic> route) => false);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(55)),
                          color: Colors.teal,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Icon(
                                  Icons.chevron_right,
                                  size: 35,
                                  color: Color(0xff96dfdf),
                                )),
                            const Expanded(
                              child: Text(
                                'Get Started',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height),
      radius: size.height - 5,
    ));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}