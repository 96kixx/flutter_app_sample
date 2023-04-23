class UserModel {
  final String username, uid, profileImageUrl, phoneNumber;
  final int lastSeen;
  final bool active;
  final List<String> groupId;

  UserModel({
    required this.username,
    required this.uid,
    required this.profileImageUrl,
    required this.phoneNumber,
    required this.active,
    required this.lastSeen,
    required this.groupId,
  });

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "uid": uid,
      "profileImageUrl": profileImageUrl,
      "active": active,
      "lastSeen": lastSeen,
      "phoneNumber": phoneNumber,
      "groupId": groupId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map["username"] ?? "",
      uid: map["uid"] ?? "",
      profileImageUrl: map["profileImageUrl"] ?? "",
      phoneNumber: map["phoneNumber"] ?? "",
      active: map["active"] ?? false,
      lastSeen: map["lastSeen"] ?? 0,
      groupId: List<String>.from(map["groupId"]),
    );
  }
}
