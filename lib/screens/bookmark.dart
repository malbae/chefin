import 'package:chefin/screens/ProductDetailScreen.dart';
import 'package:chefin/screens/home_screen.dart';
import 'package:chefin/screens/profile.dart';
import 'package:chefin/screens/upload_screen.dart';
import 'package:flutter/material.dart';

class BookmarkScreen extends StatefulWidget {
  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  int _currentIndex = 2; // Default index for BookmarkScreen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BOOKMARK',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              SizedBox(height: 20),
              _buildSection(context, 'Recently Viewed'),
              _buildSection(context, 'Made It'),
              _buildSection(context, 'Breakfast'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        selectedItemColor:
            _currentIndex == 2 ? Color.fromRGBO(54, 129, 74, 1) : Colors.grey,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UploadScreen()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(54, 129, 74, 1),
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.white),
          hintText: 'Search',
          hintStyle: TextStyle(color: Color.fromRGBO(172, 172, 172, 1)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'See All',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            _buildRecipeCard(
              context,
              'Avocado Smoothie',
              'assets/images/avo.jpg',
              4.5,
              'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
            ),
            SizedBox(width: 10),
            _buildRecipeCard(
              context,
              'Banana Cake',
              'assets/images/bananacake.jpg',
              4.7,
              'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
            ),
            SizedBox(width: 10),
            _buildRecipeCard(
              context,
              'Milkshake',
              'assets/images/milkshake.jpg',
              4.8,
              'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildRecipeCard(BuildContext context, String title, String imageUrl,
      double rating, String videoUrl) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                title: title,
                imageUrl: imageUrl,
                rating: rating,
                videoUrl: videoUrl,
              ),
            ),
          );
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
