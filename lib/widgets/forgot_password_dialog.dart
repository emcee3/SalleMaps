import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salle_maps/services/services.dart';

class ForgotPasswordDialog extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Forgot password'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      suffixIcon: Icon(Icons.mail), // Add onTap
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value.isEmpty ? 'Please, enter your email.' : null,
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
                          String res = await context
                              .read<AuthService>()
                              .sendPasswordResetEmail(
                                  _emailController.text.trim());
                          switch (res) {
                            case Global.sendSuccess:
                              Navigator.pop(context);
                              break;
                            case Global.invalidEmailError:
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Invalid mail.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              break;
                            case Global.userNotFoundError:
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('No user found for that mail.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              break;
                          }
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Send email',
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
    );
  }
}
