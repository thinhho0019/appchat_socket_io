class userModel {
  final int uid;
  final String username;
  final String idimg;
  final String date;
  final int status;
  final String email;
  final String uuid;
  final String idfriend;
  final int friendsStatus;
  userModel(
      {required this.uid,
      required this.username,
      required this.idimg,
      required this.date,
      required this.status,
      required this.email,
      required this.uuid,
      required this.idfriend,
      required this.friendsStatus});
  factory userModel.fromJson(Map<String, dynamic> map) {
    return userModel(
        uid: map['uid'],
        username: map['username'],
        idimg: map['idimg'] ?? "",
        date: map['date'] ?? "",
        status: map['status'],
        email: map['email'],
        uuid: map['uuid'] ?? "",
        idfriend: map['id_friend']??"",
        friendsStatus: map['friendsStatus'] ?? 3
        );
  }
}
