import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({Key? key}) : super(key: key);

  @override
  LearnScreenState createState() => LearnScreenState();
}

class LearnScreenState extends State<LearnScreen>
    with SingleTickerProviderStateMixin {
  late YoutubePlayerController _controller;
  late TabController _tabController;
  bool isPlaying = false;
  final List<String> tabTitles = [
    'Description',
    'Participants',
    'Comments',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'M7lc1UVf-VE',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
    _tabController = TabController(length: tabTitles.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.green),
        backgroundColor: Colors.white,
        title: const Text('Class', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: size.width,
                height: size.height * 0.3,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isPlaying = !isPlaying;
                      if (isPlaying) {
                        _controller.play();
                      } else {
                        _controller.pause();
                      }
                    });
                  },
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.red,
                  ),
                ),
              ),
              const Positioned.fill(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'LIVE',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: Row(
              children: [
                const Text("how to build plain interfaces"),
                SizedBox(width: size.width * 0.16),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.message, color: Colors.green)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share, color: Colors.green)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(children: [
              for (var i = 0; i < 5; i++)
                const Icon(
                  Icons.star,
                  color: Colors.green,
                  size: 30,
                ),
            ]),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
                "In this video i will show you how to ,,,,, In this video i will show you how to ,,,,,In this video i will show you how to ,,,,,"),
          ),
          SizedBox(height: size.height * 0.02),
          TabBar(
            labelColor: Colors.black,
            controller: _tabController,
            tabs: [
              for (final title in tabTitles)
                Tab(
                  text: title,
                ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView(
                  children: const [
                    SizedBox(height: 8),
                    Text(
                      'Flutter Live is a live event where you can learn about Flutter and Dart programming.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                ListView(
                  children: [
                    for (var i = 0; i < 5; i++)
                      const ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                        ),
                        title: Text('Participant 1'),
                        subtitle: Text('This is a participant.'),
                        trailing: Icon(
                          Icons.online_prediction,
                          color: Colors.green,
                        ),
                      ),
                  ],
                ),
                ListView(
                  children: const [
                    ListTile(
                      title: Text('Comment 1'),
                      subtitle: Text('This is a comment.'),
                    ),
                    ListTile(
                      title: Text('Comment 2'),
                      subtitle: Text('This is another comment.'),
                    ),
                    ListTile(
                      title: Text('Comment 3'),
                      subtitle: Text('This is a third comment.'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }
}
