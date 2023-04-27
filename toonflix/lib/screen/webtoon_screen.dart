import 'package:flutter/material.dart';
import 'package:toonflix/models/detail_model.dart';
import 'package:toonflix/models/episode_model.dart';
import 'package:toonflix/services/api_service.dart';

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

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getEpisodeById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      body: Column(
        children: [
          const SizedBox(height: 50),
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
                return Text(
                  snapshot.data!.age,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                );
              }
              return const Text("...");
            },
          ),
        ],
      ),
    );
  }
}
