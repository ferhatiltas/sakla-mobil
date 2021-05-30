import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  var responseBodyLength;
  var userPassword;
  var userNameAndSurname;
  var userEmail;
  int id = 0;

  Future bringUserInfoWithEmailSakla(var email) async {
    var response = await http.post(
        Uri.parse(
            'https://expers-68-market-back-end.herokuapp.com/api/v1/bringUserInfoWithEmailSakla/$email'),
        body: {
          'id': id.toString(),
          'name_surname	': 'id.toString()',
          'email': 'id.toString()',
          'password': 'widget.sessionID.toString()',
        });
    print(response.body);
    print(response.statusCode);
    responseBodyLength = response.body.length;
    if (response.body.toString().length > 2) {

      userPassword = jsonDecode(response.body)[0]['password'].toString();
      userNameAndSurname = jsonDecode(response.body)[0]['name_surname'].toString();
      userEmail = jsonDecode(response.body)[0]['email'].toString();

      print(jsonDecode(response.body)[0]['name_surname'].toString());
      print(jsonDecode(response.body)[0]['email'].toString());
      print(jsonDecode(response.body)[0]['password'].toString());
    }
  }

  Future createNewUserPost(var nameSurname, var email, var password) async {
    var response = await http.post(
        Uri.parse(
            'https://expers-68-market-back-end.herokuapp.com/api/v1/createNewUserSakla'),
        body: {
          'id': id.toString(),
          'name_surname': '$nameSurname',
          'email': '$email',
          'password': '$password',
        });
    print(response.body);
    print(response.statusCode);
  }
}
