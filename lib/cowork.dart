import 'package:app_stage1/codetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CoworkingScreen extends StatefulWidget {
  @override
  _CoworkingScreenState createState() => _CoworkingScreenState();
}

class _CoworkingScreenState extends State<CoworkingScreen> {
  final List<Map<String, dynamic>> eventData = [
    {
      'profilePic': 'assets/logo1.png',
      'eventName': 'CoWork',
      'eventImage': 'assets/cowork.jpg',
      'eventDescription':
          'Un espace de travail qui offre des équipements tels que des bureaux, des chaises ergonomiques, une connexion Internet haut débit, des salles de réunion et des espaces communs.  ',
      'averageRating': 4.5,
      'eventLocation': 'Lac1,Tunis',
      'price': '900 DT',
    },
    {
      'profilePic': 'assets/co2.png',
      'eventName': 'The Box',
      'eventImage': 'assets/cowork1.png',
      'eventDescription':
          'Un espace de travail qui offre des équipements tels que des bureaux, des chaises ergonomiques, une connexion Internet haut débit, des salles de réunion et des espaces communs.  ',
      'averageRating': 3.0,
      'eventLocation': 'Ariana',
      'price': '1000 DT',
    },
  ];

  String _selectedLocation = 'Tous'; // Initially show all locations
  double _selectedPrice = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    Container(
      color: Colors.white, // Customize the filter section color
      padding: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0), // Add top padding here
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Location:',
                    style: TextStyle(color: Colors.amber, fontSize: 16),
                  ),
                  SizedBox(width: 15),
                  DropdownButton<String>(
                    value: _selectedLocation,
                    items: <String>['Tous', 'Lac1,Tunis', 'Ariana'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedLocation = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Prix:',
                    style: TextStyle(color: Colors.amber, fontSize: 16),
                  ),
                  SizedBox(width: 15),
                  Container(
                    width: 140, 
                    child: Slider(
                      value: _selectedPrice,
                      min: 0,
                      max: 2000,
                      divisions: 40,
                      label: 'Price: $_selectedPrice DT',
                      onChanged: (double value) {
                        setState(() {
                          _selectedPrice = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
          Expanded(
            child: ListView.builder(
              itemCount: eventData.length,
              itemBuilder: (context, index) {
                final event = eventData[index];
                if (_selectedLocation == 'Tous' || _selectedLocation == event['eventLocation']) {
                  final double price = double.parse(event['price'].replaceAll(' DT', ''));
                  if (price <= _selectedPrice) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: EventCard(
                        profilePic: event['profilePic'],
                        eventName: event['eventName'],
                        eventImage: event['eventImage'],
                        averageRating: event['averageRating'],
                        eventDescription: event['eventDescription'],
                        eventLocation: event['eventLocation'],
                        price: event['price'],
                      ),
                    );
                  }
                }
                return SizedBox(); // Return an empty container if the event is not included in the filter
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String profilePic;
  final String eventName;
  final String eventImage;
  final String eventDescription;
  final String eventLocation;
  final double averageRating;
  final String price;

  EventCard({
    required this.profilePic,
    required this.eventName,
    required this.eventImage,
    required this.eventDescription,
    required this.eventLocation,
    required this.averageRating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CoworkDetailsScreen(
                profilePic: profilePic,
                eventName: eventName,
                eventImage: eventImage,
                eventDescription: eventDescription,
                eventLocation: eventLocation,
                averageRating: averageRating,
                price: price,
              ),
            ),
          );
        },
        child: Card(
          elevation: 3.0,
          margin: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 15,),
                    Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(profilePic),
                        radius: 25,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      eventName,
                      style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Image.asset(
                eventImage,
                fit: BoxFit.cover,
                height: 200,
              ),
              SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20.0,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  eventDescription,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Localisation: $eventLocation',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
