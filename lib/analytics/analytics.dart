import 'package:flutter/material.dart';

import 'custom_Anima.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  AnalyticsScreenState createState() => AnalyticsScreenState();
}

class AnalyticsScreenState extends State<AnalyticsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final List<double> _percentages = [0.8, 0.6, 0.9, 0.7, 0.5, 0.4];
  final List<Color> _colors = [
    Colors.blue,
    Colors.orange,
    Colors.pink,
    Colors.green,
    Colors.purple,
    Colors.red,
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Stack(children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.green,
                      width: 3,
                    ),
                  ),
                  child: const CircleAvatar(
                    foregroundImage: AssetImage("assets/logo.jpg"),
                    maxRadius: 50,
                    minRadius: 40,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 143,
                child: Container(
                    alignment: Alignment.center,
                    height: size.height * 0.03,
                    width: size.width * 0.2,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const Text("Nison")),
              ),
            ]),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Text("Katerega Nicholas",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 16.0),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: AnimatedCircularProgress(
                      percentage: _percentages[0],
                      color: _colors[0],
                      animation: _animation,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: AnimatedCircularProgress(
                      percentage: _percentages[1],
                      color: _colors[1],
                      animation: _animation,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: AnimatedCircularProgress(
                      percentage: _percentages[2],
                      color: _colors[2],
                      animation: _animation,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: AnimatedCircularProgress(
                      percentage: _percentages[3],
                      color: _colors[3],
                      animation: _animation,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: AnimatedCircularProgress(
                      percentage: _percentages[4],
                      color: _colors[4],
                      animation: _animation,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: AnimatedCircularProgress(
                      percentage: _percentages[5],
                      color: _colors[5],
                      animation: _animation,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
