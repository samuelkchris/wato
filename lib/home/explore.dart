import 'package:flutter/material.dart';
import 'package:wato/learn/learn_screen.dart';
import 'package:wato/profile/profile_page.dart';
import 'package:wato/recent_class.dart';

import 'home_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  ExplorePageState createState() => ExplorePageState();
}

class ExplorePageState extends State<ExplorePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const ProfilePage(),
    const LearnScreen(),
    const RecentClass(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
          backgroundColor: Colors.green,
          body: IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
          bottomNavigationBar: Container(
            width: double.infinity,
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.green,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  backgroundColor: Colors.green,
                  icon: Icon(
                    Icons.home,
                    size: 30,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    size: 30,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.message,
                    size: 30,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calendar_today,
                    size: 30,
                  ),
                  label: '',
                ),
              ],
            ),
          )),
    );
  }
}
