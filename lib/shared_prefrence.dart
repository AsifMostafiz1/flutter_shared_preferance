import 'package:shared_preferences/shared_preferences.dart';

import 'model.dart';


class PreferenceService{
  Future saveSettings(Settings settings) async
  {
    final preference = await SharedPreferences.getInstance();

    await preference.setString('userName', settings.userName);
    await preference.setBool("isEmployed", settings.isEmployed);
    await preference.setInt("gender", settings.gender.index);
    await preference.setStringList("programmingLanguage", 
        settings.programmingLanguage.map((e) => e.index.toString()).toList());


    print("Save Setting");

  }
  Future<Settings> getSetting() async
  {
    final preference = await SharedPreferences.getInstance();
    
    final userName = preference.getString('userName');
    final isEmployed = preference.getBool('isEmployed');
    
    final gender = Gender.values[preference.getInt('gender')?? 0];
    
    final programmingLanguageIndicates = preference.getStringList('programmingLanguage');
    
    final programmingLanguage = programmingLanguageIndicates.map((e) => ProgrammingLanguage.values[int.parse(e)]).toSet();


    return Settings(userName, gender, programmingLanguage, isEmployed);
  }
}