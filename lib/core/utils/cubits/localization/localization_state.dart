part of 'localization_cubit.dart';

abstract class LocalizationState {}

class LocalizationInitial extends LocalizationState {}

class LanguageChangedState extends LocalizationState {
  final String languageCode;

  LanguageChangedState(this.languageCode);
}
