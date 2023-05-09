class UserModel {
  UserModel({
    required this.image,
    required this.displayName,
    required this.about,
    required this.createdAt,
    required this.lastActive,
    required this.id,
    required this.isOnline,
    required this.email,
    required this.pushToken,
  });
  late final String image;
  late final String displayName;
  late final String about;
  late final String createdAt;
  late final String lastActive;
  late final String id;
  late final bool isOnline;
  late final String email;
  late final String pushToken;

  UserModel.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? "";
    displayName = json['displayName'] ?? "";
    about = json['about'] ?? "";
    createdAt = json['created_at'] ?? "";
    lastActive = json['last_active'] ?? "";
    id = json['id'] ?? "";
    isOnline = json['is_online'] ?? "";
    email = json['email'] ?? "";
    pushToken = json['push_token'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['displayName'] = displayName;
    data['about'] = about;
    data['created_at'] = createdAt;
    data['last_active'] = lastActive;
    data['id'] = id;
    data['is_online'] = isOnline;
    data['email'] = email;
    data['push_token'] = pushToken;
    return data;
  }
}
