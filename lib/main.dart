import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_mine/providers/journey_provider.dart';
import 'package:ride_mine/providers/ride_provider.dart';
import 'package:ride_mine/providers/user_provider.dart';
import 'package:ride_mine/screens/map_when_active_ride_screen.dart';
import 'package:ride_mine/screens/home_screen.dart';
import 'package:ride_mine/screens/map_screen.dart';
import 'package:ride_mine/screens/profile_screen.dart';
import 'package:ride_mine/screens/register_screen.dart';
import 'package:ride_mine/screens/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        debugShowCheckedModeBanner: false,
        initialRoute: '/signin',
        routes: {
          '/home': (context) => HomeScreen(),
          '/register': (context) => RegisterScreen(),
          '/signin': (context) => SignInScreen(),
          '/map': (context) => MapScreen(),
          '/activeRide': (context) => MapWhenActiveRideScreen(),
          '/profile': (context) => ProfileScreen(),
        },
      ),
    );
  }
}
