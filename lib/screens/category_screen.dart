import 'package:flutter/material.dart';

import 'productdetailscreen.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryTitle;

  CategoryScreen({required this.categoryTitle});

  final Map<String, List<Map<String, String>>> categoryDishes = {
    "Breakfast": [
      {
        "name": "Nasi Goreng",
        "description": "Delicious fried rice with eggs and veggies",
        "imageUrl": "https://via.placeholder.com/150",
        "link": "https://example.com/nasi-goreng",
        "videoUrl": "https://example.com/nasi-goreng-video"
      },
      {
        "name": "Pancakes",
        "description": "Fluffy pancakes with syrup",
        "imageUrl": "https://via.placeholder.com/150",
        "link": "https://example.com/pancakes",
        "videoUrl": "https://example.com/pancakes-video"
      },
    ],
    // Add additional categories...
  };

  @override
  Widget build(BuildContext context) {
    final dishes = categoryDishes[categoryTitle] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(54, 129, 74, 1),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dishes.length,
          itemBuilder: (context, index) {
            final dish = dishes[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(
                      title: dish["name"] ?? "Unknown Dish",
                      imageUrl:
                          dish["imageUrl"] ?? "https://via.placeholder.com/150",
                      rating: 4.5, videoUrl: '', // Example rating
                    ),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        dish["imageUrl"] ?? "https://via.placeholder.com/150",
                        width: 120,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dish["name"] ?? "",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            dish["description"] ?? "",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
