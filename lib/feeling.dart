import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'strings.dart';
import 'thanks.dart';

class FeelingPage extends StatefulWidget {
  @override
  _FeelingPageState createState() => _FeelingPageState();
}

class _FeelingPageState extends State<FeelingPage> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  var _regionVisible = false;

  @override
  Widget build(BuildContext context) {
    bool _fever = false;
    bool _cough = false;
    bool _breath = false;
    bool _taste = false;

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
                      onChanged: (value) {
                        _fever = value;
                        setState(() {});
                      },
                      label: Text('Do you have fever?'),
                      attribute: "fever",
                      initialValue: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderSwitch(
                      onChanged: (value) {
                        _cough = value;
                        setState(() {});
                      },
                      label: Text('Do you have cough (new or old)?'),
                      attribute: "cough",
                      initialValue: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderSwitch(
                      onChanged: (value) {
                        _breath = value;
                        setState(() {});
                      },
                      label: Text('Do you have shortness of breadth?'),
                      attribute: "breadth",
                      initialValue: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderSwitch(
                      onChanged: (value) {
                        _taste = value;
                        setState(() {});
                      },
                      label: Text('Do you have loss of taste or smell?'),
                      attribute: "taste",
                      initialValue: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Visibility(
                      visible: _fever || _cough || _breath || _taste,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: FormBuilderTouchSpin(
                        decoration: InputDecoration(labelText: "How long have you had these symptoms"),
                        attribute: "stepper",
                        initialValue: 0,
                        min: 1,
                        max: 14,
                        step: 1,
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
            MaterialPageRoute(builder: (context) => ThanksPage()),
          );
        },
        tooltip: Strings.proceed,
      ),
    );
  }
}
