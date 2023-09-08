import 'package:app_stage1/cowork.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_stage1/bookingCowork.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _intitule = '';
  DateTime _selectedDate = DateTime.now();
  int _numberOfPeople = 1;
  

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Réservation effectuée'),
            content: Text('La réservation est effectuée'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); 
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
         
       SingleChildScrollView(
        child: Padding(

          padding: const EdgeInsets.all(16.0),
          
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset("assets/space.png",
                  height: 250,
                  width:500,),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.subject),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "Intitulé",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez entrer l'intitulé";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _intitule = value!;
                  },
                ),
                SizedBox(height: 16),
           TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.people),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Nombre de personnes",
                      ),
                      keyboardType: TextInputType.number, // Use number keyboard
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ], // Only allow digits
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Veuillez entrer le nombre de personnes";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _numberOfPeople = int.parse(value!);
                      },
                    ),
                SizedBox(height: 15),
                TextFormField(
  keyboardType: TextInputType.emailAddress,
  decoration: InputDecoration(
    prefixIcon: Icon(Icons.email),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    labelText: "Adresse mail",
  ),
  validator: (value) {
    return value!.isEmpty
      ? "Veuillez entrer votre adresse mail"
      : !RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)
      ? "Veuillez entrer une adresse mail valide"
      : null;
  },
),

                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "Numéro de téléphone",
                  ),
                  validator: (value) {
                    return value!.isEmpty
                        ? "Veuillez entrer votre numéro de téléphone"
                        : !RegExp(r'^(9|2|5|4)\d{7}$').hasMatch(value)
                        ? "Veuillez entrer un numéro de téléphone valide"
                        : null;
                  },
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Date",
                        suffixIcon: Icon(Icons.calendar_today),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      controller: TextEditingController(
                        text: "${_selectedDate.toLocal()}".split(' ')[0],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Set the background color of the button
                    onPrimary: Colors.white, // Set the text color of the button
                    elevation: 3, // Set the elevation (shadow) of the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Set button border radius
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      "Réserver",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                   ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
       });
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: BookingScreen(),
  ));
}
