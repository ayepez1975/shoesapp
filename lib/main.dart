import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/helpers/connectivy.dart';
import 'package:shoesapp/src/pages/zapatos_page.dart';
import 'package:shoesapp/src/provider/zapatos_provider.dart';

void main() {
  return runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ZapatoProvider()),
    ChangeNotifierProvider(create: (_) => ConnectivyInternet()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoes APP',
      home: Scaffold(
        body: Center(
          child:
              // ZapatoDescPage(),
              ZapatosPage(),
        ),
      ),
    );
  }
}
