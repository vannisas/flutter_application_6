import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: HomeScreen()));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Navigator.push returns a Future that completes after calling
  // Navigator.pop on the Selection Screen.
  Future<void> _navigateToNextPage(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectionScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Virtual Pet'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _navigateToNextPage(context);
          },
          child: const Text("Start!"),
        ),
      ),
    );
  }
}

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        title: const Text('Virtual Pet'),
      ),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'images/neutral.jpg',
              width: 400,
              height: 400,
              fit: BoxFit.cover,
            ),
          ),
          _buildPositionedImage('images/food_bowl.jpg', 160, 160, 50, 50, Alignment.bottomRight),
          _buildPositionedImage('images/ball.jpg', 80, 80, 20, 0, Alignment.bottomCenter),
          _buildPositionedImage('images/bed.jpg', 350, 350, 100, 0, Alignment.centerLeft),
        ],
      ),
    );
  }

  Widget _buildPositionedImage(String imagePath, double width, double height, double topPadding, double leftPadding, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: EdgeInsets.only(
          top: topPadding, 
          left: leftPadding, 
        ),
        child: Image.asset(
          imagePath,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
