class EpisodeModel {
  final String id, title, rating, date;

  EpisodeModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        rating = json["rating"],
        date = json["date"];
}

// [
//   {
//     "thumb":"https://image-comic.pstatic.net/webtoon/712362/220/thumbnail_202x120_5402fb47-0e40-4a7f-ab23-c112b783d869.jpg",
//     "id":"219",
//     "title":"시즌2 146화",
//     "rating":"9.96",
//     "date":"23.05.04"
//   },
//   {
//     "thumb":"https://image-comic.pstatic.net/webtoon/712362/219/thumbnail_202x120_a2b287ca-b277-411d-9e66-8432b2ce19db.jpg",
//     "id":"218",
//     "title":"시즌2 145화",
//     "rating":"9.98",
//     "date":"23.04.27"
//   },
// ]