import 'package:bloc/bloc.dart';
import 'package:mini_shopping_app/constant.dart';
import 'package:mini_shopping_app/core/helper/services/shared_preferance.dart';
import 'package:mini_shopping_app/core/widgts/user_message.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());

  Future<void> changeLanguage(String lang) async {
    final langsaved = SharedPreferance.getData<String>(Constant.languageCode);

    if (langsaved != lang || langsaved == null) {
      await SharedPreferance.setData(key: Constant.languageCode, value: lang);

      emit(LanguageChangedState(lang));
    } else {
      Usermessage.show(message: "message");
      emit(LanguageChangedState(lang));
    }
  }
}
