import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getData('BTC', selectedCurrency);
          getData('ETH', selectedCurrency);
          getData('LTC', selectedCurrency);
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency=currenciesList[selectedIndex];
          getData('BTC', selectedCurrency);
          getData('ETH', selectedCurrency);
          getData('LTC', selectedCurrency);

        });
      },
      children: pickerItems,
    );
  }

  String bitcoinValue = '?';
  String ethValue='?';
  String ltcValue='?';

  //11. Create an async method here await the coin data from coin_data.dart
  void getData(String crypto,String currencie) async {
    try {
      double data = await CoinData().getCoinData(crypto,currencie);
      setState(() {
        if(crypto=='BTC')
          bitcoinValue = data.toStringAsFixed(0);
        else if(crypto=='ETH')
          ethValue=data.toStringAsFixed(0);
        else if(crypto=='LTC')
          ltcValue=data.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData('BTC', selectedCurrency);
    getData('ETH', selectedCurrency);
    getData('LTC', selectedCurrency);
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
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CardWidget(crypto:'BTC',bitcoinValue: bitcoinValue, selectedCurrency: selectedCurrency),
                CardWidget(crypto:'ETH',bitcoinValue: ethValue, selectedCurrency: selectedCurrency),
                CardWidget(crypto:'LTC',bitcoinValue: ltcValue, selectedCurrency: selectedCurrency),
              ],
            ),
          ),


          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key key,
    @required this.crypto,
    @required this.bitcoinValue,
    @required this.selectedCurrency,
  }) : super(key: key);

  final String crypto;
  final String bitcoinValue;
  final String selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $crypto = $bitcoinValue $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
