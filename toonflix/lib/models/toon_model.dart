class ToonModel {
  final String title, thumb, id;

  ToonModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        thumb = json["thumb"],
        id = json["id"];
}

// [
//   {
//     "id":"712362",
//     "title":"개를 낳았다",
//     "thumb":"https://image-comic.pstatic.net/webtoon/712362/thumbnail/thumbnail_IMAG21_7220173143199539507.jpg"
//   },
//   {
//     "id":"790713",
//     "title":"대학원 탈출일지",
//     "thumb":"https://image-comic.pstatic.net/webtoon/790713/thumbnail/thumbnail_IMAG21_3919364435331003700.jpg"
//   }
// ]