// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import '../models/login_model.dart';
import '../models/product_model.dart';
import '../models/register_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'https://mediadwi.com/api/latihan';
  static const String productUrl = 'https://fakestoreapi.com';

  static Future<RegisterModel> register(
      String username,
      String password,
      String full_name,
      String email,
      ) async {
    final url = Uri.parse('$baseUrl/register-user');

    final response = await http.post(url, body: {
      'username': username,
      'password': password,
      'full_name': full_name,
      'email': email,
    });

    print(response.statusCode);
    print(response.body);

    final decoded = jsonDecode(response.body);

    if (decoded['status'] == true) {
      return RegisterModel(
        username: username,
        password: password,
        full_name: full_name,
        email: email,
      );
    } else {
      throw Exception(decoded['message'] ?? "Register gagal.");
    }
  }

  static Future<LoginModel> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/login');

    final response = await http.post(url, body: {
      'username': username,
      'password': password,
    });

    print(response.statusCode);
    print(response.body);

    final decoded = jsonDecode(response.body);

    if (decoded['status'] == true) {
      final token = decoded['token'];

      // Simpan token ke SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", token);

      // Return login model
      return LoginModel(
        username: username,
        password: password,
        token: token,
      );
    } else {
      throw Exception(decoded['message'] ?? "Login gagal.");
    }
  }

  static Future<List<ProductModel>> getProduct() async {
    final url = Uri.parse('$productUrl/products');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception("Gagal memuat produk");
    }
  }
}