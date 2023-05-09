class DetailModel {
  final String title, about, genre, age;

  DetailModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        about = json["about"],
        genre = json["genre"],
        age = json["age"];
}

// {
//   "title":"개를 낳았다",
//   "about":"사랑스러운 너와의 첫 만남부터 이별까지. 처음으로 반려견을 키우게 된 다나와 모든것이 처음인 강아지 명동이가 만나 함께 살아가는 이야기. 강아지 수명 20년. 너와 내가 함께하는 20년 동안 우린 어떤 일을 겪게 될까?",
//   "genre":"스토리, 드라마",
//   "age":"전체연령가",
//   "thumb":"https://shared-comic.pstatic.net/thumb/webtoon/712362/thumbnail/thumbnail_IMAG06_05bdce8c-61e1-4446-9052-5cf216b76670.jpg"
// }
