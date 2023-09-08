import 'dart:io';

import 'package:app_stage1/Sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

TextEditingController _emailController = new TextEditingController();
TextEditingController _adressController = new TextEditingController();
TextEditingController _nameController = new TextEditingController();
TextEditingController _SizeController = new TextEditingController();
TextEditingController _passwordController = new TextEditingController();
TextEditingController _confirmpasswordController = new TextEditingController();

bool _isPasswordVisible = false;
bool _isConfirmVisible = false;
List<String> cities = ['Mahdia', 'Sousse', 'Tunis', 'Kasserine', 'Gafsa'];
File? _image;
String address = ""; 

final _form11Key = GlobalKey<FormState>();

String selectedOption = "";
class SignupScreenRecruteur2 extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
  
}
Future<void> _pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    String? filePath = result.files.single.path;
  }
}

class _SignupScreenState extends State<SignupScreenRecruteur2> {
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
                top: 45,
                left: 28,
                right: 28,
              ),
              
               child: Column(
                children: [
                  
                 DropdownButtonFormField<String>(
                 decoration: InputDecoration(
                 prefixIcon: Icon(Icons.location_city),
                  ),
                 hint: Text('Ville'),
                 items: <String>['Mahdia', 'Tunis', 'Sousse', 'Gafsa','Sidi Bouzid'].map((String value) {
                return DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
                );
               }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez sélectionner une ville';
                }
                return null;
              },
            ),
              
                 SizedBox(
                    height:20,
                  ),
                   TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _adressController,
                      decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_pin),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
          
                      ),
                      labelText: 'Adresse',
                      
                    ),
                     validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an address';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  address = value;
                });
              },),
                  SizedBox(
                    height:20,
                  ),
                TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
          
                      ),
                      labelText: 'Nom et prénom de répresentant',
                      
                    ),
                    validator: (String? value) {
                      print('value $value');
                      return value!.isEmpty
                          ? 'Veuillez entrer le nom et le pr"nom du répresentant'
                          : !RegExp(r'^[a-z A-Z]+$').hasMatch(value)
                              ? 'Veuillez entrer votre nom et prénom'
                              : null;
                    },
                  ),
                  SizedBox(
                    height:20,
                  ),
                  TextFormField(
                      controller: _SizeController,
                      decoration: InputDecoration(
                      prefixIcon: Icon(Icons.people),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
          
                      ),
                      labelText: 'Taille de l''entreprise',
                    ),
                   validator: (value) {
                      
                      print('value $value');
                      return value!.isEmpty
                          ? 'Veuillez entrer la taille de l''entreprise'
                          : !RegExp(r'^[0-9]+$').hasMatch(value)
                              ? 'Veuillez entrer votre la taille de l''entreprise'
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
                    height: 15,
                  ),
                ElevatedButton(
                onPressed: _pickFile,
                child: Text('Logo'),
                ),
                 SizedBox(
                    height:10,
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


