import 'dart:io'; // Import to detect platform
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'currency_converter_material.dart';
import 'currency_converter_cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS 
      ? const CupertinoApp(
          debugShowCheckedModeBanner: false,
          theme: CupertinoThemeData(
            primaryColor: CupertinoColors.systemGreen,
          ),
          home: CurrencyConverterCupertino(),
        ) 
      : MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: const CurrencyConverterMaterial(),
        );
  }
}
