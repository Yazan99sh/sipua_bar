import 'package:flutter/material.dart';
import 'package:idea_hub/home_module/state/home.dart';
import 'home_module/state/home_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Idea Hub Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Shoroq'
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late HomeState currentState;

  void refresh(){
    if (mounted) {
      setState(() {
      });
    }
  }

  @override
  void initState() {
    super.initState();
    currentState = HomeStartState(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentState.getUI(context),
    );
  }
}
