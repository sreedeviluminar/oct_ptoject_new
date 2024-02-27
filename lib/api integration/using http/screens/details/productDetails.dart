import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oct_ptoject_new/api%20integration/using%20http/controller/productController.dart';

import '../../model/product_model.dart';

class ProductDetailss extends StatelessWidget {
  ProductModel product;
  ProductDetailss(this.product);

  ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Details!! 🛍️"),
        backgroundColor: Colors.teal[800],
        elevation: 5,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 400,
              width: double.infinity,
              decoration:
              BoxDecoration(image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(product.image!))),
            ),
          ),
          const SizedBox(height: 10,),
          Text(product.title!,
            style: GoogleFonts.galada(
                fontWeight: FontWeight.bold,fontSize: 30
            ),),
          const SizedBox(height: 10,),
          Text(product.description!,
            style: GoogleFonts.jacquesFrancois(
                fontWeight: FontWeight.bold,fontSize: 15
            ),),
          const SizedBox(height: 7,),
          Text('\$${product.price!}',
            style: GoogleFonts.fahkwang(
                fontStyle: FontStyle.italic,fontSize: 15
            ),),
          const SizedBox(height: 7,),
          Text('⭐⭐⭐${product.rating?.rate} ',
            style: GoogleFonts.jacquesFrancois(
                fontWeight: FontWeight.bold,fontSize: 15
            ),)
        ],
      ),
    );
  }
}
