import 'dart:convert';

import 'package:gameapp/Model/game_detail_model.dart';
import 'package:gameapp/utils/common.dart';
import 'package:http/http.dart' as http;

class GameDetailRemote {
  // Asynchronous method for fetching data
  Future<GameModel> fetchGameDetail() async {
    try {
      final response = await http.get(Uri.parse(
          StringResource.gameDetailUrl)); // Making an HTTP GET request

      // Storing response data
      final responseData = json.decode(response.body);

      // Mapping the response data into the model
      final games = GameModel.fromJson(responseData);

      // Returning the list of Result objects
      return games;
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
