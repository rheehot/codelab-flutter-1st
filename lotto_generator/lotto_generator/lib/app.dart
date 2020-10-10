import 'package:flutter/material.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: '로또 번호 생성기'),
    );
  }
}

class HomePage extends StatefulWidget {
  // HomePage({Key key, this.title}) : super(key: key);

  HomePage({Key key, this.title}) : super(key: key) {
    for(var i = 0; i < 45; i++) {
      numbers.add( i + 1 );
    }
    numbers.shuffle();
  }

  final String title;
  var numbers = [];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void shuffleNumbers() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      widget.numbers.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
          child: ListView.builder(itemBuilder: (BuildContext context, int index) {
            return (
                Center(
                    child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Text('${widget.numbers[index]}')
                    )
                )
            );
          },
            itemCount: 6,
            shrinkWrap: true,)
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: shuffleNumbers,
        tooltip: 'shuffle',
        child: Icon(Icons.shuffle),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
