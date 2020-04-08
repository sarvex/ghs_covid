import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'health.dart';
import 'strings.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  var _regionVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FormBuilder(
              key: _fbKey,
              autovalidate: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderChoiceChip(
                      decoration: InputDecoration(
                        labelText: "How old are you (in years)?",
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      attribute: "age",
                      spacing: 16.0,
                      options: [
                        FormBuilderFieldOption(child: Text('80 + '), value: 'age_80'),
                        FormBuilderFieldOption(child: Text('70 - 79'), value: 'age_70'),
                        FormBuilderFieldOption(child: Text('60 - 69'), value: 'age_60'),
                        FormBuilderFieldOption(child: Text('50 - 59'), value: 'age_50'),
                        FormBuilderFieldOption(child: Text('40 - 49'), value: 'age_40'),
                        FormBuilderFieldOption(child: Text('30 - 39'), value: 'age_30'),
                        FormBuilderFieldOption(child: Text('20 - 29'), value: 'age_20'),
                        FormBuilderFieldOption(child: Text('10 - 19'), value: 'age_10'),
                        FormBuilderFieldOption(child: Text('0 - 9'), value: 'age_0'),
                      ],
                      validators: [FormBuilderValidators.required()],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderChoiceChip(
                      decoration: InputDecoration(
                        labelText: "Gender?",
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      attribute: "gender",
                      spacing: 16.0,
                      options: [
                        FormBuilderFieldOption(child: Text("Male"), value: "male"),
                        FormBuilderFieldOption(child: Text("Female"), value: "female"),
                      ],
                      validators: [FormBuilderValidators.required()],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderChoiceChip(
                      decoration: InputDecoration(labelText: 'Please tell us your region'),
                      spacing: 8.0,
                      attribute: "region",
                      options: [
                        FormBuilderFieldOption(child: Text("Ahafo"), value: "ahf"),
                        FormBuilderFieldOption(child: Text("Ashanti"), value: "ash"),
                        FormBuilderFieldOption(child: Text("Bono"), value: "bon"),
                        FormBuilderFieldOption(child: Text("Bono East"), value: "bne"),
                        FormBuilderFieldOption(child: Text("Central"), value: "cen"),
                        FormBuilderFieldOption(child: Text("Eastern"), value: "eas"),
                        FormBuilderFieldOption(child: Text("Greater Accra"), value: "ACC"),
                        FormBuilderFieldOption(child: Text("North East"), value: "nea"),
                        FormBuilderFieldOption(child: Text("Northern"), value: "nor"),
                        FormBuilderFieldOption(child: Text("Oti"), value: "oti"),
                        FormBuilderFieldOption(child: Text("Savannah"), value: "sav"),
                        FormBuilderFieldOption(child: Text("Upper East"), value: "uea"),
                        FormBuilderFieldOption(child: Text("Upper West"), value: "uwe"),
                        FormBuilderFieldOption(child: Text("Volta"), value: "vol"),
                        FormBuilderFieldOption(child: Text("Western"), value: "wes"),
                        FormBuilderFieldOption(child: Text("Western North"), value: "wno"),
                      ],
                      validators: [FormBuilderValidators.required()],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderSwitch(
                      onChanged: (value) {
                        _regionVisible = value;
                        setState(() {});
                      },
                      label: Text('Have you recently travelled abroad?'),
                      attribute: "abroad",
                      initialValue: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Visibility(
                      visible: _regionVisible,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: FormBuilderFilterChip(
                        decoration: InputDecoration(labelText: "Which Country have you travelled in the past 3 weeks?"),
                        attribute: "region",
                        spacing: 8.0,
                        options: [
                          FormBuilderFieldOption(child: Text("USA"), value: "usa"),
                          FormBuilderFieldOption(child: Text("China"), value: "china"),
                          FormBuilderFieldOption(child: Text("Aisa Pacific"), value: "asia"),
                          FormBuilderFieldOption(child: Text("UK"), value: "uk"),
                          FormBuilderFieldOption(child: Text("Spain"), value: "spain"),
                          FormBuilderFieldOption(child: Text("Italy"), value: "italy"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(Strings.proceed),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HealthPage()),
          );
        },
        tooltip: Strings.proceed,
      ),
    );
  }
}
