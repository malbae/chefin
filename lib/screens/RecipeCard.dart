import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double rating;

  RecipeCard({
    required this.title,
    required this.imageUrl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFF5FFE8), // Light green background
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title and Bookmark Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Most Popular Recipes",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
              Icon(Icons.bookmark_border, color: Colors.green),
            ],
          ),
          SizedBox(height: 8),

          // Rating
          Row(
            children: [
              Icon(Icons.star, color: Colors.yellow, size: 20),
              SizedBox(width: 4),
              Text(
                rating.toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),

          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              width: 180,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),

          // Recipe Title
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8),

          // Details Row (Time, Difficulty, Calories)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(Icons.timer, color: Colors.grey[600]),
                  SizedBox(width: 4),
                  Text("10 mins"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.leaderboard, color: Colors.grey[600]),
                  SizedBox(width: 4),
                  Text("Medium"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.local_fire_department, color: Colors.grey[600]),
                  SizedBox(width: 4),
                  Text("350 kcal"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RecipeCardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recipe Card Example")),
      body: Center(
        child: RecipeCard(
          title: "Banana Cake",
          imageUrl:
              "https://images.unsplash.com/photo-1556742042-3c52d6e88c62", // Example URL
          rating: 4.3,
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: RecipeCardExample()));
