import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverterMaterial extends StatefulWidget {
  const CurrencyConverterMaterial({super.key});

  @override
  State<CurrencyConverterMaterial> createState() => _CurrencyConverterMaterialState();
}

class _CurrencyConverterMaterialState extends State<CurrencyConverterMaterial> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convertCurrency() {
    if (textEditingController.text.isNotEmpty) {
      try {
        double inputAmount = double.parse(textEditingController.text);
        setState(() {
          result = inputAmount * 130; // Conversion rate
        });
      } catch (e) {
        if (kDebugMode) {
          print('Invalid input: ${textEditingController.text}');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text(
          'Currency Converter',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            Text(
              'Ksh ${result.toStringAsFixed(2)}', // Formats result to 2 decimal places
              style: const TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Please enter the amount in dollars',
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.monetization_on),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: convertCurrency, // Calls function on click
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                minimumSize: MaterialStateProperty.all(
                  const Size(double.infinity, 50),
                ),
              ),
              child: const Text('Convert'),
            ),
          ],
        ),
      ),
    );
  }
}
