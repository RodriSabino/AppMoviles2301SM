import 'package:flutter/material.dart';

import 'package:challenge_3/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ejemplo de StatelesWidget'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const[
          
          SizedBox(height: 20),
          CustomCard(title: 'Spider-man',imageUrl: 'https://img2.wallspic.com/crops/4/5/0/7/3/137054/137054-cartel-superheroe-graficos-de_cerca-ilustracion-3840x2160.jpg',),
          SizedBox(height: 20),
          CustomCard(title: 'Miles', imageUrl: 'https://www.pixel4k.com/wp-content/uploads/2019/09/miles-morales-closeup_1568055487.jpg',),
          SizedBox(height: 20),
          CustomCard(title: 'Ghost-Spider',imageUrl: 'https://c3kienthuyhp.edu.vn/es/wp-content/uploads/2023/03/Spider-Gwen-Cosplay-rompe-los-limites-entre-los-comics-y-la.jpg',),
        
        ],
      )
    );
  }
}

