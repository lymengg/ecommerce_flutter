import 'package:ecommerce_app/config/app_config.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Product>> fetchProductList() async {
    var url = Uri.https(AppConfig().baseUrl, AppConfig().product);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<Product> products = productFromJson(response.body);
      return products;
    }

    return [];
  }
}
