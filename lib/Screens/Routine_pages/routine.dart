// import 'package:date_picker_timeline/date_picker_widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
//
// import 'add_task_bar.dart';
// import 'list_item.dart';
// import 'list_item_widget.dart';
// import 'list_items.dart';
//
// TextStyle get subHeadingStyle{
//   return GoogleFonts.lato(
//       textStyle: TextStyle(
//         fontSize: 24,
//         fontWeight: FontWeight.bold,
//         color: Colors.blueGrey[900],
//       )
//   );
// }
// TextStyle get headingStyle{
//   return GoogleFonts.lato(
//       textStyle: TextStyle(
//         fontSize: 30,
//         fontWeight: FontWeight.bold,
//       )
//   );
// }
//
// class RoutinePage extends StatefulWidget {
//
//
//   const RoutinePage({Key? key}) : super(key: key);
//
//   @override
//   State<RoutinePage> createState() => _RoutinePageState();
// }
//
// class _RoutinePageState extends State<RoutinePage> {
//
//   final List<ListItem> items = List.from(listItems);
//   final listKey = GlobalKey<AnimatedListState>();
//   DateTime _selectedDate = DateTime.now();
//
//
//
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         appBar: AppBar(
//             backgroundColor: Color(0xFF21BFBD),
//             elevation: 0,
//             title: Center(child: Text("Daily Routine",)),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               // _addTaskBar(),
//               Container(
//                 height: size.height*0.2+50,
//                 child: Stack(
//                   children: <Widget>[
//                     Container(
//                       height: size.height*0.2,
//                       decoration: BoxDecoration(
//                           color: Color(0xFF21BFBD),
//                           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(36),bottomRight: Radius.circular(36))
//                       ),
//                       child: Container(
//
//                         margin: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 50),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//
//                               margin: EdgeInsets.symmetric(vertical: 10.0),
//                               child: Column(
//
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(DateFormat.yMMMMd().format(DateTime.now()),
//                                     style: subHeadingStyle,
//                                   ),
//                                   Text("Today",
//                                     style: headingStyle,),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               width: 150,
//                               height: 50,
//
//                               child: ElevatedButton(
//                                 child: const Text('+Add Task',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                   ),),
//                                 style: ButtonStyle(
//
//                                     backgroundColor: MaterialStateProperty.all(Color(0xFF7A9BEE)),
//                                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                                         RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(30.0),
//                                         )
//                                     )
//                                 ),
//                                 onPressed: () {
//
//                                   Navigator.push(context,
//                                     MaterialPageRoute(builder: (context) => const AddTaskPage()),);
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       left: 0,
//                       right: 0,
//                       child: Container(
//
//                         margin: EdgeInsets.symmetric(horizontal: 15),
//                         height: 110,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(
//                               color: Colors.blueGrey,
//                               width: 3,
//                             ),
//                             boxShadow:[
//                               BoxShadow(
//
//                                 offset: Offset(0,10),
//                                 blurRadius: 50,
//                                 color: Colors.white.withOpacity(0.23),
//                               ),
//                             ]
//                         ),
//                         child: Container(
//
//                           // margin: const EdgeInsets.only(top:20,left: 20),
//                           child: DatePicker(
//                             DateTime.now(),
//                             height: 95,
//                             width: 80,
//                             initialSelectedDate: DateTime.now(),
//                             selectionColor: Color(0xFF7A9BEE),
//                             selectedTextColor: Colors.white,
//                             dateTextStyle: GoogleFonts.lato(
//                               textStyle: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             dayTextStyle: GoogleFonts.lato(
//                               textStyle: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             monthTextStyle: GoogleFonts.lato(
//                               textStyle: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             onDateChange: (date){
//                               _selectedDate = date;
//                             },
//                           ),
//
//                         ),
//                       ),
//                     ),
//
//                   ],
//
//                 ),
//
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height-339+100,
//                 child: AnimatedList(
//                   key: listKey,
//                   initialItemCount: items.length,
//                   itemBuilder: (context, index, animation) => ListItemWidget(
//                     item : items[index],
//                     animation: animation,
//                     onClicked: ()=>removeItem(index),
//
//                   ),),
//
//
//               ),
//             ],
//
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//         floatingActionButton: FloatingActionButton(
//           // isExtended: true,
//             child: Icon(Icons.add),
//             backgroundColor: Color(0xFF21BFBD),
//             onPressed: ()=>insertItem()
//         ));
//   }
//   void insertItem(){
//     final newIndex = 1;
//     final newItem = (List.of(listItems)..shuffle()).first;
//     items.insert(newIndex, newItem);
//     listKey.currentState!.insertItem(
//       newIndex,
//       duration: Duration(milliseconds: 600),
//     );
//   }
//   void removeItem(int index){
//     final removedItem = items[index];
//     items.removeAt(index);
//     listKey.currentState!.removeItem(index, (context, animation) => ListItemWidget(
//       item: removedItem,
//       animation: animation,
//       onClicked: () {  },
//     ),
//         duration: Duration(milliseconds: 600));
//   }
// }