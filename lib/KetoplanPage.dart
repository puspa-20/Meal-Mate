import 'package:flutter/material.dart';

class KetoplanPage extends StatelessWidget {
  const KetoplanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ketoplan'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/ketoplan.jpg',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              const Text(
                'Ketoplan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'By David',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'The Ketoplan is a specially curated set of recipes focusing on low-carb and high-fat meals to help you maintain ketosis effectively.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Icon(Icons.local_fire_department, color: Colors.red),
                  SizedBox(width: 8),
                  Text(
                    '450 Calories',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Ingredients:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '- 2 cups almond flour\n'
                '- 1/4 cup coconut oil\n'
                '- 1/4 cup unsweetened cocoa powder\n'
                '- 2 tablespoons erythritol\n'
                '- 1 teaspoon vanilla extract\n'
                '- 1/2 teaspoon baking powder',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              const Text(
                'Preparation Steps:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Preheat the oven to 350°F (175°C).\n'
                '2. Mix almond flour, cocoa powder, and baking powder in a bowl.\n'
                '3. Melt coconut oil and mix with vanilla extract and erythritol.\n'
                '4. Combine wet and dry ingredients until smooth.\n'
                '5. Shape into small cookies and place on a baking tray.\n'
                '6. Bake for 12-15 minutes until firm. Let cool before serving.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
