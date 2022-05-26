import 'dart:convert';
import 'dart:core';

List<Message> ModelAPIFromJson(String str) =>
    List<Message>.from(json.decode(str).map((x) => ModelAPI.fromJson(x)));

String ModelAPIToJson(List<Message> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelAPI {
  List<Message>? message;

  ModelAPI({this.message});

  ModelAPI.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      message = <Message>[];
      json['message'].forEach((v) {
        message!.add(new Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  String? userName;
  List<Balance>? balance;
  String? timestamp;

  Message({this.userName, this.balance, this.timestamp});

  Message.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    if (json['balance'] != null) {
      balance = <Balance>[];
      json['balance'].forEach((v) {
        balance!.add(new Balance.fromJson(v));
      });
    }
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    if (this.balance != null) {
      data['balance'] = this.balance!.map((v) => v.toJson()).toList();
    }
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Balance {
  String? symbol;
  String? exchangeName;
  String? exchangeType;
  double? balance;
  int? bidPrice;
  BalancePromise? balancePromise;

  Balance(
      {this.symbol,
      this.exchangeName,
      this.exchangeType,
      this.balance,
      this.bidPrice,
      this.balancePromise});

  Balance.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    exchangeName = json['exchangeName'];
    exchangeType = json['exchangeType'];
    balance = double.tryParse(['balance'].toString());
    bidPrice = json['bidPrice'];
    balancePromise = json['balancePromise'] != null
        ? new BalancePromise.fromJson(json['balancePromise'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['exchangeName'] = this.exchangeName;
    data['exchangeType'] = this.exchangeType;
    data['balance'] = this.balance;
    data['bidPrice'] = this.bidPrice;
    if (this.balancePromise != null) {
      data['balancePromise'] = this.balancePromise!.toJson();
    }
    return data;
  }
}

class BalancePromise {
  double? balance;
  int? bidPrice;

  BalancePromise({this.balance, this.bidPrice});

  BalancePromise.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
    bidPrice = json['bidPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['balance'] = this.balance;
    data['bidPrice'] = this.bidPrice;
    return data;
  }
}
