import 'package:flutter/material.dart';

class PizzaPage extends StatelessWidget {
  final List<Map<String, dynamic>> nepaleseFoods = [
    {
      'name': 'Momo',
      'ingredients': 'Flour, Meat/Vegetables, Spices',
      'calories': '250 kcal (per serving)',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRS_EoUbW46TcmSL1A7lxYyxaQKrghMn9YXQQ&s',
    },
    {
      'name': 'Dal Bhat',
      'ingredients': 'Lentils, Rice, Vegetables',
      'calories': '500 kcal',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe4smbaShZMVDttmyHprepdXyLFW9wWq4INg&s',
    },
    {
      'name': 'Sel Roti',
      'ingredients': 'Rice Flour, Sugar, Milk',
      'calories': '300 kcal (per piece)',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXEb7pfiIYKQ1H2LzKjFZ18LUCAe41fm9jpQ&s',
    },
    {
      'name': 'Gundruk',
      'ingredients': 'Fermented Leafy Vegetables',
      'calories': '50 kcal (per serving)',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg4NqUQ9CItURmSmgZsHadi7-CwuAmz6Orww&s',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nepalese Cuisine'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: nepaleseFoods.length,
        itemBuilder: (context, index) {
          final food = nepaleseFoods[index];
          return _buildFoodCard(context, food);
        },
      ),
    );
  }

  Widget _buildFoodCard(BuildContext context, Map<String, dynamic> food) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailsPage(
              name: food['name'],
              ingredients: food['ingredients'],
              calories: food['calories'],
              image: food['image'],
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15.0),
                ),
                child: Image.network(
                  food['image'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Calories: ${food['calories']}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodDetailsPage extends StatelessWidget {
  final String name;
  final String ingredients;
  final String calories;
  final String image;

  const FoodDetailsPage({
    required this.name,
    required this.ingredients,
    required this.calories,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                'Ingredients:',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(ingredients, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              Text(
                'Calories:',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(calories, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
