import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final String image;
  final double price;
  final double rating;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
  });
}

class MyApp extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Product 1',
      image: 'assets/images/hamburger.png',
      price: 10.99,
      rating: 4.5,
    ),
    Product(
      name: 'Product 2',
      image: 'assets/images/pizza.png',
      price: 15.99,
      rating: 4.0,
    ),
    Product(
      name: 'Product 3',
      image: 'assets/images/salad.png',
      price: 20.99,
      rating: 3.8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              // For wider screens, use GridView
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.0,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductItem(product: products[index]);
                },
              );
            } else {
              // For smaller screens, use ListView
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductItem(product: products[index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      elevation: 2,
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        leading: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                product.image,
              ),
            ))),
        title: Text(product.name,style: TextStyle(color: Colors.white,fontSize: 30),),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('\$${product.price.toStringAsFixed(2)}',style: TextStyle(color: Colors.white,fontSize:20 ),),
            Text('Rating: ${product.rating.toString()}',style: TextStyle(color: Colors.white,fontSize: 15),),
          ],
        ),
      ),
    );
  }
}
