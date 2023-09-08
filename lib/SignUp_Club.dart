import 'package:app_stage1/SignUp2.dart';
import 'package:app_stage1/SignUp2Club.dart';
import 'package:app_stage1/SignUp2Recruteur.dart';
import 'package:app_stage1/Sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextEditingController _emailController = new TextEditingController();
TextEditingController _nameController = new TextEditingController();
TextEditingController _ActivityController = new TextEditingController();
TextEditingController _UniversityController = new TextEditingController();
TextEditingController _PhoneController = new TextEditingController();

bool _isPasswordVisible = false;
bool _isConfirmVisible = false;
String selectedOption = "";
final _form6Key = GlobalKey<FormState>();

class SignupClub extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupClub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _form6Key,
          child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(
                top: 10,
                left: 28,
                right: 28,
              ),
                child: Column(
                children: [
                  Image.asset("assets/subscribe.png",
                  height: 250,
                  width:500,),
                  TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                      prefixIcon: Icon(Icons.business),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
          
                      ),
                      labelText: 'Nom du club',
                      
                    ),
                    validator: (String? value) {
                      print('value $value');
                      return value!.isEmpty
                          ? 'Veuillez entrer le nom du club'
                          : !RegExp(r'^[a-z A-Z]+$').hasMatch(value)
                              ? 'Veuillez entrer le nom du club'
                              : null;
                    },
                  ),
                  SizedBox(
                    height:20,
                  ),

                      TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
          
                      ),
                      labelText: 'Adresse mail',
                    ),
                   validator: (value) {
                      
                      print('value $value');
                      return value!.isEmpty
                          ? 'Veuillez entrer votre numéro de téléphone'
                          : !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)
                              ? 'Veuillez entrer votre adresse mail'
                              : null;
                    },
                    
                  ),
                  SizedBox(
                    height:20,
                  ),

                  TextFormField(
                      controller: _ActivityController,
                      decoration: InputDecoration(
                      prefixIcon: Icon(Icons.description),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
          
                      ),
                      labelText: 'Activité du club',
                      
                    ),
                    validator: (String? value) {
                      print('value $value');
                      return value!.isEmpty
                          ? 'Veuillez entrer  l''activité du club'
                          : !RegExp(r'^[a-z A-Z]+$').hasMatch(value)
                              ? 'Veuillez entrer l''activité du club'
                              : null;
                    },
                  ),
                  SizedBox(
                    height:20,
                  ),
                  
                TextFormField(
                      controller: _UniversityController,
                      decoration: InputDecoration(
                      prefixIcon: Icon(Icons.school),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
          
                      ),
                      labelText: 'Université',
                      
                    ),
                    validator: (String? value) {
                      print('value $value');
                      return value!.isEmpty
                          ? 'Veuillez entrer  l''université'
                          : !RegExp(r'^[a-z A-Z]+$').hasMatch(value)
                              ? 'Veuillez entrer l''université'
                              : null;
                    },
                  ),
              
                 SizedBox(
                    height:30,
                  ),
               
                  Row(
                    children: [
                      Expanded(
                        child: CupertinoButton(
                          child: Text('Suivant'),
                          onPressed: () async {
                        
                            if (_form6Key.currentState!.validate()) {
                              Navigator.push(
                        context,
                       MaterialPageRoute(builder: (context) => SignupScreenClub2()),
            );
          
                            }
                          },
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Déja membre?'),
                      TextButton(
                          onPressed: () async{
                           
                                      
                          },
                          
              child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          child: Text(
            'Connexion',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    

                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
