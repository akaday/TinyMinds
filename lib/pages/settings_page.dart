import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Color _aboutContainerColor = Color.fromARGB(255, 223, 223, 223);
  Color _shareContainerColor = Color.fromARGB(255, 223, 223, 223);
  Color _contactContainerColor = Color.fromARGB(255, 223, 223, 223);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 249, 255),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) {
                setState(() {
                  _aboutContainerColor = Colors.white; // White color on hover
                });
              },
              onExit: (_) {
                setState(() {
                  _aboutContainerColor = Color.fromARGB(255, 223, 223, 223); // Gray color on exit
                });
              },
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: _aboutContainerColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'About',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 74, 74, 74),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) {
                setState(() {
                  _shareContainerColor = Colors.white; // White color on hover
                });
              },
              onExit: (_) {
                setState(() {
                  _shareContainerColor = Color.fromARGB(255, 223, 223, 223); // Gray color on exit
                });
              },
              child: InkWell(
                onTap: () {
                  Share.share('com.Tiny_Minds.Share_app');
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: _shareContainerColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Share',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 74, 74, 74),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) {
                setState(() {
                  _contactContainerColor = Colors.white; // White color on hover
                });
              },
              onExit: (_) {
                setState(() {
                  _contactContainerColor = Color.fromARGB(255, 223, 223, 223);// Gray color on exit
                });
              },
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactUs()),
                  );
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: _contactContainerColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 74, 74, 74),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '1.0.0 (2024.07.4)',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'By Rana',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: Text('About the App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About the App',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25.0),
            Text(
              'I\'m a computer science student and a programming enthusiast. I developed this app to apply my knowledge of flutter and programming concepts. The app is designed for children, allowing them to learn the pronunciation of letters, numbers, animals, geometric shapes, and colors.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'One of the key features is a simple game where children can match objects to their corresponding categories. The app has been designed in an attractive and clear manner to engage children and facilitate their learning.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactUs extends StatelessWidget {
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appBarColor = Colors.blue.shade200;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Contact Us'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: Text(
                'If you have any comments, please feel free to let me know. Additionally, I\'m open to discussing freelance opportunities and potential collaborations.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 24.0),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _messageController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  String email = _emailController.text.trim();
                  String message = _messageController.text.trim();

                  if (email.isEmpty || !email.contains('@')) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please enter a valid email address.'),
                      ),
                    );
                  } else if (message.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please enter a message.'),
                      ),
                    );
                  } else {
                    print('Email: $email');
                    print('Message: $message');
                    _emailController.clear();
                    _messageController.clear();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: appBarColor,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}