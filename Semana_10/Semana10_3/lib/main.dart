import 'package:flutter/material.dart';

import 'package:english_words/english_words.dart';



void main() {

  runApp(const MyApp());

}



class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);



  @override

  Widget build(BuildContext context) {

    //final wordPair = WordPair.random();



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RandonWord(),

    );

  }

}



class RandonWord extends StatefulWidget {

  const RandonWord({Key? key}) : super(key: key);



  @override

  State<RandonWord> createState() => _RandonWordState();

}



class _RandonWordState extends State<RandonWord> {

  final List<WordPair> suggestions = <WordPair>[];

  final TextStyle biggerFont = TextStyle(fontSize: 18);

  final Set<WordPair> saved = Set<WordPair>();

  @override

  Widget build(BuildContext context) {

    //inal wordPair = WordPair.random();

    //return Text(wordPair.asPascalCase);



    return Scaffold(

      appBar: AppBar(

        title: Text("Generador del palabras"),
        actions: <Widget>[IconButton(onPressed: pushSaver, icon: Icon(Icons.list_alt_sharp))],

      ),

      body: buildSuggestions(),

    );



    return const Placeholder();

  }



  Widget buildSuggestions(){

    return ListView.builder(

        padding: EdgeInsets.all(16), //opcional

        itemBuilder: (BuildContext context, int i){

          if (i.isOdd){

            return Divider(
            );

          }



          final int index = i ~/ 2;



          if (index >= suggestions.length){

            suggestions.addAll(generateWordPairs().take(10));

          }

          return buildRow(suggestions[index]);

        }

    );

  }



  //aqui utilizamos el ListTile

  Widget buildRow(WordPair pair) {
    final bool alreadysaved = saved.contains(pair);

    return ListTile(

      title: Text(pair.asPascalCase,

          style: biggerFont),
      trailing: Icon(
        alreadysaved ? Icons.favorite: Icons.favorite_border,
        color: alreadysaved? Colors.red: null,
      ),
      onTap: (){
        setState(() {
          alreadysaved ? saved.remove(pair) : saved.add(pair);
        });
      },

    );

  }


  void pushSaver() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context){
          final Iterable<ListTile> tiles = saved.map(
              (WordPair pair){
                return ListTile(
                  title: Text(pair.asPascalCase, style: biggerFont),
                );
              }
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles
          ).toList();
          return Scaffold(
            appBar: AppBar(
              title: Text("Mis Palabras favoritas"),
            ),body: ListView(
            children: divided,
          ),
          );
        }
      )
    );
  }
}





