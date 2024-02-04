import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pizzeria/models/pizza.dart';

class PizzeriaService {
  static final String uri = 'http://localhost:8888/static/images/pizzas/';

  Future<List<Pizza>> fetchPizzas() async {
    List<Pizza> list = [];
    try {
      final response =
          await http.get(Uri.parse('http://localhost:8888/flutterApi/pizzas'));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        for (final pizzaData in jsonData) {
          list.add(Pizza.fromJson(pizzaData));
        }
      } else {
        throw Exception('Impossible de recupérer les pizzas');
      }
    } catch (e) {
      throw e;
    }
    return list;
  }
}
