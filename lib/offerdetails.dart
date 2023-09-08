import 'package:flutter/material.dart';
import 'offres.dart';

class JobOfferDetailsScreen extends StatelessWidget {
  final JobOffer jobOffer;
  JobOfferDetailsScreen({required this.jobOffer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(jobOffer.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  jobOffer.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                jobOffer.description,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16.0),
            Divider(color: Colors.grey[400], thickness: 1),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Profile Description:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Solide expérience en développement de logiciels dans un ou plusieurs langages de programmation tels que Java, C++, Python, C# ou JavaScript.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 20),
            Divider(color: Colors.grey[400], thickness: 1),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Salaire:',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '1500 DT', 
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 10),
                   Text(
                    'Localisation:',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    jobOffer.location,
                    style: TextStyle(fontSize: 16.0,),
                  ),
                 
                  SizedBox(height: 10),
                  Text(
                    'Nature du travail:',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    jobOffer.isJob ? 'Emploi temps plein' : 'Stage', // Display "Job" or "Internship" based on the offer type
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  _showApplicationDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'Apply',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showApplicationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Application Submitted'),
          content: Text('Your application for ${jobOffer.title} has been submitted.'),
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
