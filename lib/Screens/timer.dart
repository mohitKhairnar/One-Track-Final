import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Screens/round-button.dart';
import 'package:mini_project_ui/Screens/fitness_pages/yoga_details.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:firebase_core/firebase_core.dart';

class CountdownPage extends StatefulWidget {
  final time;
  final name;

  final cn;
  const CountdownPage({Key? key, this.time, this.name,this.cn}) : super(key: key);

  @override
  _CountdownPageState createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isAdd = false;
  bool isPlaying = false;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${controller.duration!.inHours}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  Duration parseDuration(String s) {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }

  Future<void> addData() async {
    print("Hello");
    final User? user = auth.currentUser;
    final uid = user?.uid;
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    var dur = Duration(seconds: (widget.time == null ? 60 : widget.time));
    Duration count = controller.duration! * controller.value;
    int? cals = controller.duration?.inSeconds;
    print("-----------------------------");
    print(cals);
    // replace 10 to cal wrt hr
    double calb = ((10 * cals!)/3600);
    await firebaseFirestore
        .collection('${widget.cn}')
        .doc(uid)
        .collection(date.toString()).doc('${widget.name}')
        .set({'time': (controller.duration).toString(),'${widget.cn}Name':widget.name,'cal':calb}).then((value) {
      print("Data Added");
    }).catchError((onError) {
      print(onError.toString());
    });
    final querySnapshot = await FirebaseFirestore.instance
        .collection('${widget.cn}').doc(uid).get();
    Map<String, dynamic>? data = querySnapshot.data();
    // print('--------------------->');
    // print(data);
    if(data == null){
      await firebaseFirestore.collection('${widget.cn}')
          .doc(uid)
          .set({date.toString(): (controller.duration).toString(),(date.toString()+"cal"): calb });
      return;
    }

    var tmp = data[date.toString()];
    double tcalb = data[date.toString()+"cal"] + calb;
    var ans ;
    if(tmp == null){
      ans = controller.duration;
    } else {
      ans = parseDuration(tmp);
      ans = ans + controller.duration;
      // ans = ans.add(controller.duration);
    }
    // print('---------------------------------------');
    // print(ans);
    // print('---------------------------------------');
    await firebaseFirestore.collection('${widget.cn}')
        .doc(uid)
        .set({date.toString(): ans.toString(),(date.toString()+"cal"): tcalb});
    setState(() {
      isAdd = true;
    });
  }

  Future<void> notify()  async {
    print(countText);
    if (countText == '0:00:00') {
      controller.clearListeners();
      FlutterRingtonePlayer.playNotification();
      if(isAdd == false)
        await addData();
        isAdd = true;
        return;
    }
    return;
  }

  @override
  void initState() {
    super.initState();
    print(widget.time);
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: (widget.time == null ? 60 : widget.time)),
    );

    controller.addListener(() async {
      await notify();
      if (countText == '0:00:00'){
        controller.clearListeners();
        return;
      }
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF7A9BEE),
        appBar: AppBar(
          backgroundColor: Color(0xFF7A9BEE),
          elevation: 0,
          toolbarHeight: 80,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey.shade300,
                      value: progress,
                      strokeWidth: 6,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (controller.isDismissed) {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            height: 300,
                            child: CupertinoTimerPicker(
                              initialTimerDuration: controller.duration!,
                              onTimerDurationChanged: (time) {
                                setState(() {
                                  controller.duration = time;
                                });
                              },
                            ),
                          ),
                        );
                      }
                    },
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) => Text(
                        countText,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (controller.isAnimating) {
                        controller.stop();
                        setState(() {
                          isPlaying = false;
                        });
                      } else {
                        controller.reverse(
                            from:
                            controller.value == 0 ? 1.0 : controller.value);
                        setState(() {
                          isPlaying = true;
                        });
                      }
                    },
                    child: RoundButton(
                      icon: isPlaying == true ? Icons.pause : Icons.play_arrow,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(24)),
                  GestureDetector(
                    onTap: () {
                      controller.reset();
                      setState(() {
                        isPlaying = false;
                      });
                    },
                    child: RoundButton(
                      icon: Icons.stop,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
