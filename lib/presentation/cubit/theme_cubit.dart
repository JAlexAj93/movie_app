import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeModeState { light, dark }

class ThemeCubit extends Cubit<ThemeModeState> {
  // Al inicio el tema será claro
  ThemeCubit() : super(ThemeModeState.light);

  // Método para cambiar a modo oscuro
  void setDarkMode() {
    emit(ThemeModeState.dark);
  }

  // Método para cambiar a modo claro
  void setLightMode() {
    emit(ThemeModeState.light);
  }
}
