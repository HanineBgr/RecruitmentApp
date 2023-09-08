import 'package:app_stage1/bookingCowork.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CoworkDetailsScreen extends StatelessWidget {
  final String profilePic;
  final String eventName;
  final String eventImage;
  final String eventDescription;
  final String eventLocation;
  final double averageRating;
  final String price;

  CoworkDetailsScreen({
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(profilePic),
                    radius: 25,
                  ),
                  SizedBox(width: 10),
                  Text(
                    eventName,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 16),
                  Image.asset(
                    eventImage,
                    fit: BoxFit.cover,
                    height: 200,
                    width: 300,
                  ),
                  SizedBox(width: 16),
                  // Add more images here
                   Image.asset(
                    eventImage,
                    fit: BoxFit.cover,
                    height: 200,
                    width: 300, // Adjust width as needed
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_right),
                    onPressed: () {
                      // Handle right arrow button press
                    },
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: RatingBar.builder(
                initialRating: averageRating,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 30.0,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'CustomFont',
                    color: const Color.fromARGB(255, 79, 79, 79),
                    letterSpacing: 0.5,
                    height: 1.5,
                    shadows: [
                      Shadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(1, 2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  children: [
                    TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      text: eventDescription,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Localisation: $eventLocation',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 20),
              child: Row(
                children: [
                  Icon(
                    Icons.monetization_on,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Prix: $price',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                  Navigator.push(
                        context,
                       MaterialPageRoute(builder: (context) => BookingScreen ()
              ));                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    onPrimary: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Réserver cet espace',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  
}
