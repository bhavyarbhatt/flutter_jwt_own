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

 
// class Helper {
//   static String valueSharedPreferences = '';
 
// // Write DATA
// static Future<bool> saveUserData(value) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     return await sharedPreferences.setInt(valueSharedPreferences, value);
//   }
   
// // Read Data
// static Future getUserData() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     return sharedPreferences.getInt(valueSharedPreferences);
//   }
// }


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 int _counter=0;
 
@override
  void initState() {
    super.initState();
    _loadCounter();
  }

void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0 );
    });
}  



//Incrementing counter after click
void _incrementCounter()  async {
  final prefs = await SharedPreferences.getInstance();
  setState(() {
    _counter = (prefs.getInt('counter') ?? 0) + 1;
    	prefs.setInt('counter', _counter);
  });
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
      ),
      body: Center(
        child: Column(
          children: [
            Text('You have pushed the button this many times'),
            Text(
              '$_counter',
              ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: Icon(Icons.add),
      ),
    );
  }
}