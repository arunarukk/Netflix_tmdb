import 'package:flutter/material.dart';
import 'package:netflix_tmdb/screens/screen_home.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/number_title_card.dart';

class ScreenNewAndHot extends StatelessWidget {
  ScreenNewAndHot({Key? key}) : super(key: key);
  final comingListkey = GlobalKey();
  final everyListkey = GlobalKey();
  final ScrollController comingScroll = ScrollController();
  final ScrollController everyScroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: AppBarWidget(
              title: 'New & Hot',
              icon: Icons.notifications,
            ),
            preferredSize: Size.fromHeight(50)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10.0,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Scrollable.ensureVisible(comingListkey.currentContext!);
                        //child:
                        //new Text("Scroll to data");
                        // comingScroll.animateTo(
                        //     comingScroll.position.maxScrollExtent,
                        //     duration: Duration(milliseconds: 500),
                        //     curve: Curves.fastOutSlowIn);
                      },
                      child: Container(
                        width: 130,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.movie,
                              color: Colors.black,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Coming Soon",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Scrollable.ensureVisible(everyListkey.currentContext!);
                        // everyScroll.animateTo(
                        //     everyScroll.position.minScrollExtent,
                        //     duration: Duration(milliseconds: 500),
                        //     curve: Curves.easeIn);
                      },
                      child: Container(
                        width: 180,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.fireplace,
                              color: Colors.black,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Everyone's Watching",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.ten_k_outlined,
                              color: Colors.black,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Top 10",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView(
                      key: comingListkey,
                      controller: comingScroll,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                          10,
                          (index) => ComingSoonWidget(
                                index: index,
                              )),
                    ),
                    ListView(
                      controller: everyScroll,
                      key: everyListkey,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(10, (index) => EveryOnesWidget()),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class ComingSoonWidget extends StatelessWidget {
  final int index;
  const ComingSoonWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${index + 1}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  decoration: TextDecoration.none,
                  color: Colors.white,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 180,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.blue
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://www.themoviedb.org/t/p/original/o76ZDm8PS9791XiuieNB93UZcRV.jpg'),
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    //color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('title image'),
                          // SizedBox(
                          //   width: 20,
                          // ),
                          NewButtonWidget(
                              title: 'Remind Me',
                              icon: Icons.notifications_none),

                          NewButtonWidget(
                              title: 'Info', icon: Icons.info_outline),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.amber,
                    height: 100,
                    width: 300,
                    //color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Season 5',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        Text(
                          'Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes.',
                          style: TextStyle(fontSize: 13),
                        ),
                        Text('Genre',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EveryOnesWidget extends StatelessWidget {
  const EveryOnesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   '${index + 1}',
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 30,
              //     decoration: TextDecoration.none,
              //     color: Colors.white,
              //   ),
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 180,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.blue
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://www.themoviedb.org/t/p/original/o76ZDm8PS9791XiuieNB93UZcRV.jpg'),
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    //color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('title image'),
                          // SizedBox(
                          //   width: 20,
                          // ),
                          NewButtonWidget(title: 'Share', icon: Icons.share),
                          NewButtonWidget(title: 'My List', icon: Icons.add),

                          NewButtonWidget(
                              title: 'Play', icon: Icons.play_arrow),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.amber,
                    height: 100,
                    width: 350,
                    //color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes.',
                          style: TextStyle(fontSize: 13),
                        ),
                        Text('Genre',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NewButtonWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const NewButtonWidget({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.grey, fontSize: 10),
        )
      ],
    );
  }
}
