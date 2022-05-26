import 'package:flutter/material.dart';
import 'package:testing_api/models/Message.dart';
import 'package:testing_api/models/User.dart';

import '../services/connectAPI.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User>? _userData = [];
  List<Map<String, dynamic>?> _messageData = [];
  String ex = '';
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    //getUserData();
    getMessageData();
  }

  void getUserData() async {
    _userData = await connectAPI_Request().fetchUser();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void getMessageData() async {
    _messageData = await connectAPI_Request().getMessageModels();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  connectAPI_Request connectAPI = connectAPI_Request();

  @override
  Widget build(BuildContext context) {
    //List<Balance>? listBalance;

    return Scaffold(
      appBar: AppBar(
        title: Text('API Models'),
      ),
      body: _messageData == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _messageData.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_messageData[index]!['userName'].toString()),
                          Text(_messageData[index]!['timestamp'].toString()),
                          // for (var i in _messageData[index]!['balance'])
                          //   Column(children: [
                          //     Text(_messageData[index]!['balance']
                          //             ['exchangeName']
                          //         .toString()),
                          //     Text(_messageData[index]!['balance']
                          //             ['exchangeType']
                          //         .toString()),
                          //     Text(_messageData[index]!['balance']['balance']
                          //         .toString()),
                          //   ]),

                          // ListView(
                          //   children: List.generate(_messageData[index]!['balance'].domains.length, (index1) {
                          //     return Container(
                          //       child: Text(_messageData[index]!['balance'][index1].),
                          //     );
                          //   }),),

                          // ListView(
                          //   children: List.generate(length, (index) => null),
                          // )

                          // Container(
                          //   child: SingleChildScrollView(
                          //     child: Row(children: []),
                          //     _messageData[index]!['balance'][index1]
                          //           ['exchangeName'],

                          //     ListTile(
                          //   title: _messageData[index]!['balance'][index1]
                          //       ['exchangeName'],
                          //   trailing: _messageData[index]!['balance']
                          //       [index1]['balance'],
                          // ),
                          //   ),
                          // ),
                          // Text(_messageData![index].userName.toString()),
                          // Text(_messageData![index].timestamp.toString()),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Text(_userData![index].email),
                          // Text(_userData![index].website),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  @override
  Widget _getListWidgets(List<Balance> yourList) {
    return Column(
        children:
            yourList.map((i) => Text(i.exchangeName.toString())).toList());
  }

  // dynamic get(String propertyName){
  //   var _mapRep =
  // }

  // Widget _showBalanceElement(int index){
  //   if(index >= _messageData.length)
  // }
}
