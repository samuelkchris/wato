import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wato/recent_class.dart';

import 'Assignments/assignments.dart';
import 'analytics/analytics.dart';
import 'firebase_options.dart';
import 'groupdiscussion/discusion.dart';
import 'learn/learn_screen.dart';
import 'login/login_Page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wato',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoginPage(),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const LoginPage());
          case '/Assignments':
            return MaterialPageRoute(builder: (_) => const Assignments());
          case '/AnalyticsScreen':
            return MaterialPageRoute(builder: (_) => const AnalyticsScreen());
          case '/GroupDiscussionScreen':
            return MaterialPageRoute(
                builder: (_) => const GroupDiscussionScreen());
          case '/RecentClass':
            return MaterialPageRoute(builder: (_) => const RecentClass());
          case '/LearnScreen':
            return MaterialPageRoute(builder: (_) => const LearnScreen());

          // add more routes here
          default:
            return null;
        }
      },
    );
  }
}
