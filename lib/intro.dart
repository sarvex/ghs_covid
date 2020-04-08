import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'about.dart';
import 'strings.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
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
            Image.asset('images/logo.jpg'),
            RichText(
              textScaleFactor: 1.5,
              text: TextSpan(
                  text: Strings.introduction,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
            ),
            FormBuilder(
              key: _fbKey,
              autovalidate: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
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
                    padding: const EdgeInsets.all(16.0),
                    child: FormBuilderTextField(
                      attribute: 'email',
                      decoration: InputDecoration(labelText: 'Email Address', hintText: 'email@server.com'),
                      validators: [FormBuilderValidators.required(), FormBuilderValidators.email()],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FormBuilderSwitch(
                      label: Text('I agree to receive Notifications from GHS COVID-19 Tracker'),
                      attribute: "notifications",
                      initialValue: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
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
