import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:my_app/crud/addnewfruit.dart';
import 'package:my_app/main.dart';
import 'package:my_app/homepage.dart';
import 'package:my_app/product.dart';

import '../Api/API.dart';

class MasterList extends StatefulWidget {
  const MasterList({Key? key}) : super(key: key);

  @override
  State<MasterList> createState() => _MasterListState();
}

class _MasterListState extends State<MasterList> {
  List<Product> productlists = [];
  //late Future<Product> futureProducts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadproducts();
    //futureProducts = fetchproducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MasterList'),
        leading: const Icon(Icons.local_grocery_store_outlined),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddFruitForm(null)));
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: productlists.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          margin:
                              const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        productlists[index].imagePath),
                                    height: 50,
                                    fit: BoxFit.fill,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productlists[index].labelName,
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    productlists[index].productName,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          productlists[index].weight,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          '\u{20B9}'
                                          '${productlists[index].originalPrice}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.red,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          '\u{20B9}'
                                          '${productlists[index].offerPrice}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Color.fromARGB(
                                                  255, 51, 51, 51)),
                                        ),
                                        const SizedBox(
                                          width: 30.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddFruitForm(productlists[index])));
                                        },
                                        icon: const Icon(Icons.edit)),
                                    IconButton(
                                        onPressed: () {
                                          deleteproduct(productlists[index]);
                                        },
                                        icon: const Icon(Icons.delete)),
                                  ]),
                            ],
                          ),
                        );
                      })
                ]),
              ),
            )
          ],
        ),
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

  void deleteproduct(Product id) {
    ApiProvider apiProvider = ApiProvider();
    apiProvider.deleteproduct(jsonEncode(id));
  }
}
