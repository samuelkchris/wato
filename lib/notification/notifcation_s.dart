import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'New message',
      'description': 'You have a new message from John',
      'date': DateTime.now().subtract(const Duration(minutes: 5)),
      'imageUrl':
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    },
    {
      'title': 'New collection',
      'description': 'You have a new follower on your profile',
      'date': DateTime.now().subtract(const Duration(hours: 1)),
      'imageUrl':
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    },
    {
      'title': 'New live class',
      'description': 'Your post has been liked by Sarah',
      'date': DateTime.now().subtract(const Duration(days: 1)),
      'imageUrl':
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    },
    {
      'title': 'New message',
      'description': 'You have a new message from John',
      'date': DateTime.now().subtract(const Duration(days: 2)),
      'imageUrl':
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    },
    {
      'title': 'New live class',
      'description': 'You have a new follower on your profile',
      'date': DateTime.now().subtract(const Duration(days: 3)),
      'imageUrl':
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    },
    {
      'title': 'New tutorial',
      'description': 'Your post has been liked by Sarah',
      'date': DateTime.now().subtract(const Duration(days: 4)),
      'imageUrl':
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    },
    {
      'title': 'New message',
      'description': 'You have a new message from John',
      'date': DateTime.now().subtract(const Duration(days: 5)),
      'imageUrl':
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    },
    {
      'title': 'New class',
      'description': 'You have a new follower on your profile',
      'date': DateTime.now().subtract(const Duration(days: 6)),
      'imageUrl':
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    },
    {
      'title': 'New lecture',
      'description': 'Your post has been liked by Sarah',
      'date': DateTime.now().subtract(const Duration(days: 7)),
      'imageUrl':
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Notifications', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          final time = notification['date'] as DateTime;
          final formattedDate = _formatDate(notification['date']);
          return Column(
            children: [
              if (index == 0 ||
                  _isSameDay(notification['date'],
                          notifications[index - 1]['date']) ==
                      false)
                const SizedBox(height: 30),
              _buildDayDivider(formattedDate),
              ListTile(
                leading: CircleAvatar(
                  maxRadius: 50,
                  minRadius: 40,
                  backgroundImage:
                      NetworkImage(notification['imageUrl'] as String),
                ),
                title: Text(notification['title'] as String),
                subtitle: Text(notification['description'] as String),
                trailing: Text('${time.hour}:${time.minute}'),
              ),
            ],
          );
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else {
      return '${difference.inDays} days ago';
    }
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.day == date2.day &&
        date1.month == date2.month &&
        date1.year == date2.year;
  }

  Widget _buildDayDivider(String day) {
    final size = MediaQuery.of(context).size;
    return Container(
        color: Colors.green,
        width: size.width,
        height: size.height * 0.05,
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(day,
              //textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ));
  }
}
