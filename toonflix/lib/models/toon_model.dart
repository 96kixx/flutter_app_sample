class ToonModel {
  final String title, thumb, id;

  ToonModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        thumb = json["thumb"],
        id = json["id"];
}
