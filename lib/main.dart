import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: Scaffold(
        body: Center(
            child: Column(children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(40))),
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Row(children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[500],
                      border: Border.all(width: 2, color: Colors.grey)),
                  child: const Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 40,
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
              ]))
        ])),
        bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}

//     
//     );
//   }
// }
