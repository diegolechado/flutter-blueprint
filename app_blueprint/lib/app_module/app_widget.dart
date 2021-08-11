import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'BlueprintApp',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: Color(0xFFA661F6)
            )
        ).modular();
    }
}