import 'package:flutter_bloc/flutter_bloc.dart';

enum Language { enUS, esMX }

class LanguageCubit extends Cubit<Language> {
  LanguageCubit() : super(Language.enUS); // Valor por defecto: inglés

  void changeLanguage(Language language) {
    emit(language);
  }
}
