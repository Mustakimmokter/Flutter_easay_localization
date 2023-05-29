import 'package:equatable/equatable.dart';
import 'package:flutter_localization/screen/settings_bloc/settings_state.dart';

abstract class SettingsEvent extends Equatable {}


class ChangeLanguage extends SettingsEvent {
  ChangeLanguage({required this.language});
  final String language;
  @override
  List<Object?> get props => [language];
}