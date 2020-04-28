import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> __animation;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
        duration: Duration(milliseconds: 5000), vsync: this);
    __animation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Animation'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: Icon(
                  Icons.star,
                  size: 80,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              FadeTransition(
                opacity:
                    Tween<double>(begin: 0.0, end: 1.0).animate(_controller),
                child: Icon(
                  Icons.star,
                  size: 80,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ScaleTransition(
                scale: __animation,
                child: Icon(
                  Icons.star,
                  size: 80,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              RaisedButton(
                onPressed: () {
                  _controller.forward();
                },
                color: Colors.teal[900],
                child: Text(
                  'Play',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  _controller.reset();
                },
                color: Colors.white,
                child: Text(
                  'Stop',
                  style: TextStyle(color: Colors.teal[900]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
