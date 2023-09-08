import 'package:flutter/material.dart';

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
      home: EventScreen(),
    );
  }
}

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  String selectedLocation = 'All';
  String selectedClub = 'All';
  String selectedType = 'All';
  final List<Map<String, dynamic>> eventData1 = [
    {
      'profilePic': 'assets/logo.png',
      'eventName1': 'Jeunes Ingénieurs',
      'eventImage': 'assets/event.png',
      'eventDescription':
          'Cet évenement est consacré à la découverte des dernières évolutions, Cet événement prestigieux réunira des chercheurs, des experts en IA, des professionnels de l''industrie et des étudiants du monde entie',
      'eventLocation': 'ISAMM',
      'eventClub': 'Boubli',
      'eventType': 'Team building',
    },
    {
      'profilePic': 'assets/isimm.png',
      'eventName1': 'ISIMM',
      'eventImage': 'assets/event2.png',
      'eventDescription': 'Cet évenement est consacré à la découverte des dernières évolutions.',
      'eventLocation': 'ISIMM',
      'eventClub': 'Tunivision',
      'eventType': 'Formation',
    },
  ];

  List<Map<String, dynamic>> filteredEvents = [];

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredEvents = List.from(eventData1);
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: 'Search for an event',
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: () {
                                    _searchEvents(searchController.text);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.filter_list),
                                  onPressed: _openFilterScreen,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredEvents.length,
              itemBuilder: (context, index) {
                final event = filteredEvents[index];
                return EventCard(
                  profilePic: event['profilePic'],
                  eventName1: event['eventName1'],
                  eventImage: event['eventImage'],
                  eventDescription: event['eventDescription'],
                  eventLocation: event['eventLocation'],
                  eventClub: event['eventClub'],
                  eventType: event['eventType'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

void _openFilterScreen() async {
  final selectedFilters = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => FilterScreen(
        selectedLocation: selectedLocation,
        selectedClub: selectedClub,
        selectedType: selectedType,
      ),
    ),
  );

  if (selectedFilters != null) {
    setState(() {
      selectedLocation = selectedFilters['location'];
      selectedClub = selectedFilters['club'];
      selectedType = selectedFilters['type'];
      _applyFilters();

      // Check if no filters are applied, and only navigate if they are not
      if (selectedLocation == 'All' && selectedClub == 'All' && selectedType == 'All') {
        Navigator.pop(context); // Close the filter screen
      }
    });
  }
}

  void _applyFilters() {
    setState(() {
      filteredEvents = eventData1.where((event) {
        return (selectedLocation == 'All' || event['eventLocation'] == selectedLocation) &&
            (selectedClub == 'All' || event['eventClub'] == selectedClub) &&
            (selectedType == 'All' || event['eventType'] == selectedType);
      }).toList();
    });
  }

  void _searchEvents(String searchTerm) {
    setState(() {
      if (searchTerm.isEmpty) {
        filteredEvents = List.from(eventData1);
      } else {
        filteredEvents = eventData1.where((event) =>
            event['eventName1'].toLowerCase().contains(searchTerm.toLowerCase())).toList();
      }
    });
  }
}
class FilterScreen extends StatefulWidget {
  late String selectedLocation;
  late String selectedClub;
  late String selectedType;

  FilterScreen({
    required this.selectedLocation,
    required this.selectedClub,
    required this.selectedType,
  });

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool areFiltersApplied = false;
  

  @override
  void initState() {
    super.initState();
    if (widget.selectedLocation != 'All' ||
        widget.selectedClub != 'All' ||
        widget.selectedType != 'All') {
      areFiltersApplied = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 300,
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Column(
           mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                DropdownFilterSection(
                  title: 'Localisation',
                  selectedValue: widget.selectedLocation,
                  filterOptions: ['All', 'ISAMM', 'ISIMM'],
                  onFilterSelected: (value) {
                    setState(() {
                      widget.selectedLocation = value;
                      areFiltersApplied = true;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                DropdownFilterSection(
                  title: 'Club',
                  selectedValue: widget.selectedClub,
                  filterOptions: ['All', 'Tunivision', 'Boubli'],
                  onFilterSelected: (value) {
                    setState(() {
                      widget.selectedClub = value;
                      areFiltersApplied = true;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                DropdownFilterSection(
                  title: 'Type',
                  selectedValue: widget.selectedType,
                  filterOptions: ['All', 'Team building', 'Formation', 'Other types'],
                  onFilterSelected: (value) {
                    setState(() {
                      widget.selectedType = value;
                      areFiltersApplied = true;
                    });
                  },
                ),
                SizedBox(height: 16.0),
              ElevatedButton(
  onPressed: areFiltersApplied
      ? () {
          if (widget.selectedLocation != 'All' ||
              widget.selectedClub != 'All' ||
              widget.selectedType != 'All') {
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Please select at least one filter.'),
              ),
            );
          }
        }
      : () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Please select at least one filter.'),
            ),
          );
        },
  style: ElevatedButton.styleFrom(
    primary: areFiltersApplied ? Colors.blue : Colors.grey,
    onPrimary: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
  ),
  child: Text(
    'Apply Filters',
    style: TextStyle(fontSize: 18),
  ),
),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DropdownFilterSection extends StatelessWidget {
  final String title;
  final String selectedValue;
  final List<String> filterOptions;
  final ValueChanged<String> onFilterSelected;

  DropdownFilterSection({
    required this.title,
    required this.selectedValue,
    required this.filterOptions,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        DropdownButton<String>(
          value: selectedValue,
          onChanged: (value) {
            onFilterSelected(value!); // Update the selected value
          },
          items: filterOptions
              .map<DropdownMenuItem<String>>(
                (option) => DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  final String profilePic;
  final String eventName1;
  final String eventImage;
  final String eventDescription;
  final String eventLocation;
  final String eventClub;
  final String eventType;

  EventCard({
    required this.profilePic,
    required this.eventName1,
    required this.eventImage,
    required this.eventDescription,
    required this.eventLocation,
    required this.eventClub,
    required this.eventType,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailsScreen(
              event: {
                'profilePic': profilePic,
                'eventName1': eventName1,
                'eventImage': eventImage,
                'eventDescription': eventDescription,
                'eventLocation': eventLocation,
                'eventClub': eventClub,
                'eventType': eventType,
              },
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
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(profilePic),
                radius: 25,
              ),
              title: Text(eventName1, style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
              subtitle: Text('Localisation: $eventLocation'),
            ),
            Image.asset(
              eventImage,
              fit: BoxFit.cover,
              height: 200,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(eventDescription, 
              style: TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.justify,
              )
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Club: $eventClub | Type: $eventType', style: TextStyle(fontSize: 16.0)),
            ),
          ],
        ),
      ),
    );
  }
}

class EventDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> event;

  EventDetailsScreen({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event['eventName1']),
        backgroundColor: Colors.blue, // Set the app bar color
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width:500,
              child: Image.asset(
                event['eventImage'],
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                event['eventDescription'],
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 8.0),
                  Text(
                    'Localisation: ${event['eventLocation']}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _showApplicationDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Set the button color here
                  onPrimary: Colors.white, // Set the text color here
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // Set the button shape here
                  ),
                ),
                child: Text(
                  'Participate',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
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
          title: Text('Participation Submitted'),
          content: Text('Your participation has been submitted.'),
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


