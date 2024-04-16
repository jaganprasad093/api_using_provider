import 'package:api_using_provider/controller/homescreebcontroller.dart';
import 'package:api_using_provider/view/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => homescreenController(),
        )
      ],
      child: MaterialApp(
        home: Homepage(),
      ),
    );
  }
}
