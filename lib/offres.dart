import 'package:flutter/material.dart';

class JobOffer {
  final String title;
  final String description;
  final String imageUrl;
  final String location;
  final String salary;
  final String profileDescription;
  bool isInternship;
  bool isJob;
  bool isSummerInternship;
  bool isEndOfStudiesInternship;
  bool isCDDJob;
  bool isCDIJob;

  JobOffer(
    this.title,
    this.description,
    this.imageUrl,
    this.location,
    this.isInternship,
    this.isJob,
    this.isSummerInternship,
    this.isEndOfStudiesInternship,
    this.isCDDJob,
    this.isCDIJob,
    this.salary,
    this.profileDescription,
  );
}

class JobOfferScreen extends StatefulWidget {
  @override
  _JobOfferScreenState createState() => _JobOfferScreenState();
}

class _JobOfferScreenState extends State<JobOfferScreen> {
  String selectedLocation = 'Tous';
  bool showCDDJobs = false;
  bool showCDIJobs = false;
  bool showSummerInternships = false;
  bool showEndOfStudiesInternships = false;
  bool showJobs = true;
  bool showInternships = true;

  List<JobOffer> jobOffers = [
    JobOffer(
      "Software Engineer",
      "We are looking for a skilled software engineer to join our team.",
      "assets/actia.png",
      "Ariana",
      false,
      true,
      false,
      false,
      true,
      false,
      '1500 DT',
      'Nous recherchons un ingénieur logiciel passionné et créatif pour rejoindre notre équipe dynamique...',
    ),
JobOffer( //emploi_CDI
      "Data Scientist",
      "We are looking for a skilled data scientist to join our team.",
      "assets/sagem.png",
      "Kram",
      false,
      true,
      false,
      false,
      false,
      true,
      '1500 DT',
       'Nous recherchons un ingénieur logiciel passionné et créatif pour rejoindre notre équipe dynamique. Le candidat idéal possède une solide expérience'
      ' en conception, développement et déploiement de logiciels de haute qualité.'
      

    ),
    JobOffer( //stage_ete
      "Software Engineer Internship",
      "We are looking for a skilled software engineer intern to join our team.",
      "assets/wevio.png",
      "Ariana",
      true,
      false,
      true,
      false,
      false,
      false,
     '1500 DT',
     'Nous recherchons un ingénieur logiciel passionné et créatif pour rejoindre notre équipe dynamique. Le candidat idéal possède une solide expérience'
      ' en conception, développement et déploiement de logiciels de haute qualité.'
      

    ),
    JobOffer(
      "UI UX Designer Internship",
      "We are looking for a skilled UI UX designer intern to join our team.",
      "assets/3D.jpg",
      "Sousse",
      true,
      false,
      false,
      true,
      false,
      false,
       '1500 DT',
        'Nous recherchons un ingénieur logiciel passionné et créatif pour rejoindre notre équipe dynamique. Le candidat idéal possède une solide expérience'
      ' en conception, développement et déploiement de logiciels de haute qualité.'
      

    ),
      ];

  List<JobOffer> filteredOffers = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredOffers = List.from(jobOffers);
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
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: 'Search for a job offer',
                              prefixIcon: IconButton(
                                icon: Icon(Icons.search),
                                onPressed: () {
                                  _searchJobOffers(searchController.text);
                                },
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.filter_list),
                                onPressed: () async {
                                  final filters = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FilterScreen(
                                        selectedLocation: selectedLocation,
                                        showCDDJobs: showCDDJobs,
                                        showCDIJobs: showCDIJobs,
                                        showSummerInternships: showSummerInternships,
                                        showEndOfStudiesInternships: showEndOfStudiesInternships, 
                                        showInternships: showInternships,
                                        showJobs: showJobs,
                                      ),
                                    ),
                                  );

                                  if (filters != null) {
                                    setState(() {
                                      selectedLocation = filters['location'];
                                      showCDDJobs = filters['showCDDJobs'];
                                      showCDIJobs = filters['showCDIJobs'];
                                      showSummerInternships = filters['showSummerInternships'];
                                      showEndOfStudiesInternships = filters['showEndOfStudiesInternships'];
                                      showJobs = filters['showJobs'];
                                      showInternships = filters['showInternships'];
                                      _applyFilters();
                                    });
                                  }
                                },
                              ),
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
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: filteredOffers.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JobOfferDetailsScreen(
                          jobOffer: filteredOffers[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
                            child: Image.asset(
                              filteredOffers[index].imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 24),
                                Text(
                                  filteredOffers[index].title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  filteredOffers[index].description,
                                  style: TextStyle(fontSize: 16.0),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _applyFilters() {
    setState(() {
      filteredOffers = jobOffers.where((offer) {
        bool locationCondition = selectedLocation == 'Tous' || offer.location == selectedLocation;
        bool jobTypeCondition = showJobs && offer.isJob;
        bool internshipTypeCondition = showInternships && offer.isInternship;

        return locationCondition &&
            ((offer.isJob && jobTypeCondition) || (offer.isInternship && internshipTypeCondition));
      }).toList();

      filteredOffers = filteredOffers.where((offer) {
        bool contractCondition =
            (showCDDJobs && offer.isCDDJob) || (showCDIJobs && offer.isCDIJob);
        bool internshipCondition =
            (showSummerInternships && offer.isSummerInternship) ||
            (showEndOfStudiesInternships && offer.isEndOfStudiesInternship);

        return (offer.isJob && contractCondition) || (offer.isInternship && internshipCondition);
      }).toList();
    });
  }

  void _searchJobOffers(String searchTerm) {
    setState(() {
      if (searchTerm.isEmpty) {
        filteredOffers = List.from(jobOffers);
      } else {
        filteredOffers = jobOffers.where((offer) =>
            offer.title.toLowerCase().contains(searchTerm.toLowerCase()) ||
            offer.description.toLowerCase().contains(searchTerm.toLowerCase())).toList();
      }
    });
  }
}

class FilterScreen extends StatefulWidget {
  final String selectedLocation;
  final bool showCDDJobs;
  final bool showCDIJobs;
  final bool showSummerInternships;
  final bool showEndOfStudiesInternships;
  final bool showJobs;
  final bool showInternships;

  FilterScreen({
    required this.selectedLocation,
    required this.showCDDJobs,
    required this.showCDIJobs,
    required this.showSummerInternships,
    required this.showEndOfStudiesInternships,
    required this.showJobs,
    required this.showInternships,
  });

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectedLocation = '';
  bool showCDDJobs = false;
  bool showCDIJobs = false;
  bool showSummerInternships = false;
  bool showEndOfStudiesInternships = false;
  bool showJobs = true;
  bool showInternships = true;

  @override
  void initState() {
    super.initState();
    selectedLocation = widget.selectedLocation;
    showCDDJobs = widget.showCDDJobs;
    showCDIJobs = widget.showCDIJobs;
    showSummerInternships = widget.showSummerInternships;
    showEndOfStudiesInternships = widget.showEndOfStudiesInternships;
    showJobs = widget.showJobs;
    showInternships = widget.showInternships;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: selectedLocation,
              onChanged: (newValue) {
                setState(() {
                  selectedLocation = newValue!;
                  _applyFilters();
                });
              },
              items: ['Tous', 'Ariana', 'Kram', 'Sousse']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            _buildFilterSection(
              title: 'Emploi / Stage',
              selectedValue: '',
              filterOptions: ['Jobs', 'Internships'],
              onFilterSelected: (value) {
                setState(() {
                  if (value == 'Jobs') {
                    showJobs = !showJobs;
                  } else if (value == 'Internships') {
                    showInternships = !showInternships;
                  }
                  _applyFilters();
                });
              },
            ),
            SizedBox(height: 16.0),
            _buildFilterSection(
              title: 'Type de contrat',
              selectedValue: '',
              filterOptions: ['CDD', 'CDI'],
              onFilterSelected: (value) {
                setState(() {
                  if (value == 'CDD') {
                    showCDDJobs = !showCDDJobs;
                  } else if (value == 'CDI') {
                    showCDIJobs = !showCDIJobs;
                  }
                  _applyFilters();
                });
              },
            ),
            SizedBox(height: 16.0),
            _buildFilterSection(
              title: 'Type de stage',
              selectedValue: '',
              filterOptions: ['Summer Internship', 'End of Studies Internship'],
              onFilterSelected: (value) {
                setState(() {
                  if (value == 'Summer Internship') {
                    showSummerInternships = !showSummerInternships;
                  } else if (value == 'End of Studies Internship') {
                    showEndOfStudiesInternships = !showEndOfStudiesInternships;
                  }
                  _applyFilters();
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'location': selectedLocation,
                  'showCDDJobs': showCDDJobs,
                  'showCDIJobs': showCDIJobs,
                  'showSummerInternships': showSummerInternships,
                  'showEndOfStudiesInternships': showEndOfStudiesInternships,
                  'showJobs': showJobs,
                  'showInternships': showInternships,
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
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
    );
  }

  Widget _buildFilterSection({
    required String title,
    required String selectedValue,
    required List<String> filterOptions,
    required ValueChanged<String> onFilterSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8.0,
          children: [
            for (var option in filterOptions)
              ChoiceChip(
                label: Text(option),
                selected: selectedValue == option,
                onSelected: (bool selected) {
                  onFilterSelected(option);
                },
                selectedColor: Colors.blue,
                labelStyle: TextStyle(
                  color: selectedValue == option ? Colors.white : Colors.black,
                ),
                backgroundColor:
                    selectedValue == option ? Colors.blue : Colors.grey[200],
                elevation: selectedValue == option ? 2.0 : 0.0,
                shadowColor: Colors.grey[60],
                padding: EdgeInsets.symmetric(horizontal: 12.0),
              ),
          ],
        ),
      ],
    );
  }

  void _applyFilters() {
    Navigator.pop(context, {
      'location': selectedLocation,
      'showCDDJobs': showCDDJobs,
      'showCDIJobs': showCDIJobs,
      'showSummerInternships': showSummerInternships,
      'showEndOfStudiesInternships': showEndOfStudiesInternships,
      'showJobs': showJobs,
      'showInternships': showInternships,
    });
  }
}

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
    Divider(color: Colors.grey[400], thickness: 1),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                jobOffer.profileDescription,
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    'Localisation: ${jobOffer.location}',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.monetization_on, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    'Salaire: ${jobOffer.salary}',
                    style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
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
 


void main() {
  runApp(MaterialApp(
    home: JobOfferScreen(),
  ));
}
