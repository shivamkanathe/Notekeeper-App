// import 'package:flutter/material.dart';
// import 'package:development/dbmanager.dart';
// import 'package:development/main.dart';

// class Front extends StatefulWidget {
//   @override
//   _FrontState createState() => _FrontState();
// }

// class _FrontState extends State<Front> {
//   final DbStudentManager dbmanager = new DbStudentManager();

//   Student student;
//   List<Student> studlist;
//   int updateIndex;
//   final _formKey = new GlobalKey<FormState>();

//   final _nameController = TextEditingController();
//   final _courseController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Note App"),
//         centerTitle: true,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => MyHomePage()));
//         },
//         child: Icon(Icons.add),
//       ),
//       body: Container(
//         child: FutureBuilder(
//           future: dbmanager.getStudentList(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               studlist = snapshot.data;
//               return SingleChildScrollView(
//                 child: Container(
//                   child: Column(
//                     children: [
//                       ListView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         scrollDirection: Axis.vertical,
//                         shrinkWrap: true,
//                         itemCount: studlist == null ? 0 : studlist.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           Student st = studlist[index];
//                           return Card(
//                             child: Row(
//                               children: <Widget>[
//                                 Container(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: <Widget>[
//                                       Text(
//                                         'Name: ${st.name}',
//                                         style: TextStyle(fontSize: 15),
//                                       ),
//                                       Text(
//                                         'Course: ${st.course}',
//                                         style: TextStyle(
//                                             fontSize: 15,
//                                             color: Colors.black54),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 IconButton(
//                                   onPressed: () {
//                                     _nameController.text = st.name;
//                                     _courseController.text = st.course;
//                                     student = st;
//                                     updateIndex = index;
//                                   },
//                                   icon: Icon(
//                                     Icons.edit,
//                                     color: Colors.blueAccent,
//                                   ),
//                                 ),
//                                 IconButton(
//                                   onPressed: () {
//                                     dbmanager.deleteStudent(st.id);
//                                     setState(() {
//                                       studlist.removeAt(index);
//                                     });
//                                   },
//                                   icon: Icon(
//                                     Icons.delete,
//                                     color: Colors.red,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             }
//             return new CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }

//   void _submitStudent(BuildContext context) {
//     if (_formKey.currentState.validate()) {
//       if (student == null) {
//         Student st = new Student(
//             name: _nameController.text, course: _courseController.text);
//         dbmanager.insertStudent(st).then((id) => {
//               _nameController.clear(),
//               _courseController.clear(),
//               print('Student Added to Db ${id}')
//             });
//       } else {
//         student.name = _nameController.text;
//         student.course = _courseController.text;

//         dbmanager.updateStudent(student).then((id) => {
//               setState(() {
//                 studlist[updateIndex].name = _nameController.text;
//                 studlist[updateIndex].course = _courseController.text;
//               }),
//               _nameController.clear(),
//               _courseController.clear(),
//               student = null
//             });
//       }
//     }
//   }
// }
