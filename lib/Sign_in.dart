import 'package:app_stage1/SignUp.dart';
import 'package:app_stage1/SignUpProp.dart';
import 'package:app_stage1/SignUp_Club.dart';
import 'package:app_stage1/SignUp_recruteur.dart';
import 'package:app_stage1/menu.dart';
import 'package:app_stage1/menuBack.dart';
import 'package:app_stage1/resetPassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 45,
              left: 28,
              right: 28,
            ),
            child: Column(
              children: [
                Image.asset(
                  "assets/login.png",
                  height: 250,
                  width: 400,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.only(
                  top: 270,
                  left: 28,
                  right: 28,
                ),
                height: double.maxFinite,
                width: double.maxFinite,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Adresse mail',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez saisir votre adresse e-mail';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        obscureText: !_isPasswordVisible,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Mot de passe',
                          suffixIcon: IconButton(
                            icon: Icon(_isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Veuillez saisir votre mot de passe';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => resetpassword(),
                            ),
                          );
                        },
                        child: const Text('Mot de passe oublié?'),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CupertinoButton(
                              child: Text('Connexion'),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Connecter en tant que .. '),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              GestureDetector(
                                                onTap: () {
                                                 Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => MyApp1()),
                                                 );
                                                },
                                                child: Text('Admin'),
                                              ),
                                              SizedBox(height: 10),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => MyApp()),
                                                 );
                                                },
                                                child: Text('User'),
                                              ),
                                              SizedBox(height: 10),
                                              
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Vous n'avez pas de compte?"),
                          TextButton(
                            child: Text('Créer un compte'),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Connecter en tant que .. '),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          GestureDetector(
                                            onTap: () {
                                              navigateToAnotherPage(context);
                                              print('Option 1 selected');
                                            },
                                            child: Text('Candidat'),
                                          ),
                                          SizedBox(height: 10),
                                          GestureDetector(
                                            onTap: () {
                                              navigateToSignUpScreen(context);
                                            },
                                            child: Text('Recruteur'),
                                          ),
                                          SizedBox(height: 10),
                                          GestureDetector(
                                            onTap: () {
                                              NavigateToClubPage();
                                            },
                                            child: Text('Club'),
                                          ),
                                          SizedBox(height: 10),
                                          GestureDetector(
                                            onTap: () {
                                              NavigateToPropPage();
                                            },
                                            child: Text('Propriétaire'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToAnotherPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupScreen()),
    );
  }

  void navigateToSignUpScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupRecruteur()),
    );
  }

  void NavigateToClubPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupClub()),
    );
  }

  void NavigateToPropPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupScreenProp1()),
    );
  }
}
