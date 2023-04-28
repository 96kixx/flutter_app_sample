import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/models/detail_model.dart';
import 'package:toonflix/models/episode_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/episode_widget.dart';

class WebtoonScreen extends StatefulWidget {
  final String title, thumb, id;

  const WebtoonScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<WebtoonScreen> createState() => _WebtoonScreenState();
}

class _WebtoonScreenState extends State<WebtoonScreen> {
  late Future<DetailModel> webtoon;
  late Future<List<EpisodeModel>> episodes;
  late SharedPreferences prefs;
  bool isLiked = false;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final liked = prefs.getStringList("liked");
    if (liked != null) {
      if (liked.contains(widget.id) == true) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await prefs.setStringList("liked", []);
    }
  }

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getEpisodeById(widget.id);
    initPrefs();
  }

  onLiked() async {
    final liked = prefs.getStringList("liked");
    if (liked != null) {
      if (isLiked) {
        liked.remove(widget.id);
      } else {
        liked.add(widget.id);
      }
      await prefs.setStringList("liked", liked);
      setState(() {
        isLiked = !isLiked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: onLiked,
            icon: Icon(
              isLiked
                  ? Icons.favorite_outlined
                  : Icons.favorite_outline_outlined,
            ),
          )
        ],
        backgroundColor: Colors.green,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 50,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 15,
                              offset: const Offset(10, 15),
                              color: Colors.black.withOpacity(0.5),
                            )
                          ]),
                      clipBehavior: Clip.hardEdge,
                      width: 250,
                      child: Image.network(
                        widget.thumb,
                        headers: const {
                          "User-Agent":
                              "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${snapshot.data!.genre} / ${snapshot.data!.age}",
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    );
                  }
                  return const Text("...");
                },
              ),
              const SizedBox(height: 25),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          Episode(
                            episode: episode,
                            webtoonId: widget.id,
                          ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
