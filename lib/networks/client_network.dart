import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pasmobile11pplg1_06/models/login_model.dart';
import 'package:pasmobile11pplg1_06/models/register_model.dart';
import 'package:pasmobile11pplg1_06/models/fakestore_model.dart';

class ClientNetwork {
  static const String _baseUrl = 'https://mediadwi.com/api/latihan';
  static const String _fakeStoreUrl = 'https://fakestoreapi.com';

  // Register
  static Future<RegisterModel> register({
    required String username,
    required String password,
    required String fullName,
    required String email,
  }) async {
    try {
      final response = await http
          .post(
            Uri.parse('$_baseUrl/register-user'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'username': username,
              'password': password,
              'full_name': fullName,
              'email': email,
            }),
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return RegisterModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to register: ${response.body}');
      }
    } catch (e) {
      throw Exception('Register error: $e');
    }
  }

  // Login
  static Future<LoginModel> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await http
          .post(
            Uri.parse('$_baseUrl/login'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'username': username, 'password': password}),
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return LoginModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to login: ${response.body}');
      }
    } catch (e) {
      throw Exception('Login error: $e');
    }
  }

  // Get all products from FakeStore API
  static Future<List<FakeStoreModel>> getProducts() async {
    try {
      final response = await http
          .get(Uri.parse('$_fakeStoreUrl/products'))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return fakeStoreModelFromJson(response.body);
      } else {
        throw Exception('Failed to fetch products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Get products error: $e');
    }
  }

  // Get single product
  static Future<FakeStoreModel> getProductById(int id) async {
    try {
      final response = await http
          .get(Uri.parse('$_fakeStoreUrl/products/$id'))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return FakeStoreModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to fetch product: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Get product error: $e');
    }
  }
}
