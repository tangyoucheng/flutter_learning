import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
//          Theme(data: ThemeData(primaryColor: Colors.blue), child: ThemeDemo()),
          Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.blue),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RegeditFormDemo(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegeditFormDemo extends StatefulWidget {
  @override
  _RegeditFormDemoState createState() => _RegeditFormDemoState();
}

class _RegeditFormDemoState extends State<RegeditFormDemo> {
  final _registerFormKey = GlobalKey<FormState>();
  String userName, password;
  bool _autovalidate = false;

  void submitRegisterForm() {
    if (_registerFormKey.currentState.validate()) {
      _registerFormKey.currentState.save();

      debugPrint('userName ${userName}');
      debugPrint('password ${password}');

      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Register……'),));
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }

  String validatorUserName(_value) {
    if (_value.isEmpty) {
      return 'Username is required.';
    }
    return null;
  }

  String validatorPassword(_value) {
    if (_value.isEmpty) {
      return 'Password is required.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'UserName', helperText: ''),
            onSaved: (value) {
              userName = value;
            },
            validator: validatorUserName,
            autovalidate: _autovalidate,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password', helperText: ''),
            onSaved: (value) {
              password = value;
            },
            validator: validatorPassword,
            autovalidate: _autovalidate,
          ),
          SizedBox(
            height: 32.0,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: submitRegisterForm,
              color: Theme.of(context).accentColor,
              child: Text('Register', style: TextStyle(color: Colors.white)),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
//    textEditingController.text = 'hi';
    textEditingController.addListener(() => {
          debugPrint('${textEditingController.text}'),
        });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
//      onChanged: (value) => debugPrint('${value}'),
//      onSubmitted: (value)=>debugPrint('${value}'),
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'Title',
        hintText: 'Enter ths post Name.',
//        border: InputBorder.none,
//        border: OutlineInputBorder(),
        filled: true,
//        fillColor:
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
    );
  }
}
