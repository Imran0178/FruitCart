import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(40))),
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[500],
                        border: Border.all(width: 2, color: Colors.grey)),
                    child: const Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Home',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20, color: Colors.green),
                        ),
                        Text(
                          'Amazing grace apartments, Koramagla, Banglore.',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            DefaultTabController(
              length: 4, // length of tabs
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const TabBar(
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Tab(
                        child: Text(
                          "Home",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Fruits",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Veggies",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Pulses",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                
                   Row( children:const [
                    SizedBox(width: 5),
                       ChoiceChip(label: Text('Fresh'), selected: true,
                       selectedColor: Colors.green,
                       ),
                        SizedBox(width: 5),
                       ChoiceChip(label: Text('Exotic'), selected: true,
                       ),
                        SizedBox(width: 5),
                        ChoiceChip(label: Text('Melons'), selected: true,
                       ),
                   ],
                   ),
               
                  // SizedBox(
                  //    height: 385,
                  //    child: TabBarView(
                  //      children: [
                  //        const Center(
                  //          child: Text(
                  //            'Fresh Products',
                  //            style: TextStyle(
                  //                fontSize: 22, fontWeight: FontWeight.bold),
                  //          ),
                  //        ),
                         SingleChildScrollView(
                           child: Column(
                            children: [
                              Row(
                                children:  [
                               Image.asset('assets/Images/apple.png',
                                height: 80,
                                width: 80,
                                ),
                                  Text('Apple Washington Bangalore',
                                   style: TextStyle(
                                 fontSize: 15, color: Colors.green,
                                   ),
                                  ),
                                ],
                              ),
                            ],
                           ),
                         ),
                  //        const Center(
                  //          child: Text(
                  //            'tab3',
                  //            style: TextStyle(
                  //               fontSize: 22, fontWeight: FontWeight.bold),
                  //          ),
                  //        ),
                  //        const Center(
                  //          child: Text(
                  //            '',
                  //            style: TextStyle(
                  //                fontSize: 22, fontWeight: FontWeight.bold),
                  //          ),
                  //        ),
                  //      ],
                  //    ),
                  //  )
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: '',
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
