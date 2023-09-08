import 'dart:ffi';
import 'package:app_stage1/Sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:path/path.dart';

class resetpassword extends StatefulWidget {
const resetpassword({ Key? key }) : super(key: key);

  @override
  State<resetpassword> createState() => _resetpasswordState();
}
TextEditingController _email = new TextEditingController();
final _form23Key = GlobalKey<FormState>();

@override
void dispose(){
  _email.dispose();
}

class _resetpasswordState extends State<resetpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

appBar: AppBar(
  title: Text("Vérifier votre Email"),
  
  
),
body: SingleChildScrollView(
  child:   Container(
   padding: EdgeInsets.only(
                top: 45,
                left: 28,
                right: 28,
              ),
     child: Column(
                key: _form23Key,

                children: [
                  Image.asset("assets/reset.png",
                  height: 250,
                  width:500,),
  
    SizedBox(height: 40),
  
    Text("Veuillez entrer votre adresse mail ",
  
    textAlign: TextAlign.center, 
  
    style: TextStyle(fontSize: 15)),
  
    SizedBox(height:26),
  
    Padding(
  
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
  
  child: TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
          
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
              onChanged: (value) {
                setState(() {
                 
                });
              },),
                    
                    ),
                    SizedBox(
                    height: 20,
                  ),
                  CupertinoButton(
                   onPressed: (){
                          if (_form23Key.currentState!.validate()) {
                 Navigator.push(
                        context,
                       MaterialPageRoute(builder: (context) => LoginPage ()),
                 
                 );
                        }},
  
                  child:Text("Réinitialiser le mot de passe"),
                  color: Colors.blue,
                   ),]),
                   ),
                   ));
  }
  }