import 'package:flutter/material.dart';
import 'package:netflix_tmdb/data/data_controller.dart';

import 'main_card.dart';
import 'main_title.dart';

class TrendingMainTitleCard extends StatelessWidget {
  final String title;
  const TrendingMainTitleCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ContentController.instance.getTrending();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        LimitedBox(
            maxHeight: 180,
            child: ValueListenableBuilder(
                valueListenable: ContentController.instance.trendingNotifier,
                builder: (BuildContext ctx, List<dynamic> item, Widget? _) {
                  if (item.isNotEmpty) {
                   // print(item);
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        10,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 160,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      item[index]['poster_path']),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class TvMainTitleCard extends StatelessWidget {
  final String title;
  const TvMainTitleCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContentController.instance.getTvShows();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        LimitedBox(
            maxHeight: 180,
            child: ValueListenableBuilder(
                valueListenable: ContentController.instance.tvNotifier,
                builder: (BuildContext ctx, List<dynamic> item, Widget? _) {
                  //print('----------${item}');
                  if (item.isNotEmpty) {
                   // print(item);
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        10,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 160,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      item[index]['poster_path']),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class TvShowsMainTitleCard extends StatelessWidget {
  final String title;
  const TvShowsMainTitleCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ContentController.instance.getTrending();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        LimitedBox(
            maxHeight: 180,
            child: ValueListenableBuilder(
                valueListenable: ContentController.instance.trendingNotifier,
                builder: (BuildContext ctx, List<dynamic> item, Widget? _) {
                  if (item.isNotEmpty) {
                   // print(item);
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        10,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 160,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      item[index]['poster_path']),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class ThrillerMainTitleCard extends StatelessWidget {
  final String title;
  const ThrillerMainTitleCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ContentController.instance.getTrending();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        LimitedBox(
            maxHeight: 180,
            child: ValueListenableBuilder(
                valueListenable: ContentController.instance.popularNotifier,
                builder: (BuildContext ctx, List<dynamic> item, Widget? _) {
                  if (item.isNotEmpty) {
                   // print(item);
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        10,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 160,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      item[index]['poster_path']),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
