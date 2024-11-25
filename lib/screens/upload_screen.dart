import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final ImagePicker _picker = ImagePicker();
  int _currentStep = 1;
  List<File?> ingredientImages = [null];
  File? coverPhoto;
  String? selectedDifficulty;

  final TextEditingController _foodNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _hhController = TextEditingController();
  final TextEditingController _mmController = TextEditingController();
  final TextEditingController _ssController = TextEditingController();
  final TextEditingController _caloriesController = TextEditingController();
  final TextEditingController _videoUrlController = TextEditingController();

  bool _isCoverPhotoEmpty = false;
  bool _isFoodNameEmpty = false;
  bool _isDescriptionEmpty = false;
  bool _isDurationEmpty = false;

  void _nextStep() {
    setState(() {
      _isCoverPhotoEmpty = coverPhoto == null;
      _isFoodNameEmpty = _foodNameController.text.isEmpty;
      _isDescriptionEmpty = _descriptionController.text.isEmpty;
      _isDurationEmpty = _hhController.text.isEmpty &&
          _mmController.text.isEmpty &&
          _ssController.text.isEmpty;

      if (!_isCoverPhotoEmpty &&
          !_isFoodNameEmpty &&
          !_isDescriptionEmpty &&
          !_isDurationEmpty) {
        _currentStep = 2;
      }
    });
  }

  void _previousStep() {
    setState(() {
      _currentStep = 1;
    });
  }

  void _addIngredientField() {
    setState(() {
      ingredientImages.add(null);
    });
  }

  Future<void> _pickCoverPhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        coverPhoto = File(pickedFile.path);
        _isCoverPhotoEmpty = false;
      });
    }
  }

  Future<void> _pickImage(int index) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        ingredientImages[index] = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Upload',
            style: TextStyle(
                color: Colors.grey[700], fontWeight: FontWeight.bold)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: _currentStep == 1 ? _buildStepOne() : _buildStepTwo(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        selectedItemColor: Color.fromRGBO(54, 129, 74, 1),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          if (index != 2) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  Widget _buildStepOne() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("1/2",
                style: TextStyle(
                    color: Color.fromRGBO(54, 129, 74, 1),
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Center(
              child: GestureDetector(
                onTap: _pickCoverPhoto,
                child: Container(
                  width: 200,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.grey),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: coverPhoto != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            coverPhoto!,
                            width: 200,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_photo_alternate,
                                size: 50, color: Colors.grey),
                            Text('Add Cover Photo',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold)),
                            Text('(up to 12 Mb)',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 10)),
                          ],
                        ),
                ),
              ),
            ),
            if (_isCoverPhotoEmpty)
              Text("Cover photo is required",
                  style: TextStyle(color: Colors.red)),
            SizedBox(height: 16),
            _buildInputField("Food Name", "Enter Food Name",
                _foodNameController, _isFoodNameEmpty),
            SizedBox(height: 16),
            _buildInputField("Description", "Tell a little about your food",
                _descriptionController, _isDescriptionEmpty,
                maxLines: 3),
            SizedBox(height: 16),
            Text("Cooking Duration",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(54, 129, 74, 1))),
            Row(
              children: [
                _buildDurationField('HH', _hhController),
                SizedBox(width: 8),
                _buildDurationField('MM', _mmController),
                SizedBox(width: 8),
                _buildDurationField('SS', _ssController),
              ],
            ),
            if (_isDurationEmpty)
              Text("At least one duration field is required",
                  style: TextStyle(color: Colors.red)),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _nextStep,
                child:
                    Text('Next', style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromRGBO(54, 129, 74, 1),
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepTwo() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("2/2",
                style: TextStyle(
                    color: Color.fromRGBO(54, 129, 74, 1),
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text("Difficulty",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(54, 129, 74, 1))),
            _buildDropdownField(),
            SizedBox(height: 16),
            _buildInputField("Calories (kcal)", "Enter the number of calories",
                _caloriesController, false),
            SizedBox(height: 16),
            Text("Ingredients",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(54, 129, 74, 1))),
            Column(
              children: List.generate(ingredientImages.length,
                  (index) => _buildIngredientField(index)),
            ),
            Center(
              child: TextButton.icon(
                icon: Icon(Icons.add, color: Colors.white),
                label: Text('Add More',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                onPressed: _addIngredientField,
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromRGBO(54, 129, 74, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            SizedBox(height: 16),
            _buildInputField(
                "Video", "Add URL of your video", _videoUrlController, false),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle upload
                },
                child: Text('UPLOAD',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromRGBO(54, 129, 74, 1),
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: _previousStep,
                child: Text("Back", style: TextStyle(color: Colors.grey)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(
      String label, String hint, TextEditingController controller, bool isEmpty,
      {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(54, 129, 74, 1))),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color.fromRGBO(54, 129, 74, 1)),
            ),
            errorText: isEmpty ? 'This field is required' : null,
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField() {
    return DropdownButtonFormField<String>(
      value: selectedDifficulty,
      items: ['Easy', 'Medium', 'Hard'].map((String difficulty) {
        return DropdownMenuItem<String>(
          value: difficulty,
          child: Text(difficulty),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedDifficulty = newValue;
        });
      },
      decoration: InputDecoration(
        hintText: 'Select difficulty level',
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color.fromRGBO(54, 129, 74, 1)),
        ),
      ),
      icon: Icon(Icons.arrow_drop_down, color: Color.fromRGBO(54, 129, 74, 1)),
      dropdownColor: Colors.white,
    );
  }

  Widget _buildIngredientField(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => _pickImage(index),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ingredientImages[index] != null
                  ? Image.file(ingredientImages[index]!,
                      width: 50, height: 50, fit: BoxFit.cover)
                  : Icon(Icons.add_photo_alternate,
                      color: Colors.grey, size: 30),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Description',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color.fromRGBO(54, 129, 74, 1)),
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Container(
            width: 60,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Qty',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color.fromRGBO(54, 129, 74, 1)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDurationField(String hint, TextEditingController controller) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(54, 129, 74, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: 4),
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
