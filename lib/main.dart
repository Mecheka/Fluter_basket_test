import 'package:flutter/material.dart';
import 'package:flutter_backet/model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePage();
  }
}

class _MyHomePage extends State<MyHomePage> {
  List<Product> listProduct = <Product>[
    Product(productName: 'Doctor', amount: 4990)
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Product list'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            titleSecsion(listProduct),
            contentSecsion(listProduct),
            buttomSecsion(),
            Center(
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () => addProductList(),
                child: Text('Add'),
              ),
            )
          ],
        ),
      ),
    );
  }

  void addProductList() {
    setState(() {
      listProduct.add(Product(productName: 'Suriya', amount: 4000));
    });
  }

  void clearAllProduct() {
    setState(() {
      listProduct.clear();
    });
  }

  Widget titleSecsion(List<Product> listProduct) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.shop,
            ),
            Text(
              'Your Basket',
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
        Text(checkText(listProduct))
      ],
    ));
  }

  String checkText(List<Product> listProduct) {
    if (listProduct.isEmpty) {
      return 'Tap on the product to add an item.';
    } else {
      return 'items added.';
    }
  }

  Widget contentSecsion(List<Product> listProduct) {
    if (listProduct.isEmpty) {
      return Container(
          padding: EdgeInsets.only(top: 16),
          color: Colors.yellow,
          height: 300,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Icon(Icons.shop),
                Text('Your basket is empty')
              ],
            ),
          ));
    } else {
      return Container(
        padding: EdgeInsets.only(top: 16),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Item'),
                  ),
                  Text('Amount'),
                  SizedBox(
                    width: 60,
                  )
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: new NeverScrollableScrollPhysics(),
              itemCount: listProduct.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(listProduct[index].productName);
              },
            ),
          ],
        ),
      );
    }
  }

  Widget buttomSecsion() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          RaisedButton(
            child: Text('Clear all'),
            onPressed: () => clearAllProduct(),
          ),
          SizedBox(
            width: 24,
          ),
          RaisedButton(
            child: Text('Check out'),
          ),
        ],
      ),
    );
  }

  // Expanded(
  //                   child: Text('Dactor'),
  //                 ),
  //                 IconButton(
  //                   icon: Icon(Icons.account_balance_wallet),
  //                 ),
  //                 SizedBox(
  //                   width: 18,
  //                 ),
  //                 Text('฿7000'),
  //                 SizedBox(
  //                   width: 18,
  //                 ),
  //                 IconButton(
  //                   icon: Icon(Icons.restore_from_trash),
  //                 )
}
