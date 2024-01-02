import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gameapp/Remote/game_list_remote.dart';

// Returns the GameDataRemote Class
final gameDataRepository = Provider((ref) => GameDataRemote());

// FutureProvider for fetching remote result data
final remoteResultData = FutureProvider((ref) {
  final authController = ref.watch(gameDataRepository);
  return authController.fetchData();
});

class SelectedGenreNotifier extends StateNotifier<String> {
// Initializes the state with the default value "All".
  SelectedGenreNotifier() : super("All");

  // Method to update the state with a new genre.
  void update(String newGenre) {
    state = newGenre;
  }
}

//Returns the selected genre
final selectedGenreProvider =
    StateNotifierProvider<SelectedGenreNotifier, String>(
        (ref) => SelectedGenreNotifier());
