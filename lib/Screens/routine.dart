import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mini_project_ui/Screens/upgradedr1.dart';
import 'package:icon_decoration/icon_decoration.dart';
import 'Routine_pages/add_task_bar.dart';
import 'Routine_pages/list_item.dart';
import 'Routine_pages/list_item_widget.dart';
import 'Routine_pages/list_items.dart';
import 'Routine_pages/add_task_bar.dart';
import 'Routine_pages/list_item.dart';
import 'Routine_pages/list_item_widget.dart';
import 'Routine_pages/list_items.dart';
import 'fitnessPage.dart';
import 'moneyPage.dart';
import 'package:intl/intl.dart';

TextStyle get subHeadingStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey[900],
      )
  );
}
TextStyle get headingStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      )
  );
}

class RoutinePage extends StatefulWidget {


  const RoutinePage({Key? key}) : super(key: key);

  @override
  State<RoutinePage> createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {

  final Stream<QuerySnapshot> tasksStream  = FirebaseFirestore.instance.collection('tasks').snapshots();
  final List<ListItem> items = List.from(listItems);
  final listKey = GlobalKey<AnimatedListState>();
  DateTime _selectedDate = DateTime.now();
  int navigationIndex = 0;
  bool valueOfCheckBox = false;
  bool checkedValue = false;
  int undoIndex = 0;
  int undoColor = 0;
  String undoTitle = "";
  String undoNote = "";
  String undoStartTime = "";
  String undoEndTime = "";
  String dbdate = "";
  int dbcheckIconColor = 0;
  String ffilter = "";
  String repeat = "";
  bool enableInfo = true;
  Color _iconColor = Colors.white;
  @override
  void initState() {
    super.initState();

  }

  CollectionReference tasks  = FirebaseFirestore.instance.collection('tasks');
  Future<void>deleteTask(id){
      enableInfo = true;
    return tasks.doc(id).delete().then((value)=>print('User deleted')).catchError((error)=>print('Faield to delete user: $error'));
  }
  Future<void>undoTask(id)async {
    setState(() {
      enableInfo = false;
    });
    return tasks.add({'title':undoTitle,'note':undoNote,'startTime':undoStartTime,'endTime':undoEndTime,'selectedColor':undoColor,'checkIconColor':dbcheckIconColor,'date':dbdate,'enable':enableInfo,'repeat':repeat})
        .then((value) => print("task added")).catchError((error)=>print('Failed to add task'));
  }
  Future<void>changeColor(int colorValue)async {

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return StreamBuilder<QuerySnapshot>(stream: tasksStream,builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
      // if(snapshot.hasError){
      //   print("Something went wrong");
      // }
      // if(snapshot.connectionState==ConnectionState.waiting){
      //   // print(snapshot.connectionState);
      //
      //   return Center(child: CircularProgressIndicator());
      // }
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
            ), );
      final List storedocs = [];
      snapshot.data!.docs.map((DocumentSnapshot document){
        Map a = document.data() as Map<String, dynamic>;
        storedocs.add(a);
        a['id'] = document.id;
      }).toList();
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF21BFBD),
          elevation: 0,
          title: Center(child: Text(
            "Daily Routine         ", style: TextStyle(fontSize: 25),)),
          toolbarHeight: 60,
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
        body: SingleChildScrollView(
          child: Column(
              children: [
                // _addTaskBar(),
                Container(
                  height: size.height / 3,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                            color: Color(0xFF21BFBD),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(36),
                                bottomRight: Radius.circular(36))
                        ),
                        child: Container(

                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(

                                margin: EdgeInsets.symmetric(vertical: 5.0),
                                child: Column(

                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(DateFormat.yMMMMd().format(DateTime.now()),
                                      style: subHeadingStyle,
                                    ),
                                    Text("Today",
                                      style: headingStyle,),

                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                height: 50,
                                child: ElevatedButton(

                                  child: const Text('+Add Task',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xFF7A9BEE)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            30.0),
                                      ),
                                    ),

                                  ),
                                  onPressed: () {

                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (
                                          context) => const AddTaskPage()),);
                                   },

                                ),
                              ),
                            ],
                          ),
                        ),

                      ),
                      Positioned(
                        top: 110,
                        bottom:25,
                        left: 0,
                        right: 0,

                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          height: 110,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey ,
                                    blurRadius: 2.0,
                                    offset: Offset(4.0,4.0)
                                )
                              ]
                          ),
                          child: Container(

                            // margin: const EdgeInsets.only(top:20,left: 20),
                            child: DatePicker(
                              DateTime.now(),
                              height: 95,
                              width: 80,
                              initialSelectedDate: DateTime.now(),
                              selectionColor: Color(0xFF7A9BEE),
                              selectedTextColor: Colors.white,
                              dateTextStyle: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ),
                              dayTextStyle: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ),
                              monthTextStyle: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ),
                              onDateChange: (date) {
                                setState(() {
                                  _selectedDate = date;
                                  ffilter = DateFormat('yyyy-MM-dd').format(_selectedDate).toString();
                                  print(ffilter);
                                });
                              },
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),

                ),
                SizedBox(
                  height: 0,
                ),
                for(var i = 0;i<storedocs.length;i++)...[
                  if(DateFormat('yyyy-MM-dd').format(_selectedDate).toString()==storedocs[i]['date'] || storedocs[i]['repeat']=='Daily')
                    Container(
                      child: Container(
                        margin: EdgeInsets.all(4),
                        padding: EdgeInsets.all(10),
                        height: 170.0,
                        width: 350.0,
                        decoration: BoxDecoration(
                            color: storedocs[i]['selectedColor']==0?Colors.red:storedocs[i]['selectedColor']==1?Colors.blue:Colors.orange,
                            borderRadius:BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),

                            ) ,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey ,
                                  blurRadius: 2.0,
                                  offset: Offset(4.0,4.0)
                              )
                            ]
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(storedocs[i]['title'],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),),
                                  // Text(
                                  //   storedocs[i]['date'],
                                  //   style: TextStyle(
                                  //     color: Colors.white,
                                  //     fontSize: 20,
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(storedocs[i]['note'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white
                                    ),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 2,
                                    width: 200,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.date_range,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        storedocs[i]['date'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Icon(
                                        Icons.watch_later_outlined,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(storedocs[i]['startTime']+"  --  ",
                                        style: TextStyle(color: Colors.white),),
                                      Text(storedocs[i]['endTime'],
                                        style: TextStyle(
                                            color: Colors.white
                                        ),),
                                    ],
                                  )

                                ],
                              ),
                            ),
                            Container(
                              height: 120,
                              width: 2,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              child: Column(
                                children: [

                                  IconButton(
                                    icon: Icon(Icons.check_box,
                                      color: storedocs[i]['checkIconColor']==0?Colors.white:Colors.green,
                                      size: 30,

                                    ),
                                    splashColor: Colors.grey,
                                    highlightColor: Colors.grey,
                                    focusColor: Colors.grey,
                                    hoverColor: Colors.grey,
                                    autofocus: true,
                                    onPressed: (){
                                      if(storedocs[i]['checkIconColor']==0){
                                        dbcheckIconColor = 1;
                                        setState(() {
                                          tasks.doc(storedocs[i]['id'])
                                              .update({
                                            "checkIconColor":1,
                                          }).then((result){
                                            print("new USer true");
                                          }).catchError((onError){
                                            print("onError");
                                          });
                                        });
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            duration: const Duration(seconds: 1),
                                            content: Text("Congrats you have completed your task...")));
                                      }
                                      if(storedocs[i]['checkIconColor']==1){
                                        dbcheckIconColor = 0;
                                        setState(() {
                                          tasks.doc(storedocs[i]['id'])
                                              .update({
                                            "checkIconColor":0
                                          }).then((result){
                                            print("new USer true");
                                          }).catchError((onError){
                                            print("onError");
                                          });
                                        });
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    onPressed: ()=>{
                                      undoTitle = storedocs[i]['title'],
                                      undoNote = storedocs[i]['note'],
                                      undoStartTime = storedocs[i]['startTime'],
                                      undoEndTime = storedocs[i]['endTime'],
                                      undoColor = storedocs[i]['selectedColor'],
                                      dbdate = storedocs[i]['date'],
                                      enableInfo = storedocs[i]['enable'],
                                      deleteTask(storedocs[i]['id']),
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          duration: const Duration(seconds: 2),
                                          content: Container(
                                            height: 100,
                                            child: Column(
                                              children: [
                                                Text("You have successfully deleted the task...",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20
                                                  ),),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("Want to undo the task",style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20
                                                    ),),
                                                    IconButton(
                                                        icon: Icon(Icons.undo,
                                                          color: Colors.white,
                                                          size: 20,
                                                        ),
                                                        onPressed: ()=>{
                                                          if(enableInfo==true){
                                                            undoTask(storedocs[i]['id'])
                                                          }
                                                        }),
                                                  ],
                                                )


                                              ],
                                            ),
                                          )))},
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),

                      ),

                    ),
                  
                ],
              ]),

        ),


        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 3,
            type: BottomNavigationBarType.fixed,
            iconSize: 28,
            backgroundColor: Color(0xFF21BFBD),
            landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.fitness_center_rounded,
                    color: Colors.black,
                  ),
                  label: 'Fitness'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.fastfood_rounded,
                    color: Colors.black,
                  ),
                  label: 'Diet'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.attach_money_outlined,
                    color: Colors.black,
                  ),
                  label: 'Money'),

              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.timer_rounded,
                    color: Colors.white54,
                  ),
                  label: 'Routine'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),

                  label: 'Home'),
              // BottomNavigationBarItem(icon: Icon(),label: Icons.lunch_dining_outlined),
            ],
            onTap: (int index) {
              setState(() {
                navigationIndex = index;
                switch (navigationIndex) {
                  case 0:
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) => FitnessPage()), (
                            route) => (route.isFirst));
                    break;
                  case 1:
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) => UpDiet()), (
                            route) => (route.isFirst));
                    break;
                  case 2:
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) => MoneyPage()), (
                            route) => (route.isFirst));
                    break;
                  case 3:
                    Fluttertoast.showToast(msg: "U are on the  Routine page");
                    break;
                  case 4:
                    Navigator.pop(context);
                }
              }
              );
            }
        ),
      );
    });

  }

  void insertItem() {
    final newIndex = 1;
    final newItem = (List.of(listItems)
      ..shuffle()).first;
    items.insert(newIndex, newItem);
    listKey.currentState!.insertItem(
      newIndex,
      duration: Duration(milliseconds: 600),
    );
  }

  void removeItem(int index) {
    final removedItem = items[index];
    items.removeAt(index);
    listKey.currentState!.removeItem(index, (context, animation) =>
        ListItemWidget(
          item: removedItem,
          animation: animation,
          onClicked: () {},
        ),
        duration: Duration(milliseconds: 600));
  }

}