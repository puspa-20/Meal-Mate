import 'package:flutter/material.dart';
import 'package:meal_mate/FocacciaPage.dart';
import 'package:meal_mate/KetoplanPage.dart';
import 'package:meal_mate/PancakePage.dart';
import 'package:meal_mate/nepalese.dart';
import 'package:meal_mate/italian.dart';
import 'package:meal_mate/turkish.dart'; // Your Turkish Page
import 'package:meal_mate/welcomescreen.dart'; // Welcome Screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenWithNavigation(),
    );
  }
}

class SplashScreenWithNavigation extends StatefulWidget {
  @override
  _SplashScreenWithNavigationState createState() =>
      _SplashScreenWithNavigationState();
}

class _SplashScreenWithNavigationState
    extends State<SplashScreenWithNavigation> {
  @override
  void initState() {
    super.initState();
  }

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RecipeHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(onGetStarted: _navigateToHome);
  }
}

class RecipeHomePage extends StatelessWidget {
  const RecipeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 231, 216, 106),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: const [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
              "https://media.licdn.com/dms/image/v2/D4D03AQF2CcWrOL--TA/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1727267835114?e=2147483647&v=beta&t=fr6gI9i_3V5C5yDolrU0N9akfkF5Co4yWhj7br2JsBg",
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Stay at home,\nmake healthy food',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryButton(
                    context,
                    'Turkish',
                    Icons.ramen_dining,
                    const Color.fromARGB(255, 221, 211, 29),
                    RamenPage(),
                  ),
                  _buildCategoryButton(
                    context,
                    'Italian',
                    Icons.local_dining,
                    const Color.fromARGB(255, 221, 211, 29),
                    SaladPage(),
                  ),
                  _buildCategoryButton(
                    context,
                    'Nepalese',
                    Icons.local_pizza,
                    const Color.fromARGB(255, 221, 211, 29),
                    PizzaPage(),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Popular Recipes',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              RecipeButton(
                title: 'Ketoplan',
                imagePath: 'assets/ketoplan.jpg',
                author: 'David',
                role: 'Nutrition',
                rating: 4.5,
                page: KetoplanPage(),
              ),
              const SizedBox(height: 16),
              RecipeButton(
                title: 'Pancake',
                imagePath: 'assets/receipe2.jpg',
                author: 'David',
                role: 'Nutrition',
                rating: 4.7,
                page: PancakePage(),
              ),
              const SizedBox(height: 16),
              RecipeButton(
                title: 'Focaccia-Bread',
                imagePath: 'assets/Focaccia-Bread.jpg',
                author: 'David',
                role: 'Nutrition',
                rating: 4.7,
                page: FocacciaPage(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
        ],
        currentIndex: 1,
        onTap: (index) {},
      ),
    );
  }

  Widget _buildCategoryButton(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    Widget page,
  ) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      icon: Icon(icon, color: Colors.black),
      label: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildRecipeButton(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    Widget page,
  ) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      icon: Icon(icon, color: Colors.black),
      label: Text(title),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildRecipeCard(
    String title,
    String imagePath,
    String author,
    String role,
    double rating,
  ) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('$author - $role'),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 16),
                    Text('$rating'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeButton extends StatelessWidget {
  final String title;
  final String imagePath;
  final String author;
  final String role;
  final double rating;
  final Widget page;

  const RecipeButton({
    super.key,
    required this.title,
    required this.imagePath,
    required this.author,
    required this.role,
    required this.rating,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('$author - $role'),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 16),
                      Text('$rating'),
                    ],
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
