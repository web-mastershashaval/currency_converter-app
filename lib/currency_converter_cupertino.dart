import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CurrencyConverterCupertino extends StatefulWidget {
  const CurrencyConverterCupertino({super.key});

  @override
  State<CurrencyConverterCupertino> createState() => _CurrencyConverterCupertinoState();
}

class _CurrencyConverterCupertinoState extends State<CurrencyConverterCupertino> {
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
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Currency Converter',
          style: TextStyle(color: CupertinoColors.white),
        ),
        backgroundColor: CupertinoColors.systemGreen,
      ),
      backgroundColor: CupertinoColors.systemGreen,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ksh ${result.toStringAsFixed(2)}', // Formats result to 2 decimal places
              style: const TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.white,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(color: CupertinoColors.black),
                placeholder: 'Please enter the amount in Ksh',
                keyboardType: TextInputType.number,
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: CupertinoColors.black, width: 2.0),
                ),
                prefix: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(CupertinoIcons.money_dollar_circle),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CupertinoButton.filled(
              onPressed: convertCurrency, // Calls function on click
              child: const Text('Convert'),
            ),
          ],
        ),
      ),
    );
  }
}
