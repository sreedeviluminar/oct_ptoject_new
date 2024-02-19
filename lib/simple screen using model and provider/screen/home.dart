import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:oct_ptoject_new/simple%20screen%20using%20model%20and%20provider/controller/product%20provider.dart';
import 'package:oct_ptoject_new/simple%20screen%20using%20model%20and%20provider/screen/wishlistpage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ProductProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductListScreen());
  }
}

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopeee 🛍️'),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => WishListPage()));
          },icon: Consumer(builder: (context, ProductProvider provider, child) {
            return Icon(Icons.favorite,
                color: provider.wishListProduct.isNotEmpty
                    ? Colors.red
                    : Colors.black);
          }))
        ],
      ),
      body: Consumer<ProductProvider>(builder: (BuildContext context,
          ProductProvider productProvider, Widget? child) {
        return ListView.builder(
          itemCount: productProvider.product.length,
          itemBuilder: (context, index) {
            var selectedProduct = productProvider.product[index];
            return ListTile(
              title: Text(productProvider.product[index].name),
              subtitle:
                  Text('Price: \$${productProvider.product[index].price}'),
              leading: CachedNetworkImage(
                imageUrl: productProvider.product[index].imageUrl,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: 50,
                // Set the width as needed
                height: 50,
                // Set the height as needed
                fit: BoxFit.cover,
              ),
              trailing: IconButton(
                  onPressed: () {
                    if (!productProvider.wishListProduct.contains(selectedProduct)) {
                      productProvider.addToWishList(selectedProduct);
                    } else {
                      productProvider.removeFromWishList(selectedProduct);
                    }
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: productProvider.wishListProduct.contains(selectedProduct)
                        ? Colors.red
                        : Colors.grey,
                  )),
            );
          },
        );
      }),
    );
  }
}
