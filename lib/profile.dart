import 'dart:math';

import 'package:flutter/material.dart';
import 'profile.dart';
import 'FeaturedCause.dart';
import 'Fundraise.dart';
import 'Login.dart';
import 'Volunteer.dart';
import 'courses.dart';
import 'AboutUs.dart';
import 'Homepage.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(profilePage());
}

class profilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volunteer Profile',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Sample user data as state variables
  String profileImage = 'https://via.placeholder.com/150';
  String name = 'Jane Doe';
  String email = 'janedoe@example.com';
  String description = 'Passionate volunteer committed to making a difference.';
  String profileImageAsset = 'assets/profile.jpg'; // Local asset image path
  int volunteeringHours = 120;

  bool isHovered = false;

  List<String> volunteerActivities = [
    'Food Drive 2023',
    'Beach Cleanup',
    'Community Tutoring',
  ];

  double donationAmount = 500.0;

  // For badges, assuming local assets are added
  List<String> badges = [
    'https://static.vecteezy.com/system/resources/previews/018/889/663/non_2x/medallion-template-vector.jpg',
    'https://static.vecteezy.com/system/resources/previews/043/899/033/original/minimalist-badge-with-flat-illustration-vector.jpg',
    'https://static.vecteezy.com/system/resources/previews/015/381/444/non_2x/medal-icon-symbol-design-templates-free-vector.jpg',
  ];
  List<String> badgename = ['Helper Badge', 'Eco Warrior', 'Educator Badge'];

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController(
      text: name,
    );
    final TextEditingController emailController = TextEditingController(
      text: email,
    );
    final TextEditingController descriptionController = TextEditingController(
      text: description,
    );
    final TextEditingController profileImageController = TextEditingController(
      text: profileImage,
    );
    // Function to pick a file
    void pickFile() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        String? filePath = result.files.single.path;
        if (filePath != null) {
          setState(() {
            profileImageController.text = filePath;
          });
        }
      } else {
        // User canceled the picker
        log('File picking cancelled' as num);
      }
    }

    return Scaffold(
      drawer: _buildDrawer(),
      appBar: AppBar(
        title: Text('My Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Edit Profile',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                  ),
                                ),
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                  ),
                                ),
                                TextFormField(
                                  controller: descriptionController,
                                  decoration: InputDecoration(
                                    labelText: 'Description',
                                  ),
                                ),
                                TextFormField(
                                  controller: profileImageController,
                                  decoration: InputDecoration(
                                    labelText: 'Profile Image URL',
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.folder_open),
                                  onPressed: pickFile,
                                ),  
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text('Cancel'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Save the data here
                                  // For example, update your variables or state
                                  setState(() {
                                    name = nameController.text;
                                    email = emailController.text;
                                    description = descriptionController.text;
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: Text('Save'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture and Basic Info
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  profileImage,
                ), //can change to AssetImage for local images
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(email, style: TextStyle(color: Colors.grey[600])),
            ),
            SizedBox(height: 20),

            // Description
            Text(
              'About Me',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(description),
            SizedBox(height: 20),

            // Volunteering Hours
            Card(
              child: ListTile(
                leading: Icon(Icons.access_time, color: Colors.blue),
                title: Text('Volunteering Hours'),
                trailing: Text(
                  '$volunteeringHours hrs',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Volunteer Activities
            Text(
              'Volunteer Activities',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...volunteerActivities.map(
              (activity) => ListTile(
                leading: Icon(Icons.check_circle_outline),
                title: Text(activity),
              ),
            ),
            SizedBox(height: 20),

            // Donations
            Text(
              'Donations',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Icon(Icons.attach_money, color: Colors.green),
              title: Text('Total Donated'),
              trailing: Text('\$${donationAmount.toStringAsFixed(2)}'),
            ),
            SizedBox(height: 20),

            // Courses / Badges Section
            Text(
              'Badges & Courses',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: badges.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: <Widget>[
                        Image.network(
                          //assets is to get from inside the file, for now using network as placeholder
                          badges[index],
                          width: 60,
                          height: 60,
                        ),
                        SizedBox(height: 5),
                        Text(badgename[index]),
                        if (index == badges.length + 1)
                          MouseRegion(
                            onHover: (_) {
                              setState(() {
                                isHovered = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                isHovered = false;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(16),
                              color: Colors.blueAccent,
                              child: Text('Hover over me'),
                            ),
                          ),
                        if (isHovered)
                          Positioned(
                            top: 50,
                            left: 0,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              color: Colors.black54,
                              child: Text(
                                'Additional info or tooltip',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),

            // Additional Sections (e.g., Certifications, Achievements)
            Text(
              'Achievements',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Icon(Icons.star, color: Colors.amber),
              title: Text('Volunteer of the Month - June 2023'),
            ),
            ListTile(
              leading: Icon(Icons.badge_rounded, color: Colors.blue),
              title: Text('Certified First Aider'),
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
}
