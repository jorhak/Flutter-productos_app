import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyBnR7bDcBboJO3vkzwJr_Vd01QtjppjzzY';

  // Si retornamos algo, es un error, si no, todo bien
  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };

    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      // Token hay que guardarlo en un lugar seguro
      // print(decodedResp);
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };

    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    // print(decodedResp);
    // return 'Error en el login';

    if (decodedResp.containsKey('idToken')) {
      // Token hay que guardarlo en un lugar seguro
      print(decodedResp);
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }
}
