import 'package:fitpage_challenge/pages/criteria_page.dart';
import 'package:fitpage_challenge/services/criteria_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CriteriaDataProvider()),
      ],
      child: MaterialApp(
        title: 'Stock Scan Parser',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Times",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CriteriaPage(),
      ),
    );
  }
}
