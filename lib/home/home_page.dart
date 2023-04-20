import "package:flutter/material.dart";
import 'package:wato/home/custom_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Option> options = [
    const Option(icon: Icons.note_alt_sharp, name: 'Class'),
    const Option(icon: Icons.video_collection_outlined, name: 'Recent Class'),
    const Option(icon: Icons.group, name: 'Group Discussion'),
    const Option(icon: Icons.school_rounded, name: 'Progress Tracker'),
    const Option(
        icon: Icons.sticky_note_2_sharp, name: 'Past Papers Solutions'),
    const Option(icon: Icons.featured_play_list_outlined, name: 'Assignments'),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.green,
        body: SafeArea(
            child: Column(children: [
          Container(
              width: size.width,
              height: size.height * 0.2,
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: Column(children: [
                ListTile(
                  leading: IconButton(
                    iconSize: 30,
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  trailing: IconButton(
                    iconSize: 30,
                    icon: const Icon(Icons.notifications),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
                const Center(
                  child: Text("Explore",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                )
              ])),
          Expanded(
            flex: 1,
            child: Container(
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                child: GridView.count(
                  padding: const EdgeInsets.all(30),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2, // Two columns
                  children: options.map((option) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            option.icon,
                            color: Colors.white,
                            size: 60,
                          ),
                          Text(
                            option.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                )),
          )
        ])));
  }
}
