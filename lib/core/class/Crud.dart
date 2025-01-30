// ignore_for_file: file_names, avoid_print

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/statusReqest.dart';
import 'package:e_commerce/core/functions/checkint.dart';
// import 'package:e_commerce/core/functions/checkint.dart';
import 'package:http/http.dart' as http;

class Crud {
  Map<String, String> headers = {
    'Content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };
  Future<Either<StatusReqests, Map>> postdata(String url, Map data) async {
    try {
      // if (await checkinternet()) {
      var response = await http.post(
        Uri.parse(url),
        body: data,
      );

      print("=============aaaaa=====${response.statusCode}");
      if (response.statusCode == 200) {
        // print("==============================${response.body}");
        var responsebody = jsonDecode(response.body);
        return right(responsebody);
      } else {
        //  print("${response.statusCode} 000000000000000000000000k");
        return left(StatusReqests.serverfailure);
      }
      // } else {
      // return left(StatusReqests.offlinefailure);
      // }
    } catch (e) {
      print(e);
      return left(StatusReqests.serverfailure);
    }
  }
}
