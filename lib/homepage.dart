import 'package:flutter/material.dart';
import '';
import 'Api/API.dart';

import 'product.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Product abc=Product(productName, weight, originalPrice, offerPrice, imagePath, labelName, freeLabel),
  List<Product> productlists = [];
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadproducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
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
              DefaultTabController(
                length: 4, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const <Widget>[
                      TabBar(
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
                    ]),
              ),
              Row(
                children: const [
                  SizedBox(width: 5),
                  ChoiceChip(
                    label: Text('Fresh'),
                    selected: true,
                  ),
                  SizedBox(width: 5),
                  ChoiceChip(
                    label: Text('Exotic'),
                    selected: true,
                  ),
                  SizedBox(width: 5),
                  ChoiceChip(
                    label: Text('Melons'),
                    selected: true,
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: productlists.length,
                        itemBuilder: (BuildContext context, int index) {
                          return fruitCard(context, index);
                        }),
                  ]),
                ),
              ),
            ]),
      ),
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

  Widget fruitCard(BuildContext context, int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(
                image: AssetImage(productlists[index].imagePath),
                height: 80,
                fit: BoxFit.fill,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productlists[index].labelName,
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              Text(
                productlists[index].productName,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                productlists[index].weight,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  productlists[index].freeLabel,
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '\u{20B9}' '${productlists[index].originalPrice}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '\u{20B9}' '${productlists[index].offerPrice}',
                      style: const TextStyle(
                          fontSize: 16, color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    Card(
                      color: Color.fromARGB(255, 209, 220, 226),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                productlists[index].quantity--;
                              });
                            },
                            icon: Icon(Icons.remove),
                            iconSize: 10,
                            // padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                          ),
                          TextButton(
                            onPressed: null,
                            child: Text((productlists[index].quantity > 0)
                                ? productlists[index].quantity.toString()
                                : 'Add'),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                productlists[index].quantity++;
                              });
                            },
                            icon: Icon(Icons.add),
                            iconSize: 15,
                            padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void loadproducts() async {
    ApiProvider apiProvider = ApiProvider();
    List products = await apiProvider.fetchProducts();
    // this will print the id and the title of posts
    setState(() {
      products.forEach((post) => productlists.add(post));
    });
  }
}
