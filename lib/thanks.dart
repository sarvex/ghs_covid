import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'about.dart';
import 'strings.dart';

class ThanksPage extends StatefulWidget {
  ThanksPage({Key key}) : super(key: key);

  @override
  _ThanksPageState createState() => _ThanksPageState();
}

class _ThanksPageState extends State<ThanksPage> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/logo.png'),
            RichText(
              text: TextSpan(text: Strings.introduction),
            ),
            FormBuilder(
              key: _fbKey,
              autovalidate: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderTextField(
                      attribute: 'phone',
                      decoration: InputDecoration(labelText: 'Phone Number'),
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(10),
                        FormBuilderValidators.maxLength(10),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderTextField(
                      attribute: 'email',
                      decoration: InputDecoration(labelText: 'Email Address', hintText: 'email@server.com'),
                      validators: [FormBuilderValidators.required(), FormBuilderValidators.email()],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderSwitch(
                      label: Text('I agree to receive Notifications from GHS COVID-19 Tracker'),
                      attribute: "notifications",
                      initialValue: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderSwitch(
                      label: Text('I agree with T&Cs and privacy policy'),
                      attribute: "notifications",
                      initialValue: false,
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
            MaterialPageRoute(builder: (context) => AboutPage()),
          );
        },
        tooltip: Strings.proceed,
      ),
    );
  }
}
