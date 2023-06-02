import 'package:medium_bloc_cache_project/app/app.dart';
import 'package:medium_bloc_cache_project/bootstrap.dart';
import 'package:medium_bloc_cache_project/utils/utils.dart';

Future<void> main() async {
  await appInitialiser();
  await bootstrap(() => const App());
}
