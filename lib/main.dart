import 'package:flutter/material.dart';


import 'package:ny_testing/view_models/articles_view_model.dart';
import 'package:ny_testing/views/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ArticlesViewModel()),
      ],
      child: const MaterialApp(
        title: 'Most Popular Articles',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
