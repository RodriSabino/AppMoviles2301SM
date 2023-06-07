import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Challenge 4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
List<bool> heartColors = [];
class _HomePageState extends State<HomePage> {
  List<dynamic> apiData = [];
  List<dynamic> selectedItems = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://retoolapi.dev/gvBf2J/Empleado')); // Reemplaza 'URL_DE_LA_API' por la URL real de tu API.
    if (response.statusCode == 200) {
      setState(() {
        apiData = json.decode(response.body);
        heartColors = List.generate(apiData.length, (_) => false);

      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void addToSelectedItems(dynamic item) {
    setState(() {
      selectedItems.add(item);
    });
  }

  void removeFromSelectedItems(dynamic item) {
    setState(() {
      selectedItems.remove(item);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Challenge 4'),
      ),
      body: ListView.builder(
        itemCount: apiData.length,
        itemBuilder: (BuildContext context, int index) {
          final item = apiData[index];
          final nombre = item['Nombre'];
          final cargo = item['Cargo'];
          return ListTile(
            title: Text(nombre),
            subtitle: Text(cargo),
            trailing: IconButton(
              icon: Icon(heartColors[index] ? Icons.favorite: Icons.favorite_border_outlined, color: heartColors[index] ? Colors.red : null,),
              onPressed: () {
                setState(() {
                  heartColors[index] = !heartColors[index];
                  if (heartColors[index]) {
                    addToSelectedItems(item);
                  } else {
                    removeFromSelectedItems(item);
                  }
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite, color: Colors.white,),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectedItemsPage( selectedItems: selectedItems),
            ),
          );
        },
      ),
    );
  }
}
class SelectedItemsPage extends StatefulWidget {
  final List<dynamic> selectedItems;

  SelectedItemsPage({required this.selectedItems});

  @override
  _SelectedItemsPageState createState() => _SelectedItemsPageState();
}

class _SelectedItemsPageState extends State<SelectedItemsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elementos Favoritos'),
      ),
      body: ListView.builder(
        itemCount: widget.selectedItems.length,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.selectedItems[index];
          final nombre = item['Nombre'];
          final cargo = item['Cargo'];
          return ListTile(
            title: Text(nombre),
            subtitle: Text(cargo),
            trailing: IconButton(
              icon: Icon(Icons.favorite, color:Colors.red),
              onPressed: () {
                setState(() {

                  widget.selectedItems.remove(item);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
