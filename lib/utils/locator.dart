import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:medium_bloc_cache_project/home/home.dart';

final GetIt locator = GetIt.instance;

Future<void> initialiseLocator() async {
  //key
  const postsKey = 'posts';
  //box
  final postsBox = await Hive.openBox<PostsResponseModel?>(postsKey);

  locator.registerSingleton(
    PostsRepository(postsBox: postsBox),
  );
}
