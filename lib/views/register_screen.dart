import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salle_maps/services/services.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreen createState() => new _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  var _emailCntlr = TextEditingController();
  var _passCntlr = TextEditingController();
  var _confirmPassCntlr = TextEditingController();

  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF69ade4),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sign Up', style: Theme.of(context).textTheme.headline1),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      controller: _emailCntlr,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        suffixIcon: Icon(Icons.mail),
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        return validateEmail(value);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      controller: _passCntlr,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: Icon(Icons.visibility_off), // Add onTap
                        border: const OutlineInputBorder(),
                      ),
                      obscureText: true, // Update with suffix's onTap
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please, enter your name.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      controller: _confirmPassCntlr,
                      decoration: InputDecoration(
                        hintText: 'Confirm password',
                        suffixIcon: Icon(Icons.visibility_off), // Add onTap
                        border: const OutlineInputBorder(),
                      ),
                      obscureText: true, // Update with suffix's onTap
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please, enter your name.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: GestureDetector(
                      child: Text('Already have an account?'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: FlatButton(
                        splashColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        color: Colors.black26,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            if (_passCntlr.text == _confirmPassCntlr.text) {
                              final res = await auth.signUp(
                                  _emailCntlr.text, _passCntlr.text);
                              switch (res) {
                                case Global.signUpSuccess:
                                  {
                                    Navigator.pop(context);
                                  }
                                  break;
                                case Global.signUpErrorPassword:
                                  {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("weak password"),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                  break;
                                case Global.signUpErrorEmail:
                                  {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("email already in use"),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                  break;
                                case Global.signUpError:
                                  {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("error signing up"),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                  break;
                              }
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("passwords don't match"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Sign Up',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter email';
    } else {
      if (!regex.hasMatch(value))
        return 'Enter valid email';
      else
        return null;
    }
  }
}
