import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    home: FirstRoute(),
  ));
}
class FirstRoute extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text("First Route"),
        ),
        body: Center(
          child: ElevatedButton(
              child:  Text("Ir al siguiente Route"),
            onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondRoute())
                );

            },
          ),
        ),
    );
  }
}

class SecondRoute extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Route"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Back"),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),

    );
  }
}

