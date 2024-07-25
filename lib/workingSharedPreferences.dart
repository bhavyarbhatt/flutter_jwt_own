import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SharedPreferences',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
            debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  } 
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadSharedPrefence();
  }

  void _loadSharedPrefence() async{
    // Obtain shared preferences.
  final  prefs = await SharedPreferences.getInstance();
  setState(() {
   _counter =  prefs.getInt('counterToken') ?? 0 ;
  });
  }



  //Incrementing counter after click
void _incrementCounter()  async {
  final prefs = await SharedPreferences.getInstance();
  setState(() {
    _counter = (prefs.getInt('counterToken') ?? 0) + 1;
    	prefs.setInt('counterToken', _counter);
  });
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Text("Counter: ${_counter}"),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.black38,
        onPressed: _incrementCounter,
      ),
    );
  }
}