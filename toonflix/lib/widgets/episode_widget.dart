import 'package:flutter/material.dart';
import 'package:toonflix/models/episode_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Episode extends StatelessWidget {
  final String webtoonId;
  final EpisodeModel episode;

  const Episode({
    super.key,
    required this.webtoonId,
    required this.episode,
  });

  onButtonTap() async {
    await launchUrlString(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.green.shade400,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                episode.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
