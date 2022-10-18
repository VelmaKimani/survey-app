import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:survey_app/models/model.dart';

class ApiService {
  final Dio _dio = Dio();
  Future<Response?> getQuestion() async {
    try {
      final Response? response = await _dio
          .get('https://run.mocky.io/v3/d628facc-ec18-431d-a8fc-9c096e00709a');

      return response;
    } catch (e) {
      rethrow;
    }
  }

  /*  final url = Uri.parse(
      'https://run.mocky.io/v3/d628facc-ec18-431d-a8fc-9c096e00709a',
    );
    try {
      final response = await http.get(url);

      final List<Option> allOptions = [];

      final extractedOptions =
          json.decode(response.body) as Map<String, dynamic>;

      if (extractedOptions == null) {
        extractedOptions.forEach((quiz, text) {
          allOptions.followedBy(allOptions);
        });
      }
      if (response.statusCode == 200) {
        //return Question.fromJson(
        // jsonDecode(response.body) as Map<String, dynamic>);
        // return json.decode(response.body);
      } else {
        throw Exception('Loading error');
      }
    } catch (error) {
      print("Error: $error");
    }
  } */
}
