import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreen createState() => new _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    bool isValid = true;
    return Scaffold(
      backgroundColor: Color(0xFF69ade4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.assets('assets/img/logo_salle_maps.png),
                    Text('Login', style: Theme.of(context).textTheme.headline1),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          errorText:
                              isValid ? null : 'Please, enter your name.',
                          suffixIcon: Icon(Icons.person),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          errorText:
                              isValid ? null : 'Please, enter your email.',
                          suffixIcon: Icon(Icons.mail),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          errorText:
                              isValid ? null : 'Please, enter your password.',
                          suffixIcon: Icon(Icons.visibility_off), // Add onTap
                          border: const OutlineInputBorder(),
                        ),
                        obscureText: true, // Update with suffix's onTap
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Forgot password?'),
                          Text('Don' 't have an account?'),
                        ],
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
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Login',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    )),
                              ],
                            ),
                          ),
                        ),
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
                          color: Colors.white,
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/google_logo.png',
                                    height: 35.0),
                                Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Login with Google',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    )),
                              ],
                            ),
                          ),
                        ),
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
                          color: Colors.white,
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/facebook_logo.png',
                                    height: 35.0),
                                Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Login with Facebook',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    )),
                              ],
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
      ),
    );
  }
}
