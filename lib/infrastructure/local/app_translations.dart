import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en.dart';
import 'fr.dart';

class AppTranslations extends Translations {

  // Default locale
  static var locale =  const Locale('en', 'US');
  //static var locale = Get.locale;
  //static var locale = Get.locale??const Locale('en', 'US');
  //Get.deviceLocale

  // fallbackLocale saves the day when the locale gets in trouble
  static var fallbackLocale = Get.locale??const Locale('fr', 'CM');

  // Supported languages
  // Needs to be same order with locales
  static final languages = [
    'en',
    'fr'
  ];

  // Supported locales
  // Needs to be same order with languages
  static final locales = [
    const Locale('en' , 'US'),
    const Locale('fr' , 'CM')
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enLang,
    'fr_CM': frLang,
  };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);

  }

  // Finds language in `languages` list and returns it as Locale
  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < languages.length; i++) {
      if (lang == languages[i]) return locales[i];
    }
    return Get.locale;
  }

  // Locale getLocal()  {
  //   Future.delayed(Duration.zero,() async {
  //     String prefLangCode = await PreferenceManager.getString(AppConstants.selectedLocale);
  //     if(prefLangCode.isNotEmpty){
  //       return _getLocaleFromLanguage(prefLangCode);
  //     }
  //   });
  //   return const Locale('en');
  // }

}
