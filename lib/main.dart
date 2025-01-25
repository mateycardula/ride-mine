import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_mine/providers/journey_provider.dart';
import 'package:ride_mine/providers/ride_provider.dart';
import 'package:ride_mine/providers/user_provider.dart';
import 'package:ride_mine/screens/map_screen.dart';
import 'package:ride_mine/screens/register_screen.dart';
import 'package:ride_mine/screens/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => RideProvider()),
        ChangeNotifierProvider(create: (_) => JourneyProvider()),
      ],
      child: MaterialApp(
        title: 'Ride Mine',
        initialRoute: '/signin',
        routes: {
          '/register': (context) => RegisterScreen(),
          '/signin': (context) => SignInScreen(),
          '/map': (context) => MapScreen(),
        },
      ),
    );
  }
}
