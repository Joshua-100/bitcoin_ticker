import 'dart:ffi';
import 'package:bitcoin_ticker/services/bitcoining.dart';
import 'package:bitcoin_ticker/utilities/bitcoin_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utilities/coin_data.dart';

const double _kItemExtent = 32.0;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currency = currenciesList.first;
  double cryptoBTCEqv = 0;
  double cryptoETHEqv = 0;
  double cryptoLTCEqv = 0;

  void updateUI(currentData) {
    print(currentData);
    // cryptoBTCEqv = currentData['rate'];
    // cryptoLTCEqv = currentData['rate'];
    // cryptoETHEqv = currentData['rate'];
    // print("$cryptoETHEqv  erjgdfjgdfg tyeeeeeee");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              children: [
                BitcoinCard(
                    crypto: "BTC",
                    countryCryptoValue: cryptoBTCEqv,
                    countryCrypto: currency),
                BitcoinCard(
                    crypto: "ETH",
                    countryCryptoValue: cryptoETHEqv,
                    countryCrypto: currency),
                BitcoinCard(
                    crypto: "LTC",
                    countryCryptoValue: cryptoLTCEqv,
                    countryCrypto: currency)
              ],
            ),
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: CupertinoPicker(
                itemExtent: _kItemExtent,
                onSelectedItemChanged: (int value) async {
                  currency = currenciesList[value];
                  // get Bitcoin Data
                  Bitcoining bitcoing = Bitcoining(currencyCrypto: currency);
                  var btcData = await bitcoing.getCurrencyCrypto();
                  setState(() {
                    // Call Update UI with bitcoin data
                    updateUI(btcData);
                  });
                },
                children:
                    List<Widget>.generate(currenciesList.length, (int index) {
                  return Center(child: Text(currenciesList[index]));
                }),
              )),
        ],
      ),
    );
  }
}

//
// DropdownButton<String>(
// value: currency,
// icon: const Icon(Icons.arrow_drop_down_sharp),
// elevation: 16,
// style: const TextStyle(color: Colors.white),
// underline: Container(
// height: 2,
// color: Colors.white,
// ),
// onChanged: (String? value) {
// // This is called when the user selects an item.
// setState(() {
// currency = value!;
// });
// },
// items:
// currenciesList.map<DropdownMenuItem<String>>((String value) {
// return DropdownMenuItem<String>(
// value: value,
// child: Text(value),
// );
// }).toList(),
// ),
