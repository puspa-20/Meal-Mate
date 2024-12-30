import 'package:flutter/material.dart';

class FocacciaPage extends StatelessWidget {
  const FocacciaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Focaccia Bread'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              Image.asset(
                'assets/Focaccia-Bread.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),

              // Title Section
              Text(
                'Focaccia Bread',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'By David · Nutrition',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),

              // Description Section
              const Text(
                'Focaccia Bread is a classic Italian recipe infused with olive oil and herbs. '
                'This bread is perfect as a side dish, for dipping in soups, or for making gourmet sandwiches. '
                'Soft on the inside with a slightly crisp crust, it’s a delight for any meal.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),

              // Calorie Section
              Row(
                children: const [
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.red,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Calories: 270 kcal',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Ingredients Section
              const Text(
                'Ingredients',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '- 2 cups all-purpose flour\n'
                '- 1 tsp salt\n'
                '- 1/4 cup olive oil\n'
                '- 1 tsp sugar\n'
                '- 1 packet active dry yeast\n'
                '- 1 cup warm water\n'
                '- Rosemary and sea salt for topping',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 16),

              // Preparation Section
              const Text(
                'Preparation',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Mix warm water, sugar, and yeast in a bowl. Let it sit for 5-10 minutes until frothy.\n'
                '2. Combine flour and salt in a mixing bowl. Add the yeast mixture and olive oil. Mix until dough forms.\n'
                '3. Knead the dough for about 5 minutes until smooth and elastic.\n'
                '4. Cover and let the dough rise in a warm place for 1 hour or until doubled in size.\n'
                '5. Preheat the oven to 400°F (200°C).\n'
                '6. Spread the dough onto a greased baking sheet. Make dimples with your fingers and drizzle olive oil on top.\n'
                '7. Sprinkle with rosemary and sea salt.\n'
                '8. Bake for 20-25 minutes or until golden brown.\n',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 16),

              // Back Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back to Recipes'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
