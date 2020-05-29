import './Screens/four.dart';
import './Screens/one.dart';
import './Screens/three.dart';
import './Screens/two.dart';
import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final QuickActions quickActions = QuickActions();

  _setupQuickActions(){
    quickActions.setShortcutItems(
      [
        ShortcutItem(
          type: 'one',
          localizedTitle: 'Screen 1',
          icon: 'one'
        ),
        ShortcutItem(
          type: 'two',
          localizedTitle: 'Screen 2',
          icon: 'two'
        ),
        ShortcutItem(
          type: 'three',
          localizedTitle: 'Screen 3',
          icon: 'three'
        ),
        ShortcutItem(
          type: 'four',
          localizedTitle: 'Screen 4',
          icon: 'four'
        ),
      ],
    );
  }

  _handleQuickActions(){
    quickActions.initialize((shortcutType){
      switch(shortcutType){
        case 'one':
          Navigator.push(context, MaterialPageRoute(builder: (context) => One()));
          break;
        case 'two':
          Navigator.push(context, MaterialPageRoute(builder: (context) => Two()));
          break;
        case 'three':
          Navigator.push(context, MaterialPageRoute(builder: (context) => Three()));
          break;
        case 'four':
          Navigator.push(context, MaterialPageRoute(builder: (context) => Four()));
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _setupQuickActions();
    _handleQuickActions();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
