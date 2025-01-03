import 'package:flutter/material.dart';

import '../screens/category_screen.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final bool isSelected;

  CategoryCard({
    required this.title,
    required this.imageUrl,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(categoryTitle: title),
          ),
        );
      },
      child: Container(
        width: 90,
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: isSelected ? Color.fromRGBO(54, 129, 74, 1) : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: imageUrl.startsWith('assets/')
                  ? Image.asset(
                      imageUrl,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      imageUrl,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(height: 15),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
