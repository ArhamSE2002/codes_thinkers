import 'package:codes_thinkers/screens/admin/attendance/secondpage.dart';
import 'package:flutter/material.dart';
import 'string_extension.dart';



      
class AttendanceSheet extends StatefulWidget {
  const AttendanceSheet({super.key, required this.title});
  final String title;

  @override
  State<AttendanceSheet> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AttendanceSheet> {
 
  bool isStudent = false;
  bool isTeacher = false;
  bool isEmployee = false;
  bool isOthers = false;
  bool isAgree = false;

  String? isMale = 'Male';
  String? isFemale = 'Female';
  String? groupValue = 'Gender';
GlobalKey<FormState> formKey = GlobalKey<FormState>();


  void _incrementCounter() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).push(PageRouteBuilder(
        pageBuilder: (context, animation, secondryAnimation) =>
            const SecondPage(),
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
                position: animation.drive(Tween<Offset>(
                    begin: const Offset(0, -1), end: Offset.zero)),
                child: child),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please Enter Valid Nbr')));
    }
  }
  
 

  @override
  Widget build(BuildContext context) {
    
    
    
    
    
    
    return Scaffold(
      // appBar: AppBar(
        
        
        
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        
      //   title: Text(widget.title),
      // ),
     
         body: Stack(
           children: [
            Form(key: formKey,
            child: Row(
              children: [  
                Container( 
                  width: 950,height: 525,
                   child: const Positioned(
                    left: 440,
                     child: Text(
                          'Student Attendance Sheet',
                          style: TextStyle(
                             color: Colors.black,
                             fontSize: 20, fontWeight: FontWeight.bold),),
                   ))
                        ]),
         ),
         Positioned( child: Container(
                    height: 590,
                    width: 1050,
                    color: const Color.fromARGB(255, 217, 215, 209),
                  )),
                  
                   const Positioned(
                      left: 370,
                      // top: 10,
                      child: Text(
                        'Student Attendance Sheet',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )
                      ),
                 const Positioned(
                      // left: 370,
                      top: 20,
                      child: Text(
                        'Name',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )
                      ),
                 const Positioned(
                      left: 100,
                      top: 20,
                      child: Text(
                        'E_mail',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )
                      ),
                        const Positioned(
                      left: 200,
                      top: 20,
                      child: Text(
                        'CellNo',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )
                      ),
                 const Positioned(
                      left: 300,
                      top: 20,
                      child: Text(
                        'Shift Timing',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )
                      ),
                        const Positioned(
                      left: 450,
                      top: 25,
                      child: Text(
                        'Monday',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      )
                      ), 
                       const Positioned(
                      left: 530,
                      top: 25,
                      child: Text(
                        'Tuesday',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      )
                      ),
                       const Positioned(
                      left: 600,
                      top: 25,
                      child: Text(
                        'Wednesday',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      )
                      ), const Positioned(
                      left: 700,
                      top: 25,
                      child: Text(
                        'Thursday',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      )
                      ),
                       const Positioned(
                      left: 800,
                      top: 25,
                      child: Text(
                        'Friday',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      )
                      ), const Positioned(
                      left: 900,
                      top: 25,
                      child: Text(
                        'Saturday',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      )
                      ),
                  Column(
                    children: [
                      Positioned(
                          //  left: 200,
                           top: 10,
                          child: Container(margin: EdgeInsets.only(top: 60),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Student Name',
                                       border: OutlineInputBorder(),
                              ),
                            ),
                          )),
                      Positioned(
                          // left: 200,
                           top: 10,
                         child: Container(
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Student Name',
                                       border: OutlineInputBorder(),
                              ),
                            ),
                          )),
                      Positioned(
                          // left: 200,
                           top: 10,
                          child: SizedBox(
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Student Name',
                                       border: OutlineInputBorder(),
                              ),
                            ),
                          )),
                      Positioned(
                          // left: 200,
                        top: 10,
                          child: SizedBox(
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Student Name',
                                       border: OutlineInputBorder(),
                              ),
                            ),
                          )),
                      Positioned(
                          // left: 200,
                         top: 10,
                          child: SizedBox(
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Student Name',
                                       border: OutlineInputBorder(),
                              ),
                            ),
                          )),
                      Positioned(
                          // left: 200,
                           top: 10,
                          child: SizedBox(
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Student Name',
                                       border: OutlineInputBorder(),
                              ),
                            ),
                          )),
                     Positioned(
                          // left: 200,
                           top: 10,
                          child: SizedBox(
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Student Name',
                                       border: OutlineInputBorder(),
                              ),
                            ),
                          )),
                     Positioned(
                          // left: 200,
                           top: 10,
                          child: SizedBox(
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Student Name',
                                       border: OutlineInputBorder(),
                              ),
                            ),
                          )),
                     Positioned(
                          // left: 200,
                           top: 10,
                          child: SizedBox(
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Student Name',
                                       border: OutlineInputBorder(),
                              ),
                            ),
                          )),
                     Positioned(
                          // left: 200,
                           top: 10,
                          child: SizedBox(
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Student Name',
                                       border: OutlineInputBorder(),
                              ),
                            ),
                          )),
                     Positioned(
                          // left: 200,
                           top: 10,
                          child: SizedBox(
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Student Name',
                                       border: OutlineInputBorder(),
                              ),
                            ),
                          )), Positioned(
                          // left: 200,
                           top: 10,
                          child: SizedBox(
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Student Name',
                                       border: OutlineInputBorder(),
                              ),
                            ),
                          )), Positioned(
                          // left: 200,
                           top: 10,
                          child: SizedBox(
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Student Name',
                                       border: OutlineInputBorder(),
                              ),
                            ),
                          )), Positioned(
                          // left: 200,
                           top: 10,
                          child: SizedBox(
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Student Name',
                                       border: OutlineInputBorder(),
                              ),
                            ),
                          )), Positioned(
                          // left: 200,
                           top: 10,
                          child: SizedBox(
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Student Name',
                                       border: OutlineInputBorder(),
                              ),
                            ),
                          )), Positioned(
                          // left: 200,
                           top: 10,
                          child: SizedBox(
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Student Name',
                                       border: OutlineInputBorder(),
                              ),
                            ),
                          )), Positioned(
                          // left: 200,
                           top: 10,
                          child: SizedBox(
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Student Name',
                                       border: OutlineInputBorder(),
                              ),
                            ),
                          )), Positioned(
                          // left: 200,
                           top: 10,
                          child: SizedBox(
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Student Name',
                                       border: OutlineInputBorder(),
                              ),
                            ),
                          )),
                 
                       Positioned(
                      // left: 200,
                       top: 10,
                      child: SizedBox(
                        height: 20,
                        width: 100,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Student Name',
                 border: OutlineInputBorder(),
                          ),
                        ),
                      )),]),
                 
                Column(
                  children: [
                    Positioned(
                          right: 400,
                          top: 130,
                          child: Container(margin: EdgeInsets.only(left: 100,top: 60),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'E-Mail',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isValidAdd()
                                    ? null
                                    : 'Invalid email Address';
                              },
                            ),
                          )),

                           Positioned(
                          left: 400,
                          top: 130,
                          child: Container(margin: EdgeInsets.only(left: 100),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'E-Mail',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isValidAdd()
                                    ? null
                                    : 'Invalid email Address';
                              },
                            ),
                          )),
                            Positioned(
                          left: 400,
                          top: 130,
                          child: Container(margin: EdgeInsets.only(left: 100),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'E-Mail',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isValidAdd()
                                    ? null
                                    : 'Invalid email Address';
                              },
                            ),
                          )),  
                          Positioned(
                          left: 400,
                          top: 130,
                          child: Container(margin: EdgeInsets.only(left: 100),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'E-Mail',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isValidAdd()
                                    ? null
                                    : 'Invalid email Address';
                              },
                            ),
                          )),
                            Positioned(
                          left: 400,
                          top: 130,
                          child: Container(margin: EdgeInsets.only(left: 100),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'E-Mail',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isValidAdd()
                                    ? null
                                    : 'Invalid email Address';
                              },
                            ),
                          )),  Positioned(
                          left: 400,
                          top: 130,
                          child: Container(margin: EdgeInsets.only(left: 100),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'E-Mail',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isValidAdd()
                                    ? null
                                    : 'Invalid email Address';
                              },
                            ),
                          )),  Positioned(
                          left: 400,
                          top: 130,
                          child: Container(margin: EdgeInsets.only(left: 100),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'E-Mail',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isValidAdd()
                                    ? null
                                    : 'Invalid email Address';
                              },
                            ),
                          )),  Positioned(
                          left: 400,
                          top: 130,
                          child: Container(margin: EdgeInsets.only(left: 100),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'E-Mail',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isValidAdd()
                                    ? null
                                    : 'Invalid email Address';
                              },
                            ),
                          )),  Positioned(
                          left: 400,
                          top: 130,
                          child: Container(margin: EdgeInsets.only(left: 100),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'E-Mail',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isValidAdd()
                                    ? null
                                    : 'Invalid email Address';
                              },
                            ),
                          )),  Positioned(
                          left: 400,
                          top: 130,
                          child: Container(margin: EdgeInsets.only(left: 100),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'E-Mail',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isValidAdd()
                                    ? null
                                    : 'Invalid email Address';
                              },
                            ),
                          )),  Positioned(
                          left: 400,
                          top: 130,
                          child: Container(margin: EdgeInsets.only(left: 100),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'E-Mail',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isValidAdd()
                                    ? null
                                    : 'Invalid email Address';
                              },
                            ),
                          )),
                           Positioned(
                          left: 400,
                          top: 130,
                         child: Container(margin: EdgeInsets.only(left: 100),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'E-Mail',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isValidAdd()
                                    ? null
                                    : 'Invalid email Address';
                              },
                            ),
                          )),
                           Positioned(
                          left: 400,
                          top: 130,
                        child: Container(margin: EdgeInsets.only(left: 100),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'E-Mail',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isValidAdd()
                                    ? null
                                    : 'Invalid email Address';
                              },
                            ),
                          )),
                           Positioned(
                          left: 400,
                          top: 130,
                         child: Container(margin: EdgeInsets.only(left: 100),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'E-Mail',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isValidAdd()
                                    ? null
                                    : 'Invalid email Address';
                              },
                            ),
                          )),
                           Positioned(
                          left: 400,
                          top: 130,
                        child: Container(margin: EdgeInsets.only(left: 100),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'E-Mail',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isValidAdd()
                                    ? null
                                    : 'Invalid email Address';
                              },
                            ),
                          )),
                           Positioned(
                          left: 400,
                          top: 130,
                        child: Container(margin: EdgeInsets.only(left: 100),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'E-Mail',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isValidAdd()
                                    ? null
                                    : 'Invalid email Address';
                              },
                            ),
                          )),
                           Positioned(
                          left: 400,
                          top: 130,
                       child: Container(margin: EdgeInsets.only(left: 100),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'E-Mail',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isValidAdd()
                                    ? null
                                    : 'Invalid email Address';
                              },
                            ),
                          )),
                           Positioned(
                          left: 500,
                          top: 130,
                         child: Container(margin: EdgeInsets.only(left: 100),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'E-Mail',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isValidAdd()
                                    ? null
                                    : 'Invalid email Address';
                              },
                            ),
                          )),
                  ],
                ),
               
                  Column(
                    children: [
                      Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200,top: 60),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ),

                            Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ),
                            Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ), 
                           Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ),  Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ),  Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ),  Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ),  Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ),  Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ),  Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ), 
                           Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ),  Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ),  Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ),  Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ),  Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ),  Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ),  Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ),  Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ),  Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ),  Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ),  Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ),  Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ),  Positioned(
                          left: 600,
                          top: 220,
                          child: Container(margin: EdgeInsets.only(left: 200),
                            height: 20,
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Cell No.',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                return value.isCellNo() ? null : 'Invalid Phone Number';
                              },
                            ),
                          )
                          ),
                    ],
                  ), 
                  
                  Column(
                    children: [
                      Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(top: 60,left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )),
                               Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )), Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )), Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )), Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )), Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )),
                               Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )),
  Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )),  Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )),  Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )),  Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )),  Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )),  Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )),  Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )),

                               Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )), Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )), Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )), Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )), Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )), Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )), Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )), Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )), 
                              Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )),
                               Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )), Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )), Positioned(
                              //  left: 200,
                               top: 10,
                              child: Container(margin: EdgeInsets.only(left: 300),
                                height: 20,
                                width: 100,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                           border: OutlineInputBorder(),
                                  ),
                                ),
                              )),
                    ],
                  ),
                   Column(
                     children: [
                       Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 400,top: 60),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),
                                     Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 400,),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 400),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 400),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )), 
                                    Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 400),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )), 
                                    Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 400),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 400),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 400),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 400),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 400),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 400),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 400),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 400),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 400),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 400),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),

                     ],
                   ),
                    Column(
                      children: [
                        Positioned(
                                      //  left: 200,
                                       top: 10,
                                      child: Container(margin: EdgeInsets.only(left: 500,top: 60),
                                        height: 20,
                                        width: 100,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Attendance',
                                                   border: OutlineInputBorder(),
                                          ),
                                        ),
                                      )),

                                       Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 500),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )), 

  Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 500),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 500),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 500),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 500),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 500),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 500),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 500),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 500),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 500),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 500),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 500),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 500),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 500),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 500),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )),   Positioned(
                                  //  left: 200,
                                   top: 10,
                                  child: Container(margin: EdgeInsets.only(left: 500),
                                    height: 20,
                                    width: 100,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Attendance',
                                               border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )), 

                      ],
                    ), 
                      Column(
                        children: [
                          Positioned(
                                      //  left: 200,
                                       top: 10,
                                      child: Container(margin: EdgeInsets.only(left: 600,top: 60),
                                        height: 20,
                                        width: 100,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Attendance',
                                                   border: OutlineInputBorder(),
                                          ),
                                        ),
                                      )),
                                        Positioned(
                                      //  left: 200,
                                       top: 10,
                                      child: Container(margin: EdgeInsets.only(left: 600),
                                        height: 20,
                                        width: 100,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Attendance',
                                                   border: OutlineInputBorder(),
                                          ),
                                        ),
                                      )),  Positioned(
                                      //  left: 200,
                                       top: 10,
                                      child: Container(margin: EdgeInsets.only(left: 600),
                                        height: 20,
                                        width: 100,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Attendance',
                                                   border: OutlineInputBorder(),
                                          ),
                                        ),
                                      )),  Positioned(
                                      //  left: 200,
                                       top: 10,
                                      child: Container(margin: EdgeInsets.only(left: 600),
                                        height: 20,
                                        width: 100,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Attendance',
                                                   border: OutlineInputBorder(),
                                          ),
                                        ),
                                      )),  Positioned(
                                      //  left: 200,
                                       top: 10,
                                      child: Container(margin: EdgeInsets.only(left: 600),
                                        height: 20,
                                        width: 100,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Attendance',
                                                   border: OutlineInputBorder(),
                                          ),
                                        ),
                                      )),  Positioned(
                                      //  left: 200,
                                       top: 10,
                                      child: Container(margin: EdgeInsets.only(left: 600),
                                        height: 20,
                                        width: 100,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Attendance',
                                                   border: OutlineInputBorder(),
                                          ),
                                        ),
                                      )),  Positioned(
                                      //  left: 200,
                                       top: 10,
                                      child: Container(margin: EdgeInsets.only(left: 600),
                                        height: 20,
                                        width: 100,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Attendance',
                                                   border: OutlineInputBorder(),
                                          ),
                                        ),
                                      )),  Positioned(
                                      //  left: 200,
                                       top: 10,
                                      child: Container(margin: EdgeInsets.only(left: 600),
                                        height: 20,
                                        width: 100,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Attendance',
                                                   border: OutlineInputBorder(),
                                          ),
                                        ),
                                      )),  Positioned(
                                      //  left: 200,
                                       top: 10,
                                      child: Container(margin: EdgeInsets.only(left: 600),
                                        height: 20,
                                        width: 100,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Attendance',
                                                   border: OutlineInputBorder(),
                                          ),
                                        ),
                                      )),  Positioned(
                                      //  left: 200,
                                       top: 10,
                                      child: Container(margin: EdgeInsets.only(left: 600),
                                        height: 20,
                                        width: 100,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Attendance',
                                                   border: OutlineInputBorder(),
                                          ),
                                        ),
                                      )),  Positioned(
                                      //  left: 200,
                                       top: 10,
                                      child: Container(margin: EdgeInsets.only(left: 600),
                                        height: 20,
                                        width: 100,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Attendance',
                                                   border: OutlineInputBorder(),
                                          ),
                                        ),
                                      )),  Positioned(
                                      //  left: 200,
                                       top: 10,
                                      child: Container(margin: EdgeInsets.only(left: 600),
                                        height: 20,
                                        width: 100,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Attendance',
                                                   border: OutlineInputBorder(),
                                          ),
                                        ),
                                      )),  Positioned(
                                      //  left: 200,
                                       top: 10,
                                      child: Container(margin: EdgeInsets.only(left: 600),
                                        height: 20,
                                        width: 100,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Attendance',
                                                   border: OutlineInputBorder(),
                                          ),
                                        ),
                                      )),  Positioned(
                                      //  left: 200,
                                       top: 10,
                                      child: Container(margin: EdgeInsets.only(left: 600),
                                        height: 20,
                                        width: 100,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Attendance',
                                                   border: OutlineInputBorder(),
                                          ),
                                        ),
                                      )),  Positioned(
                                      //  left: 200,
                                       top: 10,
                                      child: Container(margin: EdgeInsets.only(left: 600),
                                        height: 20,
                                        width: 100,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Attendance',
                                                   border: OutlineInputBorder(),
                                          ),
                                        ),
                                      )),  Positioned(
                                      //  left: 200,
                                       top: 10,
                                      child: Container(margin: EdgeInsets.only(left: 600),
                                        height: 20,
                                        width: 100,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Attendance',
                                                   border: OutlineInputBorder(),
                                          ),
                                        ),
                                      )),  Positioned(
                                      //  left: 200,
                                       top: 10,
                                      child: Container(margin: EdgeInsets.only(left: 600),
                                        height: 20,
                                        width: 100,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Attendance',
                                                   border: OutlineInputBorder(),
                                          ),
                                        ),
                                      )), 
                                      
                                       Positioned(
                                      //  left: 200,
                                       top: 10,
                                      child: Container(margin: EdgeInsets.only(left: 600),
                                        height: 20,
                                        width: 100,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Attendance',
                                                   border: OutlineInputBorder(),
                                          ),
                                        ),
                                      )),
                        ],
                      ), 
                       Column(
                         children: [
                           Positioned(
                                          //  left: 200,
                                           top: 10,
                                          child: Container(margin: EdgeInsets.only(left: 700,top: 60),
                                            height: 20,
                                            width: 100,
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                labelText: 'Attendance',
                                                       border: OutlineInputBorder(),
                                              ),
                                            ),
                                          )),
                                           Positioned(
                                          //  left: 200,
                                           top: 10,
                                          child: Container(margin: EdgeInsets.only(left: 700,),
                                            height: 20,
                                            width: 100,
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                labelText: 'Attendance',
                                                       border: OutlineInputBorder(),
                                              ),
                                            ),
                                          )), Positioned(
                                          //  left: 200,
                                           top: 10,
                                          child: Container(margin: EdgeInsets.only(left: 700,),
                                            height: 20,
                                            width: 100,
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                labelText: 'Attendance',
                                                       border: OutlineInputBorder(),
                                              ),
                                            ),
                                          )), Positioned(
                                          //  left: 200,
                                           top: 10,
                                          child: Container(margin: EdgeInsets.only(left: 700,),
                                            height: 20,
                                            width: 100,
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                labelText: 'Attendance',
                                                       border: OutlineInputBorder(),
                                              ),
                                            ),
                                          )), Positioned(
                                          //  left: 200,
                                           top: 10,
                                          child: Container(margin: EdgeInsets.only(left: 700,),
                                            height: 20,
                                            width: 100,
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                labelText: 'Attendance',
                                                       border: OutlineInputBorder(),
                                              ),
                                            ),
                                          )), Positioned(
                                          //  left: 200,
                                           top: 10,
                                          child: Container(margin: EdgeInsets.only(left: 700,),
                                            height: 20,
                                            width: 100,
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                labelText: 'Attendance',
                                                       border: OutlineInputBorder(),
                                              ),
                                            ),
                                          )), Positioned(
                                          //  left: 200,
                                           top: 10,
                                          child: Container(margin: EdgeInsets.only(left: 700,),
                                            height: 20,
                                            width: 100,
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                labelText: 'Attendance',
                                                       border: OutlineInputBorder(),
                                              ),
                                            ),
                                          )), Positioned(
                                          //  left: 200,
                                           top: 10,
                                          child: Container(margin: EdgeInsets.only(left: 700,),
                                            height: 20,
                                            width: 100,
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                labelText: 'Attendance',
                                                       border: OutlineInputBorder(),
                                              ),
                                            ),
                                          )), Positioned(
                                          //  left: 200,
                                           top: 10,
                                          child: Container(margin: EdgeInsets.only(left: 700,),
                                            height: 20,
                                            width: 100,
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                labelText: 'Attendance',
                                                       border: OutlineInputBorder(),
                                              ),
                                            ),
                                          )),
                                           Positioned(
                                          //  left: 200,
                                           top: 10,
                                          child: Container(margin: EdgeInsets.only(left: 700,),
                                            height: 20,
                                            width: 100,
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                labelText: 'Attendance',
                                                       border: OutlineInputBorder(),
                                              ),
                                            ),
                                          )),
                         ],
                       ),
                        Column(
                          children: [
                            Positioned(
                                              //  left: 200,
                                               top: 10,
                                              child: Container(margin: EdgeInsets.only(left: 800,top: 60),
                                                height: 20,
                                                width: 100,
                                                child: TextFormField(
                                                  decoration: const InputDecoration(
                                                    labelText: 'Attendance',
                                                           border: OutlineInputBorder(),
                                                  ),
                                                ),
                                              )),
                                               Positioned(
                                              //  left: 200,
                                               top: 10,
                                              child: Container(margin: EdgeInsets.only(left: 800,),
                                                height: 20,
                                                width: 100,
                                                child: TextFormField(
                                                  decoration: const InputDecoration(
                                                    labelText: 'Attendance',
                                                           border: OutlineInputBorder(),
                                                  ),
                                                ),
                                              )), Positioned(
                                              //  left: 200,
                                               top: 10,
                                              child: Container(margin: EdgeInsets.only(left: 800,),
                                                height: 20,
                                                width: 100,
                                                child: TextFormField(
                                                  decoration: const InputDecoration(
                                                    labelText: 'Attendance',
                                                           border: OutlineInputBorder(),
                                                  ),
                                                ),
                                              )), Positioned(
                                              //  left: 200,
                                               top: 10,
                                              child: Container(margin: EdgeInsets.only(left: 800,),
                                                height: 20,
                                                width: 100,
                                                child: TextFormField(
                                                  decoration: const InputDecoration(
                                                    labelText: 'Attendance',
                                                           border: OutlineInputBorder(),
                                                  ),
                                                ),
                                              )), Positioned(
                                              //  left: 200,
                                               top: 10,
                                              child: Container(margin: EdgeInsets.only(left: 800,),
                                                height: 20,
                                                width: 100,
                                                child: TextFormField(
                                                  decoration: const InputDecoration(
                                                    labelText: 'Attendance',
                                                           border: OutlineInputBorder(),
                                                  ),
                                                ),
                                              )), Positioned(
                                              //  left: 200,
                                               top: 10,
                                              child: Container(margin: EdgeInsets.only(left: 800,),
                                                height: 20,
                                                width: 100,
                                                child: TextFormField(
                                                  decoration: const InputDecoration(
                                                    labelText: 'Attendance',
                                                           border: OutlineInputBorder(),
                                                  ),
                                                ),
                                              )),
                                               Positioned(
                                              //  left: 200,
                                               top: 10,
                                              child: Container(margin: EdgeInsets.only(left: 800,),
                                                height: 20,
                                                width: 100,
                                                child: TextFormField(
                                                  decoration: const InputDecoration(
                                                    labelText: 'Attendance',
                                                           border: OutlineInputBorder(),
                                                  ),
                                                ),
                                              )),
                                               Positioned(
                                              //  left: 200,
                                               top: 10,
                                              child: Container(margin: EdgeInsets.only(left: 800,),
                                                height: 20,
                                                width: 100,
                                                child: TextFormField(
                                                  decoration: const InputDecoration(
                                                    labelText: 'Attendance',
                                                           border: OutlineInputBorder(),
                                                  ),
                                                ),
                                              )),
                                               Positioned(
                                              //  left: 200,
                                               top: 10,
                                              child: Container(margin: EdgeInsets.only(left: 800,),
                                                height: 20,
                                                width: 100,
                                                child: TextFormField(
                                                  decoration: const InputDecoration(
                                                    labelText: 'Attendance',
                                                           border: OutlineInputBorder(),
                                                  ),
                                                ),
                                              )), Positioned(
                                              //  left: 200,
                                               top: 10,
                                              child: Container(margin: EdgeInsets.only(left: 800,),
                                                height: 20,
                                                width: 100,
                                                child: TextFormField(
                                                  decoration: const InputDecoration(
                                                    labelText: 'Attendance',
                                                           border: OutlineInputBorder(),
                                                  ),
                                                ),
                                              )), Positioned(
                                              //  left: 200,
                                               top: 10,
                                              child: Container(margin: EdgeInsets.only(left: 800,),
                                                height: 20,
                                                width: 100,
                                                child: TextFormField(
                                                  decoration: const InputDecoration(
                                                    labelText: 'Attendance',
                                                           border: OutlineInputBorder(),
                                                  ),
                                                ),
                                              )), Positioned(
                                              //  left: 200,
                                               top: 10,
                                              child: Container(margin: EdgeInsets.only(left: 800,),
                                                height: 20,
                                                width: 100,
                                                child: TextFormField(
                                                  decoration: const InputDecoration(
                                                    labelText: 'Attendance',
                                                           border: OutlineInputBorder(),
                                                  ),
                                                ),
                                              )), Positioned(
                                              //  left: 200,
                                               top: 10,
                                              child: Container(margin: EdgeInsets.only(left: 800,),
                                                height: 20,
                                                width: 100,
                                                child: TextFormField(
                                                  decoration: const InputDecoration(
                                                    labelText: 'Attendance',
                                                           border: OutlineInputBorder(),
                                                  ),
                                                ),
                                              )), Positioned(
                                              //  left: 200,
                                               top: 10,
                                              child: Container(margin: EdgeInsets.only(left: 800,),
                                                height: 20,
                                                width: 100,
                                                child: TextFormField(
                                                  decoration: const InputDecoration(
                                                    labelText: 'Attendance',
                                                           border: OutlineInputBorder(),
                                                  ),
                                                ),
                                              )),
                                               Positioned(
                                              //  left: 200,
                                               top: 10,
                                              child: Container(margin: EdgeInsets.only(left: 800,),
                                                height: 20,
                                                width: 100,
                                                child: TextFormField(
                                                  decoration: const InputDecoration(
                                                    labelText: 'Attendance',
                                                           border: OutlineInputBorder(),
                                                  ),
                                                ),
                                              )),
                          ],
                        ), 

                          Column(
                            children: [
                              Positioned(
                                                  //  left: 200,
                                                   top: 10,
                                                  child: Container(margin: EdgeInsets.only(left: 900,top: 60),
                                                    height: 20,
                                                    width: 100,
                                                    child: TextFormField(
                                                      decoration: const InputDecoration(
                                                        labelText: 'Attendance',
                                                               border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  )),

                                                    Positioned(
                                                  //  left: 200,
                                                   top: 10,
                                                  child: Container(margin: EdgeInsets.only(left: 900,),
                                                    height: 20,
                                                    width: 100,
                                                    child: TextFormField(
                                                      decoration: const InputDecoration(
                                                        labelText: 'Attendance',
                                                               border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  )),  Positioned(
                                                  //  left: 200,
                                                   top: 10,
                                                  child: Container(margin: EdgeInsets.only(left: 900,),
                                                    height: 20,
                                                    width: 100,
                                                    child: TextFormField(
                                                      decoration: const InputDecoration(
                                                        labelText: 'Attendance',
                                                               border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  )),  Positioned(
                                                  //  left: 200,
                                                   top: 10,
                                                  child: Container(margin: EdgeInsets.only(left: 900,),
                                                    height: 20,
                                                    width: 100,
                                                    child: TextFormField(
                                                      decoration: const InputDecoration(
                                                        labelText: 'Attendance',
                                                               border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  )),  Positioned(
                                                  //  left: 200,
                                                   top: 10,
                                                  child: Container(margin: EdgeInsets.only(left: 900,),
                                                    height: 20,
                                                    width: 100,
                                                    child: TextFormField(
                                                      decoration: const InputDecoration(
                                                        labelText: 'Attendance',
                                                               border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  )),  Positioned(
                                                  //  left: 200,
                                                   top: 10,
                                                  child: Container(margin: EdgeInsets.only(left: 900,),
                                                    height: 20,
                                                    width: 100,
                                                    child: TextFormField(
                                                      decoration: const InputDecoration(
                                                        labelText: 'Attendance',
                                                               border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  )),  Positioned(
                                                  //  left: 200,
                                                   top: 10,
                                                  child: Container(margin: EdgeInsets.only(left: 900,),
                                                    height: 20,
                                                    width: 100,
                                                    child: TextFormField(
                                                      decoration: const InputDecoration(
                                                        labelText: 'Attendance',
                                                               border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  )),  Positioned(
                                                  //  left: 200,
                                                   top: 10,
                                                  child: Container(margin: EdgeInsets.only(left: 900,),
                                                    height: 20,
                                                    width: 100,
                                                    child: TextFormField(
                                                      decoration: const InputDecoration(
                                                        labelText: 'Attendance',
                                                               border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  )),  Positioned(
                                                  //  left: 200,
                                                   top: 10,
                                                  child: Container(margin: EdgeInsets.only(left: 900,),
                                                    height: 20,
                                                    width: 100,
                                                    child: TextFormField(
                                                      decoration: const InputDecoration(
                                                        labelText: 'Attendance',
                                                               border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  )),  Positioned(
                                                  //  left: 200,
                                                   top: 10,
                                                  child: Container(margin: EdgeInsets.only(left: 900,),
                                                    height: 20,
                                                    width: 100,
                                                    child: TextFormField(
                                                      decoration: const InputDecoration(
                                                        labelText: 'Attendance',
                                                               border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  )),  Positioned(
                                                  //  left: 200,
                                                   top: 10,
                                                  child: Container(margin: EdgeInsets.only(left: 900,),
                                                    height: 20,
                                                    width: 100,
                                                    child: TextFormField(
                                                      decoration: const InputDecoration(
                                                        labelText: 'Attendance',
                                                               border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  )),  Positioned(
                                                  //  left: 200,
                                                   top: 10,
                                                  child: Container(margin: EdgeInsets.only(left: 900,),
                                                    height: 20,
                                                    width: 100,
                                                    child: TextFormField(
                                                      decoration: const InputDecoration(
                                                        labelText: 'Attendance',
                                                               border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  )),  Positioned(
                                                  //  left: 200,
                                                   top: 10,
                                                  child: Container(margin: EdgeInsets.only(left: 900,),
                                                    height: 20,
                                                    width: 100,
                                                    child: TextFormField(
                                                      decoration: const InputDecoration(
                                                        labelText: 'Attendance',
                                                               border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  )),  Positioned(
                                                  //  left: 200,
                                                   top: 10,
                                                  child: Container(margin: EdgeInsets.only(left: 900,),
                                                    height: 20,
                                                    width: 100,
                                                    child: TextFormField(
                                                      decoration: const InputDecoration(
                                                        labelText: 'Attendance',
                                                               border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  )),  Positioned(
                                                  //  left: 200,
                                                   top: 10,
                                                  child: Container(margin: EdgeInsets.only(left: 900,),
                                                    height: 20,
                                                    width: 100,
                                                    child: TextFormField(
                                                      decoration: const InputDecoration(
                                                        labelText: 'Attendance',
                                                               border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  )),  Positioned(
                                                  //  left: 200,
                                                   top: 10,
                                                  child: Container(margin: EdgeInsets.only(left: 900,),
                                                    height: 20,
                                                    width: 100,
                                                    child: TextFormField(
                                                      decoration: const InputDecoration(
                                                        labelText: 'Attendance',
                                                               border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  )),
                            ],
                          ),
                //  const Positioned(left: 180, top: 280, child: Text('Gender:')),
                //   const Positioned(top: 280, left: 250, child: Text('Male')),
                //   Positioned(
                //       left: 280,
                //       top: 275,
                //       child: Radio<String?>(
                //           value: isMale,
                //           groupValue: groupValue,
                //           onChanged: (value) {
                //             setState(() {
                //               groupValue = value;
                //             });
                //             Text(isMale!);
                          // })),
                //   const Positioned(top: 280, left: 315, child: Text('Female')),
                //   Positioned(
                //     left: 360,
                //     top: 275,
                //     child: Radio<String?>(
                //       value: isFemale,
                //       groupValue: groupValue,
                //       onChanged: (value) {
                //         setState(() {
                //           groupValue = value;
                //         });
                //  Text(isFemale!);
                  //     },
                  //   ),
                  // ),
                  // const Positioned(
                  //     left: 180, top: 320, child: Text('Select Your Field:')),
                  // Positioned(
                  //   left: 180,
                  //   top: 350,
                  //   child: Checkbox(
                  //     value: isStudent,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         isStudent = value!;
                  //       });
                  // },
                  //   ),
                  // ),
                  // const Positioned(
                  //     top: 355, left: 220, child: Text('Professional')),
                  // Positioned(
                  //     top: 380,
                  //     left: 180,
                  //     child: Checkbox(
                  //         value: isEmployee,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             isEmployee = value!;
                //             });
                //           })),
                // const Positioned(top: 385, left: 220, child: Text('Employee')),
                //   Positioned(
                //       top: 410,
                //       left: 180,
                //       child: Checkbox(
                //           value: isTeacher,
                //           onChanged: (value) {
                //             setState(() {
                //               isTeacher = value!;
                //             });
                //           })),
                //   const Positioned(top: 415, left: 220, child: Text('Internie')),
                //   Positioned(
                //       top: 440,
                //       left: 180,
                //       child: Checkbox(
                //           value: isOthers,
                //           onChanged: (value) {
                //             setState(() {
                //               isOthers = value!;
                //             });
                // })),
                //   const Positioned(top: 445, left: 220, child: Text('Others')),
                //   Positioned(
                //       top: 470,
                      // left: 280,
                      // child: Checkbox(
                      //     value: isAgree,
                      //     onChanged: (value) {
                      //       setState(() {
                      //         isAgree = value!;
                      //       });
                      //     })),
                  const Positioned(
                      top: 475,
                      left: 320,
                      child: Text(
                        'I Agree To The Terms And Conditions.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                Positioned(
                    top: 460,
                    left: 580,
                    child: FloatingActionButton(
                      onPressed: _incrementCounter,
                      child: const Text(
                        'Next',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  )]
                
              ),
                      
            
          );

}

}       
       
          
          
          
          
          
          
          
          
          
          
          
          
          