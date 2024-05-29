import 'package:flutter/material.dart';

class BitcoinCard extends StatelessWidget {
  const BitcoinCard(
      {required this.crypto,
      required this.countryCrypto,
      required this.countryCryptoValue});

  final String countryCrypto;
  final String crypto;
  final double countryCryptoValue;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $crypto = $countryCryptoValue $countryCrypto',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
