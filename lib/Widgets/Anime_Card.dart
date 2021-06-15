import 'package:flutter/material.dart';
import 'package:sam_frontend/Constant/Colors.dart';
import 'package:sam_frontend/Models/Anime_Model.dart';
import 'package:sam_frontend/Screens/Anime_Descripation.dart';
import 'package:sam_frontend/Widgets/Anime_Modal.dart';

class AnimeCard extends StatelessWidget {
  final bool topOrNot;
  final List<String> aired;
  final int episodes;
  final List<String> genres;
  final String imageUrl;
  final int malId;
  final int popularity;
  final int rank;
  final Related related;
  final double score;
  final String source;
  final String status;
  final String synopsis;
  final String title;
  final String type;
  const AnimeCard(
      {this.topOrNot = false,
      required this.malId,
      this.imageUrl = '',
      this.title = '',
      this.type = '',
      this.source = '',
      required this.episodes,
      required this.aired,
      this.score = -1.0,
      this.rank = -1,
      this.popularity = -1,
      this.synopsis = '',
      required this.related,
      required this.genres,
      required this.status});

  String _aired(aired) {
    String _start = aired[0];
    return _start.split(" ")[1];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        child: Card(
      color: kSecondaryColor,
      semanticContainer: true,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => AnimeDescripation(
                    topOrNot: topOrNot,
                    title: title,
                    malId: malId,
                    imageUrl: imageUrl,
                    type: type,
                    score: score,
                    episodes: episodes,
                    status: status,
                    source: source,
                    rank: rank,
                    popularity: popularity,
                    synopsis: synopsis,
                    aired: aired,
                    related: related,
                    genres: genres)),
          );
        },
        child: Column(
          children: [
            Container(
              height: size.height * 0.34,
              width: size.width * 0.475,
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(2, 4, 0, 0),
              child: Container(
                child: Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: size.width * 0.35,
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "${_aired(aired)} " + ' ($episodes)',
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(
                              width: size.width * 0.08,
                            ),
                            Text(
                              '$score',
                              style: TextStyle(fontSize: 12),
                            ),
                            Icon(
                              Icons.star_rate,
                              size: 12,
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              shape: BoxShape.circle,
                              // border: Border.all(width: 1.0, color: kPrimaryColor),
                            ),
                            child: IconButton(
                              onPressed: () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AnimeModal(name: title);
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(4.0),
        // ),
      ),
    ));
  }
}
