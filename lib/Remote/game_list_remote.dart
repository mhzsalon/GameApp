import 'dart:convert';

import 'package:gameapp/Model/game_model.dart';
import 'package:gameapp/utils/common.dart';
import 'package:http/http.dart' as http;

class GameDataRemote {
  // Asynchronous method for fetching data
  Future<List<Result>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(StringResource.baseUrl));      // Making an HTTP GET request

      // Storing response data
      final responseData = json.decode(response.body);
      final List<dynamic> results = responseData['results'];

      // Mapping the response data into the model
      final List<Result> games = results.map((gameData) {
        return Result.fromJson(gameData as Map<String, dynamic>);
      }).toList();

      // Returning the list of Result objects
      return games;
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
