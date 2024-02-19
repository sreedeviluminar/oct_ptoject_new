import 'package:flutter/material.dart';

import '../model/product.dart';

final List<Product> products = [
  Product(
      name: 'Product 1',
      price: '100',
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod/images/hoka-zinal-13085-1643565794.jpg'),
  Product(
      name: 'Product 2',
      price: '150',
      imageUrl:
          'https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/18274390/2022/5/14/c64644f6-840f-4496-bb42-19359e9881771652523841987RoadsterMenBrownTexturedPUSneakers1.jpg'),
  Product(name: "Product 3", price: '200', imageUrl: "imageUrl"),
  // Add more products as needed
];

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = products;

  List<Product> get product => _products;

  final List<Product> _wishList = [];

  List<Product> get wishListProduct => _wishList;

  void addToWishList(Product selectedProduct) {
    _wishList.add(selectedProduct);
    print(_wishList);
    notifyListeners();
  }

  void removeFromWishList(Product selectedProduct) {
    _wishList.remove(selectedProduct);
    print(_wishList);
    notifyListeners();
  }
}
