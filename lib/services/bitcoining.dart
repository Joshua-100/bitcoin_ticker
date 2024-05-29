import 'networking.dart';
import 'package:bitcoin_ticker/constants/apiKey.dart';

const coinAPIUrl = 'https://rest.coinapi.io/v1/exchangerate';

class Bitcoining {
  Bitcoining({required this.currencyCrypto});

  final String currencyCrypto;

  Future<dynamic> getCurrencyCrypto() async {
    NetworkHelper networkHelper =
    await NetworkHelper(url: '$coinAPIUrl/BTC,ETH,LTC/$currencyCrypto?apikey=$API_Key');

    var bitcoinData = networkHelper.getData();
    return bitcoinData;

  }
}


