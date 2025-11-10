import 'package:flutter/material.dart';

void main() {
  runApp(MyHomeApp());
}

class MyHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volunteer Hub',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Volunteer Hub'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Search action
              },
              tooltip: 'Search Opportunities',
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                // Profile action
              },
              tooltip: 'Profile',
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
                        borderRadius: BorderRadius.circular(10),
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
              Container(
                height: 100,
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
                child: SectionTitle(title: 'Featured Opportunities'),
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
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.volunteer_activism),
                  label: Text('Become a Volunteer'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    // Navigate to sign-up page or action
                  },
                ),
              ),
              // Footer
              Container(
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
    return Align(
      alignment: Alignment.centerLeft,
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
      width: 80,
      margin: EdgeInsets.only(right: 12),
      child: Column(
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
            style: TextStyle(fontSize: 14),
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Image.network(
            imageUrl,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
