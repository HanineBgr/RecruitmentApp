import 'package:flutter/material.dart';

void main() => runApp(NewsApp());

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewsScreen(),
    );
  }
}

class News {
  final String title;
  final String description;
  final String location;
  final String imagePath;
  bool isFollowed;

  News(this.title, this.description, this.location, this.imagePath, this.isFollowed);
}

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final List<News> newsList = [
    News(
      'Sagemcom',
      'Software & Technologies',
      'Kram',
      'assets/sagem.png',
      false,
    ),
    News(
      'Wevioo',
      'Consulting-Digital',
      'El Ghazela, Ariana',
      'assets/wevio.png',
      false,
    ),
    News(
      'Actia',
      'Engineering services',
      'El Ghazela',
      'assets/actia.png',
      false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (BuildContext context, int index) {
          final news = newsList[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.asset(
                    news.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${news.description} - ${news.location}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            news.isFollowed = !news.isFollowed;
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(news.isFollowed ? 'Followed' : 'Follow'),
                            SizedBox(width: 4),
                            if (news.isFollowed) Icon(Icons.check),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
