// Returns the GameDataRemote Class
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gameapp/Remote/game_detail._remote.dart';

final detailRepository = Provider((ref) => GameDetailRemote());

final gameDataProvider = FutureProvider((ref) {
  final authController = ref.watch(detailRepository);
  return authController.fetchGameDetail();
});
