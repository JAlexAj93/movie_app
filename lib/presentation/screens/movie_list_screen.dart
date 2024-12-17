import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/utils.dart';
import 'package:movie_app/presentation/cubit/movie_cubit.dart';
import 'package:movie_app/presentation/cubit/theme_cubit.dart';
import 'package:movie_app/presentation/cubit/language_cubit.dart';
import 'package:movie_app/presentation/widgets/menu_drawer.dart';
import 'package:movie_app/presentation/widgets/movie_list_view.dart';
import 'package:movie_app/presentation/cubit/genre_cubit.dart';

class MovieListScreen extends StatefulWidget {
  final String language;

  const MovieListScreen({super.key, required this.language});

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isDarkMode = false; // Estado local para el modo oscuro

  @override
  void initState() {
    super.initState();
    context.read<GenreCubit>().loadGenres(widget.language);
    context.read<MovieCubit>().loadMovies(1, widget.language);
    _scrollController.addListener(_loadMoreMovies);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreMovies() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<MovieCubit>().loadMoreMovies(widget.language);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MovieApp"),
      ),
      drawer: MenuDrawer(
        onLanguageChange: _changeLanguage,
        isDarkMode: _isDarkMode, // Pasa el estado del modo oscuro
        onToggleDarkMode:
            _toggleDarkMode, // Pasa el callback para cambiar el modo oscuro
      ),
      body: MovieListView(
        scrollController: _scrollController,
        language: widget.language,
      ),
    );
  }

  void _changeLanguage(Language language) {
    final currentLanguage = BlocProvider.of<LanguageCubit>(context).state;

    if (currentLanguage != language) {
      context.read<LanguageCubit>().changeLanguage(language);
      context
          .read<MovieCubit>()
          .loadMovies(1, Utils().languageToString(language));
      context.read<GenreCubit>().loadGenres(Utils().languageToString(language));
    }
  }

  void _toggleDarkMode(bool isDark) {
    setState(() {
      _isDarkMode = isDark;
    });
    if (_isDarkMode) {
      context.read<ThemeCubit>().setDarkMode();
    } else {
      context.read<ThemeCubit>().setLightMode();
    }
  }
}
