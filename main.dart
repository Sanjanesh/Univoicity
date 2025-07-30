import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Univoicity',
      theme: ThemeData(
        primaryColor: Color(0xFF004D40), // Dark green from the background
        colorScheme: ColorScheme.light(
          primary: Color(0xFF004D40), // Dark green
          secondary: Color(0xFFFFD600), // Yellow from the coins
          surface: Color(0xFF00796B), // Lighter green for surface
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.white,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Trebuchet MS'),
          bodyMedium: TextStyle(fontFamily: 'Trebuchet MS'),
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        primaryColor: Color(0xFF004D40), // Dark green from the background
        colorScheme: ColorScheme.dark(
          primary: Color(0xFF004D40), // Dark green
          secondary: Color(0xFFFFD600), // Yellow from the coins
          surface: Color(0xFF00796B), // Lighter green for surface
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.white,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Trebuchet MS'),
          bodyMedium: TextStyle(fontFamily: 'Trebuchet MS'),
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system, // Use system theme mode
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 32,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Sign in using your University credentials',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 32),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Username',
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Password',
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text('SIGN IN'),
                ),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                ),
                child: Text('Privacy Policy'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String name = "Name"; // Replace with actual user name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi, $name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildInfoCard(context, 'Overall Ratings', 70), // Example percentage
                  _buildInfoCard(context, 'Majority Votings', 80),
                  _buildInfoCard(context, 'Like Majority', 85),
                  _buildInfoCard(context, 'Dislike Majority', 15),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  icon: Icon(Icons.logout),
                  label: Text('Sign Out'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 32),
                    backgroundColor: Color(0xFFFFD600),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewPostPage()),
                    );
                  },
                  icon: Icon(Icons.add),
                  label: Text('Post'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 32),
                    backgroundColor: Color(0xFFFFD600),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Posts',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PostsPage()),
            );
          }
        },
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, String label, int percentage) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          CircularProgressIndicator(
            value: percentage / 100.0,
            strokeWidth: 8.0,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '$percentage%',
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class PostsPage extends StatelessWidget {
  final List<Map<String, String>> rules = [
    {
      'date': 'Tuesday, 24 August 2021',
      'subject': 'Rule N',
      'description': 'Votes for Women!',
      'upvotes': '120',
      'downvotes': '30',
    },
    {
      'date': 'Wednesday, 22 September 2021',
      'subject': 'Rule N',
      'description': 'Votes for Women!',
      'upvotes': '150',
      'downvotes': '40',
    },
    {
      'date': 'Sunday, 12 December 2021',
      'subject': 'Rule N',
      'description': 'History: Russia in Revolution',
      'upvotes': '200',
      'downvotes': '20',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: ListView.builder(
        itemCount: rules.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rules[index]['date']!,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  rules[index]['subject']!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.thumb_up, color: Colors.green),
                    SizedBox(width: 4),
                    Text(rules[index]['upvotes']!),
                    SizedBox(width: 16),
                    Icon(Icons.thumb_down, color: Colors.red),
                    SizedBox(width: 4),
                    Text(rules[index]['downvotes']!),
                  ],
                ),
                SizedBox(height: 16),
                Text(rules[index]['description']!),
                Divider(),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewPostPage()),
          );
        },
        backgroundColor: Color(0xFFFFD600),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Posts',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PostsPage()),
            );
          }
        },
      ),
    );
  }
}
class NewPostPage extends StatefulWidget {
  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  String generatedPolicy = "Press the button to generate a rule";
  bool isLoading = false;
  Future<void> generatePolicy() async {
    setState(() {
      isLoading = true;
    });
    try {
      // Initialize GenerativeModel
      final model = GenerativeModel(
        model: 'ENTER YOUR GEMINI AI MODEL HERE',
        apiKey: 'ENTER YOUR KEY HERE',
      );

      // Set the prompt to generate university or college campus-specific rule
      const prompt = 'Generate a random university or college campus-specific rule or policy in a max of 100 word .';
      final response = await model.generateContent([Content.text(prompt)]);

      setState(() {
        generatedPolicy = response.text!;
      });
    } catch (e) {
      print('Error generating policy: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Subject',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 6,
            ),
            SizedBox(height: 16),
            isLoading
                ? CircularProgressIndicator()
                : Text(generatedPolicy),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: generatePolicy,
              child: Text('Generate Rule/Policy'),
            ),
          ],
        ),
      ),
    );
  }
}
