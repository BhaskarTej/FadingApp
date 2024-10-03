import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FadingTextAnimation(),
    );
  }
}
class FadingTextAnimation extends StatefulWidget {
  @override
  _FadingTextAnimationState createState() => _FadingTextAnimationState();
}

class _FadingTextAnimationState extends State<FadingTextAnimation> {
  bool _isVisible = true;
  bool _showFrame = false;

  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fading Text Animation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: toggleVisibility,
              child: AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut, // Adding a smooth curve to the animation
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: _showFrame
                        ? Border.all(color: Colors.blue, width: 2)
                        : null, // Toggle frame visibility based on _showFrame
                  ),
                  child: const Text(
                    'Hello, Flutter!',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
SizedBox(height: 20),
          // Adding a Switch to toggle frame visibility
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Show Frame'),
              Switch(
                value: _showFrame,
                onChanged: (value) {
                  setState(() {
                    _showFrame = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleVisibility,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}