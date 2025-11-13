import 'package:flutter/material.dart';
import 'FeaturedCause.dart';
import 'Fundraise.dart';
import 'Login.dart';
import 'Volunteer.dart';
import 'courses.dart';
import 'Homepage.dart';

class aboutUsPage extends StatefulWidget {
  const aboutUsPage({Key? key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<aboutUsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: _buildDrawer(),
    appBar: AppBar(
      title: Text(
        'About Us',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 4,
      actions: [IconButton(icon: Icon(Icons.share), onPressed: () {})],
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Banner Image
          Stack(
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-4.0.3&auto=format&fit=crop&w=1600&q=80',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  color: Colors.black54,
                  child: Text(
                    'Our Journey & Mission',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Mission & Vision Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _buildSectionTitle('Our Mission'),
                _buildMissionCard(),
                SizedBox(height: 20),
                _buildSectionTitle('Our Vision'),
                _buildVisionCard(),
              ],
            ),
          ),
          SizedBox(height: 30),
          // Team Members
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: _buildSectionTitle('Meet the Team'),
          ),
          SizedBox(height: 10),
          _buildTeamMembers(),
          SizedBox(height: 30),
          // Values & Principles
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: _buildSectionTitle('Our Values'),
          ),
          SizedBox(height: 10),
          _buildValuesList(),
          SizedBox(height: 30),
          // Testimonials Carousel
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: _buildSectionTitle('What People Say'),
          ),
          SizedBox(height: 10),
          _buildTestimonials(),
          SizedBox(height: 30),
          // partner Info
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: _buildSectionTitle('Our Partners'),
          ),
          _partners(),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: _buildSectionTitle('Contact Us'),
          ),
          _buildContactInfo(),
          SizedBox(height: 40),
        ],
      ),
    ),
  );

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
      ),
    );
  }

  Widget _buildMissionCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Our mission is to embody the love and teachings of Christ by serving others through volunteering, spreading kindness, and making a positive impact in our community and beyond. We aim to reflect Christ’s compassion in all our actions and inspire others to live out their faith through service.',
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
      ),
    );
  }

  Widget _buildVisionCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Our vision is to build a world where Christ’s love is evident in every act of service, fostering a spirit of unity, compassion, and hope. We aspire to be a beacon of faith-driven volunteerism that transforms lives, uplifts communities, and advances the Kingdom of God through dedicated service and unwavering faith.',
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
      ),
    );
  }

  Widget _buildTeamMembers() {
    return SizedBox(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          _buildTeamMemberCard(
            'Josef Tan',
            'CEO',
            'https://www.profilebakery.com/wp-content/uploads/2023/04/Profile-Image-AI.jpg',
          ),
          _buildTeamMemberCard(
            'Benedict Lo',
            'CTO',
            'https://tse1.mm.bing.net/th/id/OIP.gC50yYmv2Xz6hu5vbHnsUgHaI1?cb=ucfimg2ucfimg=1&w=768&h=916&rs=1&pid=ImgDetMain&o=7&rm=3',
          ),
          _buildTeamMemberCard(
            'Kendric Chia',
            'Design Lead',
            'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?cs=srgb&dl=pexels-pixabay-415829.jpg&fm=jpg',
          ),
        ],
      ),
    );
  }

  Widget _buildTeamMemberCard(String name, String role, String imageUrl) {
    return Container(
      width: 180,
      margin: EdgeInsets.only(right: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    role,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValuesList() {
    final values = [
      'Integrity',
      'Innovation',
      'Customer Centricity',
      'Sustainability',
      'Collaboration',
    ];
    return Column(
      children: values
          .map(
            (value) => ListTile(
              leading: Icon(Icons.check_circle, color: Colors.teal),
              title: Text(value, style: TextStyle(fontSize: 16)),
            ),
          )
          .toList(),
    );
  }

  Widget _buildTestimonials() {
    final testimonials = [
      {
        'name': 'Emily R.',
        'feedback':
            'This company transformed our business! Highly recommended.',
        'avatar':
            'https://images.unsplash.com/photo-1544723795-3fb7267f4a7e?ixlib=rb-4.0.3&auto=format&fit=crop&w=80&q=80',
      },
      {
        'name': 'David P.',
        'feedback': 'Exceptional service and support. Will work again!',
        'avatar':
            'https://images.unsplash.com/photo-1544725176-6c7f0a2fbd6b?ixlib=rb-4.0.3&auto=format&fit=crop&w=80&q=80',
      },
      {
        'name': 'Sophia L.',
        'feedback': 'Innovative solutions that exceeded our expectations.',
        'avatar':
            'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&auto=format&fit=crop&w=80&q=80',
      },
    ];

    return SizedBox(
      height: 180,
      child: PageView.builder(
        itemCount: testimonials.length,
        controller: PageController(viewportFraction: 0.8),
        itemBuilder: (context, index) {
          final testimonial = testimonials[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(testimonial['avatar']!),
                      radius: 30,
                    ),
                    SizedBox(height: 10),
                    Text(
                      testimonial['name']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '"${testimonial['feedback']!}"',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContactInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.teal),
            title: Text('Block 209, Petir Road, Singapore 670209'),
          ),
          ListTile(
            leading: Icon(Icons.phone, color: Colors.teal),
            title: Text('+65 8869 7009'),
          ),
          ListTile(
            leading: Icon(Icons.email, color: Colors.teal),
            title: Text('BENEDICTLO.24@ICHAT.SP.EDU.SG'),
          ),
          ListTile(
            leading: Icon(Icons.web, color: Colors.teal),
            title: Text('www.MAD_Project5.com'),
          ),
        ],
      ),
    );
  }

  Widget _partners() {
    final partners = [
      {
        'name': 'Apple Inc.',
        'logoUrl':
            'https://tse2.mm.bing.net/th/id/OIP.7HOlw6Jv11QsttgewwwKVAHaIy?cb=ucfimg2ucfimg=1&w=1100&h=1306&rs=1&pid=ImgDetMain&o=7&rm=3',
      },
      {
        'name': 'Google LLC',
        'logoUrl':
            'https://th.bing.com/th/id/R.0fa3fe04edf6c0202970f2088edea9e7?rik=joOK76LOMJlBPw&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fgoogle-logo-png-open-2000.png&ehk=0PJJlqaIxYmJ9eOIp9mYVPA4KwkGo5Zob552JPltDMw%3d&risl=&pid=ImgRaw&r=0',
      },
      {
        'name': 'Microsoft Corporation',
        'logoUrl':
            'https://static.vecteezy.com/system/resources/previews/027/127/592/original/microsoft-logo-microsoft-icon-transparent-free-png.png',
      },
      {
        'name': 'Amazon.com, Inc.',
        'logoUrl':
            'https://tse1.mm.bing.net/th/id/OIP.mfjIDgZfzL5i-BViz7SCnwHaD4?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3',
      },
      {
        'name': 'Facebook, Inc.',
        'logoUrl':
            'https://upload.wikimedia.org/wikipedia/commons/0/05/Facebook_Logo_%282019%29.png',
      },
      {
        'name': 'IBM Corporation',
        'logoUrl':
            'https://tse4.mm.bing.net/th/id/OIP.2oiBEbCOVsFhInNCvBXJ-wHaFj?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3',
      },
      {
        'name': 'Samsung Electronics',
        'logoUrl':
            'https://th.bing.com/th/id/R.249bdf90ed25ef2b97a6aa5c23d994a9?rik=QAjvvpnUKsoDLg&riu=http%3a%2f%2fpngimg.com%2fuploads%2fsamsung_logo%2fsamsung_logo_PNG9.png&ehk=%2fW9ePMTHHsVS0slRmdPhqpc4DLRJHQ8cGkkewyys0lE%3d&risl=&pid=ImgRaw&r=0',
      },
      {
        'name': 'Dell Technologies',
        'logoUrl':
            'https://static.vecteezy.com/system/resources/previews/022/100/931/original/dell-logo-transparent-free-png.png',
      },
      {
        'name': 'Zoom Video Communications',
        'logoUrl':
            'https://static.vecteezy.com/system/resources/previews/012/871/376/original/zoom-logo-in-blue-colors-meetings-app-logotype-illustration-free-png.png',
      },
      {
        'name': 'Snap Inc.',
        'logoUrl':
            'https://static.vecteezy.com/system/resources/previews/021/460/234/original/snapchat-logo-free-download-free-png.png',
      },
      {
        'name': 'Spotify Technology S.A.',
        'logoUrl':
            'https://th.bing.com/th/id/OIP.Lrxsd7qE1xlNSo9qczRXHgHaHa?o=7&cb=ucfimg2rm=3&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3',
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.business, color: Colors.teal),
            title: Text(
              'Our Partners',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 120, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: partners.length,
              itemBuilder: (context, index) {
                final partner = partners[index];
                return Container(
                  width: 100,
                  margin: EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      // Logo Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          partner['logoUrl']!,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 4),
                      // Partner Name
                      Text(
                        partner['name']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
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
                MaterialPageRoute(builder: (context) => MyHomeApp()),
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
