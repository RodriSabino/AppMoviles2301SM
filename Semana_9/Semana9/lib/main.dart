import 'package:flutter/material.dart';

void main() {
  runApp( MyStatefullApp());
}
class MyStatefullApp extends StatefulWidget {
  const MyStatefullApp({Key? key}) : super(key: key);

  @override
  State<MyStatefullApp> createState() => _MyStatefullAppState();
}


class _MyStatefullAppState extends State<MyStatefullApp> {

  int counter =1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: const Text("Ola mundo"),

        ),
        body: Center(
          child: Text(counter.toString(),
            style: TextStyle(fontSize: 50),),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.plus_one_sharp),
           onPressed: (){
             counter++;
             setState(() {

             });
           },
         ),
       ),
     );
  }
}

//
// class MyStatalessApp extends StatelessWidget {
//
//   int counter=1;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("Ola mundo"),
//
//         ),
//         body: Center(
//           child: Text(counter.toString(),
//             style: TextStyle(fontSize: 50),),
//         ),
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.plus_one_sharp),
//           onPressed: (){
//             counter++;
//             print(counter);
//           },
//         ),
//       ),
//     );
//   }
// }
