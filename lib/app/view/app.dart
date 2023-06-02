import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medium_bloc_cache_project/home/home.dart';
import 'package:medium_bloc_cache_project/l10n/l10n.dart';
import 'package:medium_bloc_cache_project/utils/utils.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final postsRepository = locator<PostsRepository>();
    return RepositoryProvider(
      create: (context) => postsRepository,
      child: BlocProvider(
        create: (context) => PostsCubit(postsRepository: postsRepository),
        child: MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
            colorScheme: ColorScheme.fromSwatch(
              accentColor: const Color(0xFF13B9FF),
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
