import 'package:flutter/material.dart';
import 'package:flutter_08_shared_preferance/model.dart';
import 'package:flutter_08_shared_preferance/shared_prefrence.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _preferenceServices = PreferenceService();
  final _textFieldController = TextEditingController();

  var _selectGender =  Gender.MALE;

  var _programmingLanguage = Set<ProgrammingLanguage>();

  var _isEmployed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _populatedFields();
  }
  void _populatedFields()async{
    final setting = await _preferenceServices.getSetting();

    setState(() {
      _textFieldController.text= setting.userName;
      _selectGender = setting.gender;
      _programmingLanguage = setting.programmingLanguage;
      _isEmployed = setting.isEmployed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: Text('Setting Page'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: TextField(
                controller: _textFieldController,
                decoration: InputDecoration(
                  labelText: "Enter Name"
                ),
              ),
            ),
            RadioListTile(
              title: Text('Male'),
              value: Gender.MALE,
              groupValue:_selectGender,
              onChanged: (newValue){
                setState(() {
                  _selectGender = newValue;
                });
              },
            ),
            RadioListTile(
              title: Text('Female'),
              value: Gender.FEMALE,
              groupValue:_selectGender,
              onChanged: (newValue){
                setState(() {
                  _selectGender = newValue;
                });
              },
            ),
            RadioListTile(
              title: Text('Others'),
              value: Gender.OTHERS,
              groupValue:_selectGender,
              onChanged: (newValue){
                setState(() {
                  _selectGender = newValue;
                });
              },
            ),

            CheckboxListTile(
                title: Text("Java"),
                value: _programmingLanguage.contains(ProgrammingLanguage.JAVA),
                onChanged: (_){
                  setState(() {
                    _programmingLanguage.contains(ProgrammingLanguage.JAVA)?
                    _programmingLanguage.remove(ProgrammingLanguage.JAVA):
                    _programmingLanguage.add(ProgrammingLanguage.JAVA);
                  });

                }),

            CheckboxListTile(
                title: Text("Dart"),
                value: _programmingLanguage.contains(ProgrammingLanguage.DART),
                onChanged: (_){
                  setState(() {
                    _programmingLanguage.contains(ProgrammingLanguage.DART)?
                    _programmingLanguage.remove(ProgrammingLanguage.DART):
                    _programmingLanguage.add(ProgrammingLanguage.DART);
                  });

                }),


            CheckboxListTile(
                title: Text("Swift"),
                value: _programmingLanguage.contains(ProgrammingLanguage.SWIFT),
                onChanged: (_){
                  setState(() {
                    _programmingLanguage.contains(ProgrammingLanguage.SWIFT)?
                    _programmingLanguage.remove(ProgrammingLanguage.SWIFT):
                    _programmingLanguage.add(ProgrammingLanguage.SWIFT);
                  });

                }),


            CheckboxListTile(
                title: Text("Python"),
                value: _programmingLanguage.contains(ProgrammingLanguage.PYTHON),
                onChanged: (_){
                  setState(() {
                    _programmingLanguage.contains(ProgrammingLanguage.PYTHON)?
                    _programmingLanguage.remove(ProgrammingLanguage.PYTHON):
                    _programmingLanguage.add(ProgrammingLanguage.PYTHON);
                  });

                }),

            SwitchListTile(
                title: Text("IsEmployed"),
                value: _isEmployed,
                onChanged: (newValue){
                  setState(() {
                    _isEmployed = newValue;
                  });
                }
            ),

            TextButton(onPressed:_settingUpdate,
                child: Text("Save Changes"))
          ],
        ),
      ),
    );
  }

  void _settingUpdate(){
    final newSettings = Settings(_textFieldController.text,_selectGender,
        _programmingLanguage,_isEmployed);

    print(newSettings);


    _preferenceServices.saveSettings(newSettings);
  }
}
