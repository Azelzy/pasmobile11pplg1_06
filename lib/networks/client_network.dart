import 'package:http/http.dart' as http;
import 'package:pasmobile11pplg1_06/models/store_model.dart';

class ClientNetwork {
  static const String baseUrl = 'https://mediadwi.com/api/latihan';
  static const String fakeStoreUrl = 'https://fakestoreapi.com';
  static const String endpoint = 'latihan/login';
  static const String anotherEndpoint = 'latihan/register';

  static String get login => baseUrl + endpoint;
  static String get register => baseUrl + anotherEndpoint;

  // Get all products from FakeStore API
  static Future<List<FakeStoreModel>> getProducts() async {
    try {
      final response = await http
          .get(Uri.parse('$fakeStoreUrl/products'))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final List<FakeStoreModel> products = fakeStoreModelFromJson(
          response.body,
        );
        return products;
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}
