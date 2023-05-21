import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GroupDiscussionScreen extends StatefulWidget {
  const GroupDiscussionScreen({super.key});

  @override
  _GroupDiscussionScreenState createState() => _GroupDiscussionScreenState();
}

class _GroupDiscussionScreenState extends State<GroupDiscussionScreen> {
  final TextEditingController _messageController = TextEditingController();
  late DatabaseReference _messagesRef;
  late Stream _messagesStream;
  final userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    super.initState();
    _messagesRef = FirebaseDatabase.instance.ref().child('messages');
    _messagesStream = _messagesRef.orderByChild('timestamp').onValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Discussion'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _messagesStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData ||
                    snapshot.data!.snapshot.value == null) {
                  return const Center(child: CircularProgressIndicator());
                }

                final Map<dynamic, dynamic> messages =
                    snapshot.data!.snapshot.value;
                final List<dynamic> messageList =
                    messages.values.toList().reversed.toList();

                return ListView.builder(
                  itemCount: messageList.length,
                  itemBuilder: (context, index) {
                    print(messageList[index]['text']);
                    return ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text(messageList[index]['text']),
                        subtitle: Text(messageList[index]['userName']),
                        trailing: Text(
                          DateTime.fromMillisecondsSinceEpoch(
                                  messageList[index]['timestamp'])
                              .toString(),
                        ));
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Message',
                    ),
                    controller: _messageController,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final username = await getUsername(userId);
                    _messagesRef.push().set({
                      'text': _messageController.text,
                      'timestamp': ServerValue.timestamp,
                      'userName': username,
                    });
                    _messageController.clear();
                  },
                  child: const Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> getUsername(String userId) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      return snapshot.get('name');
    } catch (e) {
      if (kDebugMode) {
        print('Error getting username: $e');
      }
      return null;
    }
  }
}
