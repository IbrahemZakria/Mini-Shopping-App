import 'package:bloc/bloc.dart';
import 'package:mini_shopping_app/constant.dart';
import 'package:mini_shopping_app/core/helper/services/shared_preferance.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());

  Future<void> changeLanguage() async {
    final langsaved = SharedPreferance.getData<String>(Constant.key);

    if (langsaved == 'en') {
      await SharedPreferance.setData(key: Constant.key, value: 'ar');

      emit(LanguageChangedState('en'));
    } else if (langsaved == 'ar' || langsaved == null) {
      await SharedPreferance.setData(key: Constant.key, value: 'en');

      emit(LanguageChangedState(langsaved ?? 'en'));
    }
  }
}
