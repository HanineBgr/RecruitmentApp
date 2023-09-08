import 'dart:io';

import 'package:app_stage1/Sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

TextEditingController _nameController = new TextEditingController();
TextEditingController _PhoneController = new TextEditingController();
TextEditingController _passwordController = new TextEditingController();
TextEditingController _confirmpasswordController = new TextEditingController();

bool _isPasswordVisible = false;
bool _isConfirmVisible = false;
List<String> cities = ['Mahdia', 'Sousse', 'Tunis', 'Kasserine', 'Gafsa'];
File? _image;
String address = ""; 

final _form11Key = GlobalKey<FormState>();

String selectedOption = "";
class SignupScreenClub2 extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
  
}
Future<void> _pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    String? filePath = result.files.single.path;
  }
}

class _SignupScreenState extends State<SignupScreenClub2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        
        child: Form(
          key: _form11Key,
          child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(
                top: 1,
                left: 28,
                right: 28,
              ),
                child: Column(
                children: [
                  Image.asset("assets/subscribe.png",
                  height: 250,
                  width:500,),
                   TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _PhoneController,
                      decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
          
                      ),
                      labelText: 'Numéro de téléphone',
                    ),
                   validator: (value) {
                      
                      print('value $value');
                      return value!.isEmpty
                          ? 'Veuillez entrer votre numéro de téléphone'
                          : !RegExp(r'^(9|2|5|4)\d{7}$').hasMatch(value)
                              ? 'Veuillez entrer votre numéro de téléphone'
                              : null;
                    },
                    
                  ),
                  SizedBox(
                    height: 20,
                  ),
                   TextFormField(
                    obscureText: !_isPasswordVisible,
                    controller: _passwordController,
                    validator: (value) {
                     if(value!.isEmpty)
                              return 'Veuillez entrer votre mot de passe';
                              return null;
                              },
                        decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
          
                        ),
                        
                        labelText: 'Mot de passe',
                        suffixIcon: IconButton(
                    icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                       _isPasswordVisible = !_isPasswordVisible;
                      });
                    })),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: !_isPasswordVisible,
                    controller: _confirmpasswordController,
                    validator: (value) {
                      if(value!.isEmpty)
                                   return 'Veuillez confirmer votre mot de passe';
                              if(value != _passwordController.text)
                                   return 'Les mots de passe ne corresspondent pas' ;
                              return null;
                              
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        labelText: 'Confirmer votre mot de passe',
                        suffixIcon: IconButton(
                    icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                       _isPasswordVisible = !_isPasswordVisible;
                      });
                    })),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ElevatedButton(
                onPressed: _pickFile,
                child: Text('Logo'),
                ),
                 SizedBox(
                    height:20,
                  ),
                  
                  Row(
                    children: [
                      Expanded(
                        child: CupertinoButton(
                          child: Text(' Connexion'),
                          onPressed: () async {
                              if (_form11Key.currentState!.validate()) {
                 Navigator.push(
                        context,
                       MaterialPageRoute(builder: (context) => LoginPage()),
                 
                 );
                }
          
                  },
                          color: Colors.blue,
                        ),
                      ),
                        SizedBox(
                    height: 20,
                  ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


