import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/cubit/theme_cubit.dart';
import 'package:movie_app/presentation/cubit/language_cubit.dart';
import 'package:movie_app/presentation/screens/movie_list_screen.dart';
import 'package:movie_app/presentation/cubit/movie_cubit.dart';
import 'package:movie_app/presentation/cubit/genre_cubit.dart';
import 'package:movie_app/core/app_injector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Usar AppInjector para obtener las dependencias
    final fetchPopularMovies = AppInjector.getFetchPopularMovies();
    final fetchGenres = AppInjector.getFetchGenres();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => LanguageCubit()),
        BlocProvider(create: (context) => MovieCubit(fetchPopularMovies)),
        BlocProvider(create: (context) => GenreCubit(fetchGenres)),
      ],
      child: BlocBuilder<ThemeCubit, ThemeModeState>(
        builder: (context, themeState) {
          // Determinar el tema según el estado
          ThemeData themeData;
          if (themeState == ThemeModeState.dark) {
            themeData = ThemeData.dark();
          } else {
            themeData = ThemeData.light();
          }

          return BlocBuilder<LanguageCubit, Language>(
            builder: (context, languageState) {
              String languageCode;
              switch (languageState) {
                case Language.esMX:
                  languageCode = 'es-MX';
                  break;
                case Language.enUS:
                default:
                  languageCode = 'en-US';
                  break;
              }

              return MaterialApp(
                title: 'Flutter Movie App',
                theme: themeData, // Aplicar el tema dinámicamente
                home: MovieListScreen(
                  language: languageCode, // Pasar el idioma seleccionado
                ),
              );
            },
          );
        },
      ),
    );
  }
}
