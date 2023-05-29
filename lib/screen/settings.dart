// ignore_for_file: must_be_immutable


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/languages/locale_keys.g.dart';
import 'package:flutter_localization/screen/settings_bloc/settings_bloc.dart';
import 'package:flutter_localization/screen/settings_bloc/settings_event.dart';
import 'package:flutter_localization/screen/settings_bloc/settings_state.dart';
import 'package:flutter_localization/shared/widgets/custom_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (context) => SettingsBloc(),
      child: SettingsBody(),
    );
  }
}


class SettingsBody extends StatelessWidget {
  SettingsBody({Key? key}) : super(key: key);

  late SettingsBloc _settingsBloc;

  @override
  Widget build(BuildContext context) {
    _settingsBloc = BlocProvider.of<SettingsBloc>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  height: 40,
                  width: 100,
                  color: Colors.green,
                  child: BlocBuilder<SettingsBloc,SettingsState>(
                    bloc: _settingsBloc,
                    builder: (context, state) {
                      return  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButton(
                            title: 'বাং',
                            onPressed: ()async{
                              await context.setLocale(const Locale('bn','BD'));
                              _settingsBloc.add(ChangeLanguage(language: 'bn'));
                            },
                            color: state is BanglaLocaleState ? Colors.white: Colors.transparent,
                          ),
                          CustomButton(
                            title: 'Eng',
                            onPressed: ()async{
                              await context.setLocale(const Locale('en','US'));
                              _settingsBloc.add(ChangeLanguage(language: 'en'));
                            },
                            color: state is EnglishLocaleState ? Colors.white: Colors.transparent,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: double.maxFinite,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide()
                ),
              ),
            ),
            Text(LocaleKeys.no_data.tr()),
          ],
        ),
      ),
    );
  }
}
