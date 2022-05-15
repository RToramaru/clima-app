import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper {
  String url;

  ApiHelper(this.url);

  Future getDados() async {
    try {
      http.Response response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        String dados = response.body;
        var dadosJson = jsonDecode(dados);
        return dadosJson;
      } else {
        return null;
      }
    } catch (e) {
      // ignore: avoid_print
      print('Erro $e');
    }
  }
}
