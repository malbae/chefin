import 'package:chefin/screens/bookmark.dart';
import 'package:chefin/screens/home_screen.dart';
import 'package:chefin/screens/upload_screen.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _selectedItem = 'My Recipes';
  String _hoveredItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.green[800],
            fontFamily: 'Coolvetica',
            fontSize: 24,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green[800]),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bar_chart, color: Colors.green[800]),
            onPressed: () {
              // Navigate to Stats Page
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.green[800]),
            onPressed: () {
              // Navigate to Settings Page
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.green[800]),
            onPressed: () {
              // Show more options
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildProfileHeader(),
            SizedBox(height: 20),
            _buildStatsRow(),
            SizedBox(height: 20),
            _buildUserDescription(),
            SizedBox(height: 20),
            _buildSearchBar(),
            SizedBox(height: 20),
            _buildNavBar(),
            SizedBox(height: 20),
            _buildContent(),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.green[800],
          backgroundImage: NetworkImage(
              "https://globalmedianews.co.id/wp-content/uploads/2020/01/43d0897159987ef5d32291zcp-111851.jpg"),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo!',
              style: TextStyle(
                fontSize: 26,
                color: Colors.green[800],
                fontFamily: 'Coolvetica',
              ),
            ),
            Text(
              'Jokowi Dodo',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Coolvetica',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNavBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildNavBarItem('My Recipes'),
        _buildNavBarItem('Reviews'),
      ],
    );
  }

  Widget _buildNavBarItem(String title) {
    bool isHovered = _hoveredItem == title;
    bool isSelected = _selectedItem == title;

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredItem = title),
      onExit: (_) => setState(() => _hoveredItem = ''),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedItem = title;
              });
            },
            child: Text(
              title,
              style: TextStyle(
                color: Colors.green[800],
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Coolvetica',
              ),
            ),
          ),
          if (isHovered || isSelected)
            Container(
              height: 2,
              width: 70,
              color: Colors.green[800],
            ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_selectedItem == 'My Recipes') {
      return _buildMyRecipesSection();
    } else if (_selectedItem == 'Reviews') {
      return _buildReviewsSection();
    } else {
      return const SizedBox();
    }
  }

  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStatColumn('Recipes', '10'),
        SizedBox(width: 30),
        _buildStatColumn('Followers', '300'),
        SizedBox(width: 30),
        _buildStatColumn('Following', '15'),
      ],
    );
  }

  Column _buildStatColumn(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontFamily: 'Coolvetica',
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Coolvetica',
          ),
        ),
      ],
    );
  }

  Widget _buildUserDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        'I love cooking, follow me for more food recipes\n83 y.o, jokowi@gmail.com',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black54,
          fontFamily: 'Coolvetica',
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search recipes',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: Icon(Icons.search),
        filled: true,
        fillColor: Colors.white,
      ),
      style: TextStyle(fontFamily: 'Coolvetica'),
    );
  }

  Widget _buildMyRecipesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Recipes',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green[800],
            fontFamily: 'Coolvetica',
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: MediaQuery.of(context).size.height *
              0.5, // Dinamis berdasarkan tinggi layar
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: 4,
            itemBuilder: (context, index) => RecipeCard(
              title: 'Recipe ${index + 1}',
              subtitle: 'Delicious and easy to make!',
              imageUrl: 'assets/images/bananacake.jpg',
              rating: 4.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reviews',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green[800],
            fontFamily: 'Coolvetica',
          ),
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            RecipeCard(
              title: 'Banana Cake',
              subtitle: 'A visual and taste delight!',
              imageUrl: 'assets/images/bananacake.jpg',
              rating: 4.5,
            ),
            RecipeCard(
              title: 'Chocolate Milkshake',
              subtitle: 'Rich and moist.',
              imageUrl: 'assets/images/milkshake.jpg',
              rating: 5.0,
            ),
            RecipeCard(
              title: 'Ice Cream',
              subtitle: 'Absolutely delicious!',
              imageUrl: 'assets/images/icecream.jpg',
              rating: 4.0,
            ),
            RecipeCard(
              title: 'Avocado Milkshake',
              subtitle: 'Best homemade pie.',
              imageUrl: 'assets/images/avo.jpg',
              rating: 5.0,
            ),
          ],
        ),
      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 3, // Indeks untuk halaman Profile
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      ],
      selectedItemColor: const Color.fromRGBO(
          54, 129, 74, 1), // Warna hijau untuk yang dipilih
      unselectedItemColor:
          Colors.grey, // Warna abu-abu untuk yang tidak dipilih
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
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
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookmarkScreen()),
          );
        } else if (index == 3) {
          // Tetap di halaman Profile
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        }
      },
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final double rating;

  const RecipeCard({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.rating,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
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
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
