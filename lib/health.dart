import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'covid.dart';
import 'strings.dart';

class HealthPage extends StatefulWidget {
  @override
  _HealthPageState createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
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
                    child: FormBuilderSwitch(
                      label: Text('Do you Smoke?'),
                      attribute: "smoke",
                      initialValue: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderFilterChip(
                      decoration: InputDecoration(labelText: "Do you have any disease?"),
                      attribute: "disease",
                      spacing: 8.0,
                      options: [
                        FormBuilderFieldOption(child: Text("Lung Disease"), value: "lung"),
                        FormBuilderFieldOption(child: Text("Asthama"), value: "asthama"),
                        FormBuilderFieldOption(child: Text("Heart Disease"), value: "heart"),
                        FormBuilderFieldOption(child: Text("Diabities"), value: "diabities"),
                        FormBuilderFieldOption(child: Text("Kidney Disease"), value: "kidney"),
                        FormBuilderFieldOption(child: Text("Cancer"), value: "cancer"),
                      ],
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
            MaterialPageRoute(builder: (context) => CovidPage()),
          );
        },
        tooltip: Strings.proceed,
      ),
    );
  }
}
