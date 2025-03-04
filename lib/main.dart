import 'package:currenct_converter/currency_converter_material.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
//1.material design by google
//cupertino design by ios
class MyApp extends StatelessWidget {
  const MyApp ({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurrencyConverterMaterial(),
    );
  }
}
