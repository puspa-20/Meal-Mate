import 'package:flutter/material.dart';

class RamenPage extends StatelessWidget {
  final List<Map<String, dynamic>> turkishFoods = [
    {
      'name': 'Kebab',
      'ingredients': 'Meat, Spices, Vegetables',
      'calories': '450 kcal',
      'image':
          'https://st2.depositphotos.com/16122460/47505/i/450/depositphotos_475050778-stock-photo-metal-skewers-delicious-meat-vegetables.jpg',
    },
    {
      'name': 'Baklava',
      'ingredients': 'Phyllo Dough, Nuts, Honey',
      'calories': '350 kcal',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqzgvuWEtjrTHm470Er7d2536SLc1sZQpnSA&s', // Example URL
    },
    {
      'name': 'Pide',
      'ingredients': 'Bread, Cheese, Meat',
      'calories': '500 kcal',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSGyT6KAjIaYjpHNLRg4veq0YHVoerkJNjhw&s', // Example URL
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Turkish Cuisine'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two cards per row
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: turkishFoods.length,
        itemBuilder: (context, index) {
          final food = turkishFoods[index];
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
