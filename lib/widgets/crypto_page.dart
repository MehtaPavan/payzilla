import 'dart:convert';
import 'package:flutter/material.dart';
import '../coin_model.dart';
import '../currency_helper.dart';
import 'package:http/http.dart' as http;
import 'package:payzilla/detail_page.dart';

class Cryptopage extends StatefulWidget {
  const Cryptopage({Key? key}) : super(key: key);

  @override
  State<Cryptopage> createState() => _CryptopageState();
}

class _CryptopageState extends State<Cryptopage> {
  String urlListMarket =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=idr&order=market_cap_desc&per_page=100&page=1&sparkline=false';
  List<CoinModel> listCoin = [];
  late Future<List<CoinModel>> listCoinFuture;
  bool isFirstTimeDataAccess = true;

  Future<List<CoinModel>> getListCoins() async {
    final response = await http.get(Uri.parse(urlListMarket));
    if (response.statusCode == 200) {
      List result = json.decode(response.body);
      final data = result.map((json) => CoinModel.fromJson(json)).toList();
      return data;
    } else {
      return <CoinModel>[];
    }
  }

  @override
  void initState() {
    super.initState();
    listCoinFuture = getListCoins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Currency'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          width: double.infinity,
          child: FutureBuilder(
            future: listCoinFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (isFirstTimeDataAccess) {
                  listCoin = snapshot.data!;
                  isFirstTimeDataAccess = false;
                }

                return Column(
                  children: [
                    TextField(
                      onChanged: (query) {
                        List<CoinModel> searchResult =
                        snapshot.data!.where((coin) {
                          String name = coin.name!.toLowerCase();
                          bool isFound = name.contains(query);
                          return isFound;
                        }).toList();
                        setState(() {
                          listCoin = searchResult;
                        });
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Search coins',
                      ),
                    ),
                    SizedBox(height: 24),
                    Expanded(
                      child: listCoin.isEmpty
                          ? Center(
                        child: Text('No Coin Found'),
                      )
                          : ListView.separated(
                        itemCount: listCoin.length,
                        itemBuilder: (context, index) {
                          return _buildCoin(listCoin[index]);
                        },
                        separatorBuilder: (context, index) => Divider(),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Center(child: Text('Error Occurred'));
              }
            },
          ),
        ),
      ),
    );
  }

  Padding _buildCoin(CoinModel coin) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(coin: coin)));
        },
        leading: Image.network(
          coin.image ?? '',
          width: 50,
          height: 50,
        ),
        title: Text(coin.name ?? ''),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              CurrencyHelper.idr(coin.currentPrice!),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              '${coin.priceChangePercentage24h} %',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
