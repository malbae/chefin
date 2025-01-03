import 'package:chefin/screens/bookmark.dart';
import 'package:chefin/screens/home_screen.dart';
import 'package:chefin/screens/profile.dart';
import 'package:chefin/screens/upload_screen.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProductDetailScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double rating;
  final String videoUrl;

  ProductDetailScreen({
    required this.title,
    required this.videoUrl,
    required this.imageUrl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.green),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.green),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImageSection(context),
            SizedBox(height: 20),
            _buildSectionTitle("Description"),
            SizedBox(height: 8),
            Text(
              "Ice Cream Sandwich Cookie is a delightful treat combining crunchy cookies with creamy ice cream.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 20),
            _buildSectionTitle("Ingredients"),
            SizedBox(height: 8),
            _buildIngredientsList(),
            SizedBox(height: 20),
            _buildWatchVideoButton(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildProductImageSection(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color.fromRGBO(240, 255, 240, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              "Most Popular Recipes",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imageUrl,
                width: 180,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("10 mins"),
                Text("Medium"),
                Text("350 kcal"),
              ],
            ),
            IconButton(
              icon: Icon(Icons.bookmark_border, color: Colors.green),
              onPressed: () {
                _showBookmarkDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.green,
      ),
    );
  }

  Widget _buildIngredientsList() {
    return Column(
      children: [
        _buildIngredientItem("Vanilla ice cream", "3 scoops"),
        _buildIngredientItem("Sugar", "1 cup"),
        _buildIngredientItem("Eggs", "2 large eggs"),
        _buildIngredientItem("Baking powder", "1 tsp"),
      ],
    );
  }

  Widget _buildIngredientItem(String name, String quantity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Text(name[0], style: TextStyle(color: Colors.green)),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ),
          Text(quantity, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildWatchVideoButton(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoScreen(videoUrl: videoUrl),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        ),
        icon: Icon(Icons.play_circle_outline, color: Colors.white),
        label: Text(
          "WATCH VIDEO",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
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
        if (index == 0) {
          // Navigasi ke halaman Home
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else if (index == 1) {
          // Navigasi ke halaman Upload
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UploadScreen()),
          );
        } else if (index == 2) {
          // Navigasi ke halaman Bookmark
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookmarkScreen()),
          );
        } else if (index == 3) {
          // Navigasi ke halaman Profile
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        }
      },
    );
  }

  void _showBookmarkDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Do you want to add to your bookmark?",
                  style: TextStyle(fontSize: 16, color: Colors.green),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildDialogButton(
                        context, "No", Colors.grey[300]!, Colors.green, false),
                    _buildDialogButton(
                        context, "Yes", Colors.green, Colors.white, true),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDialogButton(BuildContext context, String text, Color bgColor,
      Color textColor, bool isBookmarkAction) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
        if (isBookmarkAction) {
          // Handle bookmark action here
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(text, style: TextStyle(color: textColor)),
    );
  }
}

class VideoScreen extends StatelessWidget {
  final String videoUrl;

  VideoScreen({required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    if (videoId == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Invalid Video"),
        ),
        body: Center(
          child: Text(
            "Invalid YouTube URL",
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Watch Video"),
        backgroundColor: Colors.green,
      ),
      body: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: videoId,
          flags: YoutubePlayerFlags(autoPlay: true),
        ),
        showVideoProgressIndicator: true,
      ),
    );
  }
}
