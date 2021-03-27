import 'dart:convert';
import 'package:http/http.dart' as http;
//Import DotEnv
//Import SharedPref

class User {
  Future<void> signIn(username, password) {
    //Get API URL from .env
    Map<String, String> headers = {
      "Content-Type": "application/x-www-form-urlencoded",
      "Content-type": "application/json",
    };
    http
        .post(
      'url', //edit url
      headers: headers,
      body: json.encode({
        'username': username,
        'password': password,
      }),
    )
        .then((response) async {
      //Code response
    });
    //return 0;
  }
}
