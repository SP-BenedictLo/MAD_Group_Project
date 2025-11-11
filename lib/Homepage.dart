import 'package:flutter/material.dart';
import 'profile.dart';
import 'FeaturedCause.dart';
import 'Fundraise.dart';
import 'Login.dart';
import 'Volunteer.dart';
import 'courses.dart';
import 'AboutUs.dart';

void main() {
  runApp(MyHomeApp());
}

class MyHomeApp extends StatefulWidget {
  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volunteer Hub',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Helvetica Neue', // Optional: custom font for better looks
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> carouselImages = [
    'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-4.0.1&auto=format&fit=crop&w=1470&q=80',
    'https://images.unsplash.com/photo-1549924231-f129b911e442?ixlib=rb-4.0.1&auto=format&fit=crop&w=1470&q=80',
    'https://images.unsplash.com/photo-1549924231-f129b911e442?ixlib=rb-4.0.1&auto=format&fit=crop&w=1470&q=80',
  ];

  final List<Map<String, String>> categories = [
    {'name': 'Education', 'icon': 'school'},
    {'name': 'Health', 'icon': 'medical_services'},
    {'name': 'Environment', 'icon': 'eco'},
    {'name': 'Community', 'icon': 'groups'},
    {'name': 'Animal Welfare', 'icon': 'pets'},
  ];

  final List<Map<String, String>> opportunities = [
    {
      'title': 'Teach Kids',
      'description': 'Help children learn and grow.',
      'image':
          'https://images.unsplash.com/photo-1549924231-f129b911e442?ixlib=rb-4.0.1&auto=format&fit=crop&w=800&q=80',
    },
    {
      'title': 'Park Cleanup',
      'description': 'Join us to keep parks clean.',
      'image':
          'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-4.0.1&auto=format&fit=crop&w=800&q=80',
    },
    {
      'title': 'Food Drive',
      'description': 'Support local food programs.',
      'image':
          'https://images.unsplash.com/photo-1549924231-f129b911e442?ixlib=rb-4.0.1&auto=format&fit=crop&w=800&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      appBar: AppBar(
        title: Text('Volunteer Hub'),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(builder: (context) => profilePage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Carousel Slider
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: carouselImages.length,
                controller: PageController(viewportFraction: 0.9),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        carouselImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // Categories Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SectionTitle(title: 'Explore Categories'),
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return CategoryCard(
                    name: category['name']!,
                    iconData: _getIconData(category['icon']!),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // Featured Opportunities
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SectionTitle(title: 'New Opportunities'),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: opportunities.length,
              itemBuilder: (context, index) {
                final opportunity = opportunities[index];
                return OpportunityCard(
                  title: opportunity['title']!,
                  description: opportunity['description']!,
                  imageUrl: opportunity['image']!,
                );
              },
            ),
            SizedBox(height: 20),
            // Call to Action
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton.icon(
                icon: Icon(Icons.volunteer_activism),
                label: Text('Become a Volunteer'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Navigate to sign-up page or action
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VolunteerPage()),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // Footer
            Container(
              width: double.infinity,
              color: Colors.teal.shade100,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Contact Us: info@volunteerhub.org',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '© 2024 Volunteer Hub. All rights reserved.',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
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

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'school':
        return Icons.school;
      case 'medical_services':
        return Icons.medical_services;
      case 'eco':
        return Icons.eco;
      case 'groups':
        return Icons.groups;
      case 'pets':
        return Icons.pets;
      default:
        return Icons.category;
    }
  }
}

// Widget for section titles
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
      ),
    );
  }
}

// Widget for Category Cards
class CategoryCard extends StatelessWidget {
  final String name;
  final IconData iconData;

  const CategoryCard({required this.name, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.shade100,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.teal.shade100,
            child: Icon(iconData, size: 30, color: Colors.teal),
          ),
          SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

// Widget for Opportunity Cards
class OpportunityCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const OpportunityCard({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      child: Column(
        children: [
          Image.network(
            imageUrl,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Learn More'),
                    onPressed: () {
                      // Action for more details
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
