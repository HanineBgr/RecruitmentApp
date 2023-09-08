import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeProfileScreen(),
    );
  }
}

class ChangeProfileScreen extends StatefulWidget {
  @override
  _ChangeProfileScreenState createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  late File _profileImage;
  late File _cvFile; // Added CV file
  late File _recommendationFile; // Added recommendation letter file

  @override
  void initState() {
    super.initState();
    _profileImage = File('assets/dd.jpg'); // Replace with your default image file path
    _cvFile = File(''); // Initialize empty CV file
    _recommendationFile = File(''); // Initialize empty recommendation letter file
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().getImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
  }

  Future<void> _pickCV() async {
    final pickedCV = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedCV != null) {
      setState(() {
        _cvFile = File(pickedCV.path);
      });
    }
  }

  Future<void> _pickRecommendationLetter() async {
    final pickedRecommendationLetter = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedRecommendationLetter != null) {
      setState(() {
        _recommendationFile = File(pickedRecommendationLetter.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Info'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: _profileImage != null ? FileImage(_profileImage) : null,
                    child: _profileImage == null ? Icon(Icons.person, size: 80, color: Colors.grey) : null,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.edit, color: Colors.white),
                      onPressed: () {
                        _pickImage(ImageSource.gallery);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Hanine Bouguerra',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Flutter Developer',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
              SizedBox(height: 16.0),
              Text(
                'Passionate Flutter developer with a love for creating beautiful and functional apps.',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.mail, color: Colors.blue),
                  SizedBox(width: 8.0),
                  Text(
                    'bouguerra.hanine@esprit.tn',
                    style: TextStyle(fontSize: 16.0, color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone, color: Colors.blue),
                  SizedBox(width: 8.0),
                  Text(
                    '+216 93150160',
                    style: TextStyle(fontSize: 16.0, color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.link, color: Colors.blue),
                  SizedBox(width: 8.0),
                  Text(
                    'https://www.RecruteApp.com',
                    style: TextStyle(fontSize: 16.0, color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 20), // Add spacing before the button
              ElevatedButton(
                onPressed: () {
                  _pickCV(); // Open gallery to pick CV
                },
                child: Text('Upload CV', style: TextStyle(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 10), // Add spacing
              Text('CV: ${_cvFile.path}'),
              SizedBox(height: 10), // Add spacing
              ElevatedButton(
                onPressed: () {
                  _pickRecommendationLetter(); // Open gallery to pick recommendation letter
                },
                child: Text('Upload Recommendation Letter', style: TextStyle(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 10), // Add spacing
              Text('Recommendation Letter: ${_recommendationFile.path}'),
            ],
          ),
        ),
      ),
    );
  }
}
