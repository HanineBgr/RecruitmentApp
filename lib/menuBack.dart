import 'package:flutter/material.dart';
import 'package:app_stage1/event.dart';
import 'package:app_stage1/news.dart';
import 'package:app_stage1/offres.dart';
import 'package:app_stage1/cowork.dart';

void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  List<Widget> _pages = [
    NewsScreen(),
    EventScreen(),
    JobOfferScreen(),
    CoworkingScreen(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
    
      drawer: Drawer(
        
        child: ListView(
          
          children: [
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.newspaper),
              title: Text('Actualité'),
              onTap: () {
                _selectPage(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('Events'),
              onTap: () {
                _selectPage(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Offres'),
              onTap: () {
                _selectPage(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.place),
              title: Text('Coworking'),
              onTap: () {
                _selectPage(3);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  void _selectPage(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    });
  }
}
