import 'package:flutter/material.dart';

class SaladPage extends StatelessWidget {
  final List<Map<String, dynamic>> italianFoods = [
    {
      'name': 'Pizza Margherita',
      'ingredients': 'Tomato, Mozzarella, Basil',
      'calories': '300 kcal',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfOzlr6tfXGs2luWnC3Ph6y6RdaA89TSn_9Q&s',
    },
    {
      'name': 'Spaghetti Carbonara',
      'ingredients': 'Pasta, Eggs, Parmesan, Bacon',
      'calories': '400 kcal',
      'image':
          'https://www.shutterstock.com/image-photo/spaghetti-carbonara-classic-italian-pasta-260nw-2509417241.jpg',
    },
    {
      'name': 'Tiramisu',
      'ingredients': 'Mascarpone, Coffee, Ladyfingers, Cocoa',
      'calories': '450 kcal',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCFcN6zdwhHVDD_1Xe8PXsy8L5p4tT8ZC0Wg&s',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Italian Cuisine'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two cards per row
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: italianFoods.length,
        itemBuilder: (context, index) {
          final food = italianFoods[index];
          return _buildFoodCard(context, food);
        },
      ),
    );
  }

  Widget _buildFoodCard(BuildContext context, Map<String, dynamic> food) {
    return Stack(
      children: [
        Column(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
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
                    child: Expanded(
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
          ],
        ),
        // Positioned(right: 8, child: Icon(Icons.favorite)),
      ],
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
