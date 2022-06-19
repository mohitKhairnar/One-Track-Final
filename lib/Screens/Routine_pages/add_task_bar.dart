import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../routine.dart';
import 'input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {


  final  _titleController = TextEditingController();
  final  _noteController = TextEditingController();
  final  _startTimeController = TextEditingController();
  final  _endTimeController = TextEditingController();
  final  _dateController = TextEditingController();
  final  _colorController = TextEditingController();
  final _repeatController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _date = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
  String _selectedRepeat = "None";
  int dbcheckIconColor = 0;
  bool enabled = true;
  var dbtitle = "";
  var dbnote = "";
  var dbstartTime = "";
  var dbendTime = "";
  var dbdate = "";
  var dbrepeat = "None";
  List<String> repeatList = [
    "None","Daily"
  ];
  var _selectedColor = 0;

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  clearText(){
    _titleController.clear();
    _noteController.clear();
    _startTimeController.clear();
    _endTimeController.clear();
  }
  CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
  Future<void>addUser(){
    return tasks.add({'title':dbtitle,'note':dbnote,'startTime':dbstartTime,'endTime':dbendTime,'selectedColor':_selectedColor,'checkIconColor':dbcheckIconColor,'date':dbdate,'enable':enabled,'repeat':dbrepeat})
        .then((value) => print("task added")).catchError((error)=>print('Failed to add task'));
  }
  updateUser(){
    print("User update");
  }
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFF7A9BEE),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF7A9BEE),
          title: Center(child: Text("Add Tasks       ",
            style: TextStyle(
                fontSize: 25.0

            ),)),
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
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFF7A9BEE)
              // gradient: LinearGradient(
              //   colors: [
              //     Colors.white,
              //     Color(0xFF363f93),
              //
              //   ]
              // ),
            ),
            child: Column(
              children: [
                SizedBox(
                  // height: size.height,
                  child: Stack(
                    children: <Widget>[
                      Container(

                        margin: EdgeInsets.only(top: 30),
                        height:702,
                        decoration: BoxDecoration(

                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              // bottomLeft: Radius.circular(24),
                              // bottomRight: Radius.circular(24),
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60),
                              // topRight: Radius.circular(24),
                            )
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  width: 100
                              ),
                            ],
                          ),

                          Container(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 50),
                            child: Column(
                                children: <Widget>[

                                  MyInputField(title: "Title", hint: "Enter your title",controller: _titleController),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  MyInputField(title: "Note", hint: "Enter your note",controller: _noteController,),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  MyInputField(title: "Date", hint: _date,controller: _dateController,
                                    widget: IconButton(
                                      icon: Icon(Icons.calendar_today_outlined,
                                        color: Colors.blueGrey[900],
                                      ),
                                      onPressed: (){
                                        _getDateFromUser();
                                      },
                                    ),),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(child: MyInputField(
                                        title: "Start Time",
                                        hint: _startTime,
                                        widget: IconButton(
                                          onPressed: (){
                                            _getTimeFromUser(isStartTime: true);
                                          },
                                          icon: Icon(
                                            Icons.access_time_rounded,
                                            color: Colors.blueGrey[900],
                                          ),
                                        ),controller: _startTimeController,
                                      )),
                                      SizedBox(width: 12,),
                                      Expanded(child: MyInputField(
                                        title: "End Time",
                                        hint: _endTime,
                                        widget: IconButton(
                                          onPressed: (){
                                            _getTimeFromUser(isStartTime: false);
                                          },
                                          icon: Icon(
                                            Icons.access_time_rounded,
                                            color: Colors.blueGrey[900],
                                          ),
                                        ),
                                        controller: _endTimeController,
                                      )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  MyInputField(title: "Repeat", hint: "$_selectedRepeat",controller: _repeatController,
                                    widget: DropdownButton(
                                      icon: Icon(Icons.keyboard_arrow_down,
                                        color: Colors.blueGrey[900],
                                      ),
                                      iconSize: 32,
                                      elevation: 4,
                                      style: subTitleStyle,
                                      underline: Container(height: 0,),

                                      items: repeatList.map<DropdownMenuItem<String>>((String? value){
                                        return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value!,style:TextStyle(color:Colors.grey)));
                                      }
                                      ).toList(),
                                      onChanged: (String? newValue){
                                        setState(() {
                                          _selectedRepeat = newValue!;
                                          // dbrepeat = newValue!;
                                          print(newValue);
                                          dbrepeat = _selectedRepeat;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      _colorPallete(),
                                      SizedBox(
                                        height: 50,
                                        width: 150,
                                        child: ElevatedButton(

                                          child: const Text('Save Task',
                                            style: TextStyle(color: Colors.white,
                                                fontSize: 18),),
                                          style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(Color(0xFF21BFBD)),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15.0),

                                                  )
                                              )
                                          ),
                                          onPressed: () {
                                            _validateDate();
                                          },
                                        ),
                                      ),

                                      // MyButton(label: "Create Task", onTap: ()=> _validateDate())
                                    ],
                                  )
                                ]),

                          )
                        ],

                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
  _validateDate(){

    if(_titleController.text.isNotEmpty&&_noteController.text.isNotEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("You have successfullly filled task details")));
      setState(() {
        dbtitle = _titleController.text;
        dbnote = _noteController.text;
        dbstartTime = _startTime.characters.toString();
        dbendTime = _endTime.characters.toString();
        dbdate = _date.characters.toString();
        dbcheckIconColor = 0;
        enabled = true;
        addUser();
        clearText();
      });

      Navigator.push(context,
        MaterialPageRoute(builder: (context){
          return RoutinePage();
        }),);
    }
    else if(_titleController.text.isEmpty || _noteController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(

          content: Text("All fields are mandatory")));
    }
  }
  _colorPallete(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color",
          style: titleStyle,
        ),
        SizedBox(
          height: 8,
        ),
        Wrap(
          children: List<Widget>.generate(3,
                  (int index){
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      _selectedColor = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CircleAvatar(
                        radius: 14,
                        backgroundColor: index==0?Colors.red:index==1?Colors.blue:Colors.orange,
                        child: _selectedColor==index?Icon(Icons.done,
                          color: Colors.white,
                          size: 16,
                        ):Container()
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2022), lastDate: DateTime(2500));
    if(_pickerDate!=null){
      setState(() {
        _date = DateFormat('yyyy-MM-dd').format(_pickerDate).toString();
      });
    }
    else{
      print("");
    }
  }
  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if(pickedTime==null){

    }
    else if(isStartTime==true){
      setState(() {
        _startTime = _formatedTime;
      });
    }
    else if(isStartTime==false){
      setState(() {
        _endTime = _formatedTime;
      });
    }

  }
  _showTimePicker(){
    return showTimePicker(initialEntryMode:TimePickerEntryMode.input, context: context, initialTime: TimeOfDay(
      hour: int.parse(_startTime.split(":")[0]),
      minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
    ));
  }
}