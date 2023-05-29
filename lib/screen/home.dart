import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/languages/locale_keys.g.dart';
import 'package:flutter_localization/screen/settings.dart';
import 'package:flutter_localization/shared/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final nameCTRL = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomDrawer(),

            TextFormField(
              controller: nameCTRL,
              // keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: LocaleKeys.text_filed_name_hint.tr(),
              ),
              onChanged: (nameValue) {
                nameValue = nameCTRL.text;
              },
            ),
            const SizedBox(height: 16),
            CustomButton(
              height: 40,
              width: double.maxFinite,
              title: LocaleKeys.buttons_save.tr(),
              onPressed: () {},
              titleColor: Colors.white,
            ),
          ],
        ),
      ),
      drawer: DrawerBody(),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  IconButton(onPressed: (){
      Scaffold.of(context).openDrawer();
    },
      icon: const Icon(Icons.menu),
    );
  }
}

class DrawerBody extends StatelessWidget {
  const DrawerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16,right: 16,top: 60),
      width: 250,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 60,
          ),
          SizedBox(height: 20),
          Text('User Name'),
          SizedBox(height: 40),
          GestureDetector(
            child: Text('1. Settings'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>SettingsScreen()));
            },
          ),
          SizedBox(height: 10),
          Text('1. About')
        ],
      ),
    );
  }
}


