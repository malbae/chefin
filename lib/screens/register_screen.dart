import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Validate inputs
  bool _validateInputs() {
    if (_emailController.text.isEmpty) {
      _showErrorDialog("Email cannot be empty");
      return false;
    }
    if (!_emailController.text.contains("@")) {
      _showErrorDialog("Please enter a valid email address");
      return false;
    }
    if (_passwordController.text.length < 8) {
      _showErrorDialog("Password must be at least 8 characters long");
      return false;
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      _showErrorDialog("Passwords do not match");
      return false;
    }
    return true;
  }

  // Show error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Registration Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  // Mock function to register user
  Future<void> _registerUser(String email, String password) async {
    // Replace with real registration logic (e.g., backend API call)
    await Future.delayed(Duration(seconds: 1));
    if (email == "existing@example.com") {
      _showErrorDialog("This email is already registered");
    } else {
      _showSuccessDialog();
    }
  }

  // Show success dialog
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Registration Successful"),
        content: Text("You have successfully registered!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // Navigate back to login
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),

              // Logo and Title
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.restaurant_menu,
                    color: Color.fromRGBO(54, 129, 74, 1),
                    size: 48,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'CHEFIN',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(54, 129, 74, 1),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),

              // Subtitle
              Text(
                'Eat before hungry!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 40),

              // Email Input Field
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your email address',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon:
                      Icon(Icons.email, color: Color.fromRGBO(54, 129, 74, 1)),
                  hintText: 'Email or username',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Password Input Field
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Create a password',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  prefixIcon:
                      Icon(Icons.lock, color: Color.fromRGBO(54, 129, 74, 1)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  hintText: 'min. 8 characters',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Confirm Password Input Field
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Confirm password',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                decoration: InputDecoration(
                  prefixIcon:
                      Icon(Icons.lock, color: Color.fromRGBO(54, 129, 74, 1)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                  hintText: 'min. 8 characters',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Continue Button
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_validateInputs()) {
                      _registerUser(
                        _emailController.text,
                        _passwordController.text,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(54, 129, 74, 1),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
