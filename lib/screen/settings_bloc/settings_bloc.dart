import 'package:bloc/bloc.dart';
import 'package:flutter_localization/screen/settings_bloc/settings_event.dart';
import 'package:flutter_localization/screen/settings_bloc/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(): super(EnglishLocaleState()){
    on(_changeLanguage);
  }

  void _changeLanguage(ChangeLanguage event,Emitter<SettingsState> emit){
    if(event.language == 'bn'){
      emit(BanglaLocaleState());
    }else if(event.language == 'en'){
      emit(EnglishLocaleState());
    }
  }

}