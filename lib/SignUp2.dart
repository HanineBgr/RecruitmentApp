import 'dart:io';

import 'package:app_stage1/Sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

TextEditingController _emailController = new TextEditingController();
TextEditingController _adressController = new TextEditingController();

List<String> cities = ['Mahdia', 'Sousse', 'Tunis', 'Kasserine', 'Gafsa'];
File? _image;
String address = ""; 

final _form22Key = GlobalKey<FormState>();

String selectedOption = "";
class SignupScreen2 extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
  
}
Future<void> _pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    String? filePath = result.files.single.path;
  }
}

class _SignupScreenState extends State<SignupScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        
        child: Form(
          key: _form22Key,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: 45,
                left: 28,
                right: 28,
              ),
              
               child: Column(
                children: [
                  Image.asset("assets/subscribe.png",
                  height: 250,
                  width:500,),
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
                  return 'Veuillez entrer votre adresse';
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
                  
                ElevatedButton(
                onPressed: _pickFile,
                child: Text('Sélectionner une photo'),
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
                              if (_form22Key.currentState!.validate()) {
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


