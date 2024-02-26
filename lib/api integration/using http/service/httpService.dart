import 'package:http/http.dart' as http;
import 'package:oct_ptoject_new/api%20integration/using%20http/model/product_model.dart';

///read all the product from api
///where base url = https://fakestoreapi.com
///and end point is = /products
class HttpService {
  static Future<List<ProductModel>> fetchProduct() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      var data = response.body;
      return productModelFromJson(data);
    } else {
      throw Exception();
    }
  }
}
