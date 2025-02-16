import 'package:api_postl3/models/produit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Produit>> futureProduits;

  @override
  void initState() {
    super.initState();
    futureProduits = fetchProduits();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Add your code here to handle the button click
              print('Button clicked!');
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: FutureBuilder(future: futureProduits,
   
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError) {
          return Text('Error: ${snapshot.error.toString()}');
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final Produit produit = snapshot.data![index];
            return ListTile(
              title: Text(produit.libelle),
              onTap: () {
                // Add your code here to handle the list item click
                print('List item clicked: ${produit.prix}x');
              },
            );
          },
        );

      }
      )
    );
  }
}
