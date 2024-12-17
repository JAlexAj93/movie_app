import 'package:movie_app/presentation/cubit/language_cubit.dart';

class Utils {
  //funcion para cambiar de languague a String
  String languageToString(Language language) {
    switch (language) {
      case Language.esMX:
        return 'es-MX';
      case Language.enUS:
      default:
        return 'en-US';
    }
  }
}
