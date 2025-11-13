import 'package:flutter/material.dart';
import 'FeaturedCause.dart';
import 'Fundraise.dart';
import 'Login.dart';
import 'Volunteer.dart';
import 'courses.dart';
import 'AboutUs.dart';
import 'package:share_plus/share_plus.dart';
import 'Homepage.dart';


void main() {
  runApp(FundraisePage());
}

class FundraisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Fundraising App', home: FundraisingScreen());
  }
}

class Cause {
  String title;
  String description;
  double totalBids;
  double totalDonations;

  Cause({
    required this.title,
    required this.description,
    this.totalBids = 0,
    this.totalDonations = 0,
  });
}

class FundraisingScreen extends StatefulWidget {
  @override
  _FundraisingScreenState createState() => _FundraisingScreenState();
}

class _FundraisingScreenState extends State<FundraisingScreen> {
  List<String> categories = [
    'Education',
    'Health',
    'Disaster',
    'Animal Welfare',
    'Rural',
    'Children',
    'Hunger',
    'Shelter',
    'Community',
    'Environment',
    'Refugees',
    'Medical',
    'Mental Health',
    'Youth',
    'Women',
    'Endangered Species',
    'Habitat',
    'Literacy',
    'Renewable Energy',
    'Arts and Culture',
    'Nutrition',
    'Facilities',
    'Water',
    'Elderly',
    'Disability',
    'Displacement',
    'Air Quality',
    'Small Business',
    'Mobile Camps',
    'Pollution',
  ];
  String selectedCategory = 'Education';

  List<Cause> causes = [
    Cause(
      title: 'Build a School',
      description: 'Help us build a school in rural areas.',
      totalBids: 500,
      totalDonations: 2000,
      // tags: ['Education', 'Rural', 'Children'],
    ),
    Cause(
      title: 'Medical Aid',
      description: 'Provide medical aid to those in need.',
      totalBids: 300,
      totalDonations: 1500,
      // tags: ['Health', 'Medical', 'Emergency'],
    ),
    Cause(
      title: 'Clean Water Initiative',
      description: 'Bring clean and safe drinking water to communities.',
      totalBids: 450,
      totalDonations: 1800,
      // tags: ['Health', 'Disaster', 'Water'],
    ),
    Cause(
      title: 'Educational Supplies',
      description: 'Provide books and supplies to underprivileged children.',
      totalBids: 320,
      totalDonations: 1200,
      // tags: ['Education', 'Children'],
    ),
    Cause(
      title: 'Food for All',
      description: 'Support food distribution programs in urban areas.',
      totalBids: 600,
      totalDonations: 2500,
      // tags: ['Health', 'Disaster', 'Hunger'],
    ),
    Cause(
      title: 'Shelter for Homeless',
      description: 'Help build shelters for homeless families.',
      totalBids: 400,
      totalDonations: 1700,
      // tags: ['Disaster', 'Shelter', 'Community'],
    ),
    Cause(
      title: 'Tree Plantation Drive',
      description: 'Plant trees to combat climate change.',
      totalBids: 350,
      totalDonations: 1400,
      // tags: ['Disaster', 'Environment'],
    ),
    Cause(
      title: 'Animal Welfare',
      description: 'Rescue and care for abandoned animals.',
      totalBids: 250,
      totalDonations: 900,
      // tags: ['Animal Welfare', 'Rescue'],
    ),
    Cause(
      title: 'Disaster Relief',
      description: 'Provide aid to disaster-hit regions.',
      totalBids: 700,
      totalDonations: 3000,
      // tags: ['Disaster', 'Emergency', 'Relief'],
    ),
    Cause(
      title: 'Senior Citizens Support',
      description: 'Support programs for the elderly.',
      totalBids: 200,
      totalDonations: 800,
      // tags: ['Health', 'Elderly'],
    ),
    Cause(
      title: 'Youth Empowerment',
      description: 'Mentorship and skill development for youth.',
      totalBids: 380,
      totalDonations: 1600,
      // tags: ['Education', 'Youth'],
    ),
    Cause(
      title: 'Mental Health Awareness',
      description: 'Promote mental health and well-being.',
      totalBids: 330,
      totalDonations: 1500,
      // tags: ['Health', 'Mental Health'],
    ),
    Cause(
      title: 'Refugee Assistance',
      description: 'Support for refugees and displaced persons.',
      totalBids: 410,
      totalDonations: 1800,
      // tags: ['Disaster', 'Refugees'],
    ),
    Cause(
      title: 'Cancer Research',
      description: 'Fund research to find a cure for cancer.',
      totalBids: 520,
      totalDonations: 2200,
      // tags: ['Health', 'Medical'],
    ),
    Cause(
      title: 'Child Education',
      description: 'Support for orphaned and vulnerable children.',
      totalBids: 290,
      totalDonations: 1300,
      // tags: ['Education', 'Children'],
    ),
    Cause(
      title: 'Women Empowerment',
      description: 'Programs to empower women economically.',
      totalBids: 370,
      totalDonations: 1600,
      // tags: ['Education', 'Health'],
    ),
    Cause(
      title: 'Healthcare Access',
      description: 'Improve healthcare facilities in rural areas.',
      totalBids: 480,
      totalDonations: 2000,
      // tags: ['Health', 'Rural'],
    ),
    Cause(
      title: 'Sports Development',
      description: 'Promote sports among youth.',
      totalBids: 150,
      totalDonations: 700,
      // tags: ['Education', 'Youth'],
    ),
    Cause(
      title: 'Environmental Conservation',
      description: 'Protect endangered species and habitats.',
      totalBids: 300,
      totalDonations: 1500,
      // tags: ['Disaster', 'Environment'],
    ),
    Cause(
      title: 'Literacy Campaign',
      description: 'Increase literacy rates in underserved areas.',
      totalBids: 270,
      totalDonations: 1100,
      // tags: ['Education'],
    ),
    Cause(
      title: 'Clean Energy',
      description: 'Support renewable energy projects.',
      totalBids: 400,
      totalDonations: 1800,
      // tags: ['Disaster', 'Environment'],
    ),
    Cause(
      title: 'Arts and Culture',
      description: 'Preserve local arts and cultural heritage.',
      totalBids: 220,
      totalDonations: 900,
      // tags: ['Education'],
    ),
    Cause(
      title: 'Child Nutrition',
      description: 'Provide nutritious meals to children.',
      totalBids: 340,
      totalDonations: 1400,
      // tags: ['Health', 'Children'],
    ),
    Cause(
      title: 'Refurbish Schools',
      description: 'Renovate and upgrade school facilities.',
      totalBids: 310,
      totalDonations: 1300,
      // tags: ['Education'],
    ),
    Cause(
      title: 'Water Sanitation',
      description: 'Improve sanitation facilities in villages.',
      totalBids: 260,
      totalDonations: 1000,
      // tags: ['Health', 'Disaster'],
    ),
    Cause(
      title: 'Elderly Care',
      description: 'Support for elderly health and well-being.',
      totalBids: 190,
      totalDonations: 800,
      // tags: ['Health'],
    ),
    Cause(
      title: 'Disability Assistance',
      description: 'Provide resources and support for disabled.',
      totalBids: 230,
      totalDonations: 950,
      // tags: ['Health'],
    ),
    Cause(
      title: 'Refugee Education',
      description: 'Educational programs for displaced children.',
      totalBids: 280,
      totalDonations: 1200,
      // tags: ['Education', 'Disaster'],
    ),
    Cause(
      title: 'Clean Air Initiative',
      description: 'Reduce pollution and improve air quality.',
      totalBids: 370,
      totalDonations: 1500,
      // tags: ['Disaster', 'Environment'],
    ),
    Cause(
      title: 'Microfinance for Entrepreneurs',
      description: 'Support small business owners.',
      totalBids: 330,
      totalDonations: 1400,
      // tags: ['Education'],
    ),
    Cause(
      title: 'Emergency Medical Camps',
      description: 'Mobile health camps in remote areas.',
      totalBids: 340,
      totalDonations: 1500,
      // tags: ['Health', 'Disaster'],
    ),
    Cause(
      title: 'Plastic Waste Management',
      description: 'Reduce plastic pollution efforts.',
      totalBids: 290,
      totalDonations: 1200,
      // tags: ['Disaster', 'Environment'],
    ),
  ];

  String searchQuery = '';

  double totalDonations = 0;

  // For bidding and donation input
  final TextEditingController bidController = TextEditingController();
  final TextEditingController donationController = TextEditingController();

  // Selected cause
  Cause? selectedCause;

  // Counter for join campaign
  int _campaignJoinCount = 0;

  @override
  void initState() {
    super.initState();
    calculateTotalDonations();
  }

  void calculateTotalDonations() {
    double total = 0;
    for (var cause in causes) {
      total += cause.totalDonations;
    }
    setState(() {
      totalDonations = total;
    });
  }

  List<Cause> getFilteredCauses() {
    return causes
        .where(
          (cause) =>
              cause.title.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();
  }

  double calculateTaxDeduction(double amount) {
    return amount * 2.5; // 250%
  }

  void shareCause(Cause cause) {
    Share.share('${cause.title}\n${cause.description}');
  }

  void placeBid(Cause cause) {
    double bidAmount = double.tryParse(bidController.text) ?? 0;
    if (bidAmount > 0) {
      setState(() {
        cause.totalBids += bidAmount;
      });
      bidController.clear();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Bid placed for ${cause.title}')));
    }
  }

  void donateToCause(Cause cause) {
    double donationAmount = double.tryParse(donationController.text) ?? 0;
    if (donationAmount > 0) {
      double taxDeduction = calculateTaxDeduction(donationAmount);
      setState(() {
        cause.totalDonations += donationAmount;
        calculateTotalDonations();
      });
      donationController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Donated \$${donationAmount.toStringAsFixed(2)}. Tax deduction: \$${taxDeduction.toStringAsFixed(2)}',
          ),
        ),
      );
    }
  }

  void joinCampaign() {
    setState(() {
      _campaignJoinCount += 1;
    });
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(''), // Empty space or you can add a title here
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          content: Text('Thank you for joining! Count: $_campaignJoinCount'),
          // Optional: You can add actions if needed for close (since have X)
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Cause> displayedCauses = getFilteredCauses();

    return Scaffold(
      drawer: _buildDrawer(),
      appBar: AppBar(title: Text('Fundraising Platform')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            // Categories
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  String category = categories[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: selectedCategory == category,
                      onSelected: (_) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            // Search
            TextField(
              decoration: InputDecoration(
                labelText: 'Search Causes',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
            SizedBox(height: 10),
            // Total Donations
            Text(
              'Total Donations: \$${totalDonations.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            // Causes List
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: displayedCauses.length,
              itemBuilder: (context, index) {
                Cause cause = displayedCauses[index];
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cause.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(cause.description),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Bids: \$${cause.totalBids.toStringAsFixed(2)}',
                            ),
                            Text(
                              'Donations: \$${cause.totalDonations.toStringAsFixed(2)}',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              icon: Icon(Icons.share),
                              onPressed: () => shareCause(cause),
                            ),
                            ElevatedButton(
                              child: Text('Bid'),
                              onPressed: () {
                                setState(() {
                                  selectedCause = cause;
                                });
                                showBidDialog(cause);
                              },
                            ),
                            ElevatedButton(
                              child: Text('Donate'),
                              onPressed: () {
                                setState(() {
                                  selectedCause = cause;
                                });
                                showDonationDialog(cause);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Engagement & Fundraising',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Join us in making a difference! Share causes and help us reach our goals.',
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Join the Campaign'),
              onPressed: () {
                joinCampaign();
              },
            ),
          ],
        ),
      ),
    );
  }

  void showBidDialog(Cause cause) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Place a Bid for ${cause.title}'),
        content: TextField(
          controller: bidController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(hintText: 'Enter bid amount'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              placeBid(cause);
              Navigator.pop(context);
            },
            child: Text('Bid'),
          ),
        ],
      ),
    );
  }

  void showDonationDialog(Cause cause) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Donate to ${cause.title}'),
        content: TextField(
          controller: donationController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(hintText: 'Enter donation amount'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              donateToCause(cause);
              Navigator.pop(context);
            },
            child: Text('Donate'),
          ),
        ],
      ),
    );
  }
  Widget _buildDrawer() {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('John Doe'),
            accountEmail: Text('john.doe@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.1&auto=format&fit=crop&w=80&q=80',
              ),
            ),
            decoration: BoxDecoration(color: Colors.teal),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.volunteer_activism),
            title: Text('Fundraising'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FundraisePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Volunteering'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VolunteerPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.handshake_rounded),
            title: Text('Featured Causes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeaturedcausePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.library_books, color: Colors.lightBlue),
            title: Text('Courses'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => coursesPage()),
              );
            },
          ),

          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => aboutUsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }

}

