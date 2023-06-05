import 'package:hive/hive.dart';
import 'package:medium_bloc_cache_project/home/home.dart';

Future<void> initialiseHive() async {
  //key
  const postsKey = 'posts';
  //adapters
  Hive.registerAdapter(PostsModelAdapter());
  //box
  final postsBox = await Hive.openBox<PostsModel?>(postsKey);
  //repos
  PostsRepository(postsBox: postsBox);
}
