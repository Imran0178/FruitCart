import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/homepage.dart';
import 'package:my_app/product.dart';

import '../Api/API.dart';



// class AddFruit extends StatelessWidget {
//   const AddFruit({Key? key}) : super(key: key);

//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: const MyStatefulWidget(),
//       ),
//     );
//   }
// }

class AddFruitForm extends StatefulWidget {
  const AddFruitForm({Key? key}) : super(key: key);

  @override
  AddFruit createState() => AddFruit();
}

class AddFruit extends State<AddFruitForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Product newProduct = Product('', '', '', '', '', '', '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Add New Product'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: ' Product Name',
                      hintText: ' Enter the product name',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the product you want to add';
                      }
                      return null;
                    },
                    onChanged: (String? value) {
                      newProduct.productName = value!;
                    }),
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Image Url',
                    ),
                    onChanged: (String? value) {
                      newProduct.imagePath = value!;
                    }),
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: ' Weight',
                      hintText: ' weight',
                    ),
                    onChanged: (String? value) {
                      newProduct.weight = value!;
                    }),
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: ' Original price',
                      hintText: ' Enter the price',
                    ),
                    onChanged: (String? value) {
                      newProduct.originalPrice = value!;
                    }),
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: ' Offer Price',
                      hintText: ' Enter The Price',
                    ),
                    onChanged: (String? value) {
                      newProduct.offerPrice = value!;
                    }),
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: ' LabelName',
                      hintText: ' Name of the Label',
                    ),
                    onChanged: (String? value) {
                      newProduct.labelName = value!;
                    }),
                    TextFormField(
                    decoration: const InputDecoration(
                      labelText: ' freelabel',
                      
                    ),
                    onChanged: (String? value) {
                      newProduct.freeLabel = value!;
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        //  newProduct.postProduct(Product);
                        addNewProduct(newProduct);
                      }
                    },
                    child: const Text('Add product'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addNewProduct(Product newProduct) {
    ApiProvider apiproduct = ApiProvider();
    apiproduct.postProducts(jsonEncode(newProduct));
  }
}


