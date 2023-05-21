import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RecentClass extends StatefulWidget {
  const RecentClass({Key? key}) : super(key: key);

  @override
  RecentClassState createState() => RecentClassState();
}

class RecentClassState extends State<RecentClass> {
  late List<String> _videoIds;
  late List<YoutubePlayerController> _controllers;

  @override
  void initState() {
    super.initState();
    _loadVideos();
  }

  Future<void> _loadVideos() async {
    // Replace with your own list of video ids
    _videoIds = [
      'EN4fEbcFZ_E',
      'M988_fsOSWo',
      'EN4fEbcFZ_E',
      'EN4fEbcFZ_E',
      'EN4fEbcFZ_E',
      'Ff0yYHzeZlQ',
      'lQf8WJI1D0I',
      'PxcyM3zh0Ak',
      '2tYRDTfI5jI',
      'yjsdJhv7VnM',
      '7MwWVkFY8YU',
      'vj_uZD7ndro',
      'ScVEVaG-C1k',
      'NSGK-_J_Uk8',
      'K2v113l5R5k',
      'j_RuXrVrblw',
      'dzLx4-i4p4A',
      '4eSwN3qsfG4',
      '9KjQoUfA6oQ',
      'BzTJwv1GEPs',
      'SwsKHOGWtO8',
      'vDjU6yfU6DE',
      'kjTlvwuzwAg',
      'JPlKsZsE9yw',
      '-nGmdR04HzM',
      'z12LR4udYD4',
      'ELO3qWOtpCE',
      '2fGM2awtMBg',
      'QeYcNFDI7Qw',
      'KD5PrJbelx0',
      '7rB5JHm1HBA',
      'lW8uXP-aBdQ',
      '2oQndGd8XvA',
      '0yLj2S2GgSY',
      'Qh4aVQ_d4I0',
      'XJ6T8T6tw-0',
      'jzH-ZlsCXxU',
      'vkhpRxVS49M',
      'rMllQNAysmY',
      'aLXmXvSvzbc',
      '6NRwz1EtFXg',
      'whAKSt2ZCJM',
      'lX9I9P4-KKs',
    ];

    _controllers = _videoIds.map((id) {
      return YoutubePlayerController(
        initialVideoId: id,
        flags: const YoutubePlayerFlags(
          // hideThumbnail: true,
          controlsVisibleAtStart: true,
          showLiveFullscreenButton: true,
          autoPlay: false,
          mute: false,
        ),
      );
    }).toList();

    setState(() {});
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Recent Class', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: const BackButton(color: Colors.green),
      ),
      body: _videoIds != null
          ? ListView.builder(
              itemCount: _videoIds.length,
              itemBuilder: (context, index) {
                final controller = _controllers[index];
                final videoId = _videoIds[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      YoutubePlayer(
                        showVideoProgressIndicator: false,
                        controller: controller,
                        liveUIColor: Colors.amber,
                        onReady: () {
                          print('Player is ready.');
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 10),
                        child: Row(
                          children: [
                            const Text("how to build plain interfaces"),
                            SizedBox(width: size.width * 0.13),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.message,
                                    color: Colors.green)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.share,
                                    color: Colors.green)),
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
                    ],
                  ),
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
