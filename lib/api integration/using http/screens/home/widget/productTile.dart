import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../model/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel productModel;

  ProductTile(this.productModel);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal.withOpacity(.3),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: Container(
                //height: 200,
                width: double.infinity,
                decoration:
                    BoxDecoration(image: DecorationImage(
                      fit: BoxFit.cover,
                        image: NetworkImage(productModel.image!))),
              ),
            ),
            const SizedBox(height: 10,),
            Text(productModel.title!,
            style: GoogleFonts.jacquesFrancois(
              fontWeight: FontWeight.bold,fontSize: 20
            ),),
            const SizedBox(height: 7,),
            Text('\$${productModel.price!}',
              style: GoogleFonts.jacquesFrancois(
                  fontWeight: FontWeight.bold,fontSize: 15
              ),),
            const SizedBox(height: 7,),
            Text('⭐⭐⭐${productModel.rating?.rate} ',
              style: GoogleFonts.jacquesFrancois(
                  fontWeight: FontWeight.bold,fontSize: 15
              ),)
          ],
        ),
      ),
    );
  }
}
