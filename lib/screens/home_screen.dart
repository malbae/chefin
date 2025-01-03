import 'package:chefin/screens/bookmark.dart';
import 'package:chefin/screens/profile.dart';
import 'package:flutter/material.dart';

import '../widgets/category_card.dart';
import 'ProductDetailScreen.dart'; // Make sure to import ProductDetailScreen
import 'upload_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 20),

              // Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello, Jokowi",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://globalmedianews.co.id/wp-content/uploads/2020/01/43d0897159987ef5d32291zcp-111851.jpg"),
                    radius: 20,
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Title Section
              Text(
                "What do you want to cook today?",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 20),

              // Search Bar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(54, 129, 74, 1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: const Color.fromRGBO(172, 172, 172, 1),
                    ),
                    icon: Icon(Icons.search, color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),

              // Categories Section
              Text(
                "Categories",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryCard(
                    title: "Breakfast",
                    imageUrl:
                        "https://images.unsplash.com/photo-1546069901-eacef0df6022",
                    isSelected: true,
                  ),
                  CategoryCard(
                    title: "Lunch",
                    imageUrl:
                        "https://images.unsplash.com/photo-1551218808-94e220e084d2",
                  ),
                  CategoryCard(
                    title: "Dinner",
                    imageUrl:
                        "https://images.unsplash.com/photo-1504674900247-0877df9cc836",
                  ),
                  CategoryCard(
                    title: "Dessert",
                    imageUrl:
                        "https://images.unsplash.com/photo-1578985545062-69928b1d9587",
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Recommendations Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommendation",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See all",
                      style: TextStyle(color: Color.fromRGBO(54, 129, 74, 1)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Inside the GridView.builder and RecipeCard widget:
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            title: index == 0
                                ? "Banana Cake"
                                : index == 1
                                    ? "Ice Cream on Cookie"
                                    : index == 2
                                        ? "Chocolate Milkshake"
                                        : "Avocado Milkshake",
                            imageUrl: index == 0
                                ? 'assets/images/bananacake.jpg'
                                : index == 1
                                    ? "assets/images/icecream.jpg"
                                    : index == 2
                                        ? "assets/images/milkshake.jpg"
                                        : "assets/images/avo.jpg",
                            rating: 4.7 + index * 0.1,
                            videoUrl: '',
                          ),
                        ),
                      );
                    },
                    child: RecipeCard(
                      title: index == 0
                          ? "Banana Cake"
                          : index == 1
                              ? "Ice Cream on Cookie"
                              : index == 2
                                  ? "Chocolate Milkshake"
                                  : "Avocado Milkshake",
                      subtitle: index < 2 ? "Dessert" : "Drink",
                      rating: 4.7 + index * 0.1,
                      imageUrl: index == 0
                          ? 'assets/images/bananacake.jpg'
                          : index == 1
                              ? 'assets/images/icecream.jpg'
                              : index == 2
                                  ? 'assets/images/milkshake.jpg'
                                  : 'assets/images/avo.jpg',
                    ),
                  );
                },
              )
            ]),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            ],
            selectedItemColor: Color.fromRGBO(54, 129, 74, 1),
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) {
              if (index == 1) {
                // Navigate to UploadScreen if the add button is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UploadScreen()),
                );
              }

              if (index == 2) {
                // Navigate to UploadScreen if the add button is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookmarkScreen()),
                );
              }

              if (index == 3) {
                // Navigate to UploadScreen if the add button is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              }
            }));
  }
}

// RecipeCard widget
class RecipeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double rating;
  final String imageUrl;

  const RecipeCard({
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(54, 129, 74, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.white, size: 14),
                      SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                      color: Color.fromRGBO(54, 129, 74, 1), fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
