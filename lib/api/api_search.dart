import 'dart:convert';

import 'package:appchat/api/api.dart';
import 'package:appchat/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiSearch extends api {
  Future<List<userModel>> getAllUserSearch() async {
    final response =
        await http.get(Uri.parse('${super.ipServer}user/search?id=2'));
    final responseStatus = await http
        .get(Uri.parse('${super.ipServer}user/getrelateshipfriends?id=2'));
    if (response.statusCode == 200) {
      // Xử lý dữ liệu trả về
      final data = response.body;
      final dataStatus = responseStatus.body;
      final Iterable listUser = json.decode(data);
      final Iterable listUserStatus = json.decode(dataStatus);
      return listUser.map((map) {
        var temp = listUserStatus.firstWhere((element) =>element['id_friend'] == map['uid'], orElse: () => null );
        String idfriend = temp != null ? temp['id_friend'].toString() : "";
        int friends = temp != null ? temp['friends'] : 3;
        return userModel(
            uid: map['uid'],
            username: map['username'],
            idimg: map['idimg'] ?? "",
            date: map['date'] ?? "",
            status: map['status'],
            email: map['email'],
            uuid: map['uuid'] ?? "",
            idfriend: idfriend,
            friendsStatus: friends
            );
      }).toList() as List<userModel>;
    } else {
      print('Lỗi khi lấy dữ liệu: ${response.statusCode}');
    }
    return [];
  }
  // Future<List<userModel>> findStatusFriends() async {
  //   final response = await http.get(Uri.parse('${super.ipServer}user/getrelateshipfriends?id=2'));

  //   if (response.statusCode == 200) {
  //     // Xử lý dữ liệu trả về
  //     final data = response.body;
  //     final Iterable listUser = json.decode(data);
  //     print(data);
  //     return listUser
  //         .map(
  //           (e) => userModel.fromJson(e),
  //         )
  //         .toList() as List<userModel>;
  //   } else {
  //     print('Lỗi khi lấy dữ liệu: ${response.statusCode}');
  //   }
  //   return [];
  // }
}

ApiSearch apiSearch = ApiSearch();
