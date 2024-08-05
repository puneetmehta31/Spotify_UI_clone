import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/song_model.dart';

class SongCard extends StatelessWidget {
  const SongCard({
    super.key,
    required this.song,
  });

  final Song song;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/song', arguments: song);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 7.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border:
                      Border.all(color: Colors.lightBlue.shade100, width: 2),
                  image: DecorationImage(
                    opacity: 0.8,
                    image: AssetImage(
                      song.coverUrl,
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.50,
              margin: const EdgeInsets.only(bottom: 0.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.lightBlue.shade100.withOpacity(0.9),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Text(
                          song.title,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Text(
                        song.description,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  Icon(Icons.play_circle_outline, color: Colors.lightBlue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
