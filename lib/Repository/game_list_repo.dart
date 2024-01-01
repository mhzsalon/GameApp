import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gameapp/Remote/game_list_remote.dart';

final gameDataRepository = Provider((ref) => GameDataRemote());

// FutureProvider for fetching remote result data
final remoteResultData = FutureProvider((ref) {
  final authController = ref.watch(gameDataRepository);
  return authController.fetchData();
});

