  
import 'package:flutter/material.dart';
import 'package:off_top_mobile/routing/router.dart' as router;
import 'package:off_top_mobile/routing/routing_constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.generateRoute,
      title: 'Login Page',
      initialRoute: LoginRoute,
    );
  }
}