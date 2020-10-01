import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kretifmarketui/UI/AppbarUIFeed.dart';
import 'package:kretifmarketui/UI/FeedUIFeed.dart';
import 'package:kretifmarketui/UI/FilterLabelUIFeed.dart';
import 'package:kretifmarketui/modal/FeedItem.dart';

import '../main.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> litems = [
      "Trending",
      "Top Download",
      "Image",
      "Vector",
      "Illistration"
    ];
    List<FeedItem> lfeed = [
      FeedItem(
          url: "https://f1.upet.com/n_hLNOdBlDnb_n.jpg",
          tags: ["trending", "image"],
          author: "Mikaei Cho",
          dateAdded: DateTime.now()),
      FeedItem(
          url:
              "https://www.wallpaperup.com/uploads/wallpapers/2016/10/03/1022487/3de2ad39710048c4c44c2beda70b973b-1000.jpg",
          tags: ["anime", "image"],
          author: "Mikaei Cho",
          dateAdded: DateTime.now()),
      FeedItem(
          url:
              "https://img4.goodfon.ru/original/1920x1200/b/30/violet-evergarden-devushka-lepestki-vzgliad-zont.jpg",
          tags: ["anime", "image"],
          author: "Mikaei Cho",
          dateAdded: DateTime.now()),
      FeedItem(
          url:
              "https://kawaii-mobile.com/wp-content/uploads/2018/05/Violet-Evergarden-2160x3840.jpg",
          tags: ["anime", "image"],
          author: "Redfield Christabel",
          dateAdded: DateTime.now()),
      FeedItem(
          url:
              "https://w-dog.pw/android-wallpapers/12/2/392649320803411/nature-ladybug-close-up-drops-insects.jpg",
          tags: ["ladybird", "image"],
          author: "Redfield Christabel",
          dateAdded: DateTime.now()),
    ];

    ScrollController feedScrollController = ScrollController();
    return Scaffold(
      body: CustomScrollView(
        controller: feedScrollController,
        slivers: <Widget>[
          AppbarUIFeed(),
          FilterLabelUIFeed(
            litems: litems,
          ),
          FeedUIFeed(
            lfeed: lfeed,
          ),
        ],
      ),
      floatingActionButton: Theme(
        data: Theme.of(context),
        child: FloatingActionButton(
          onPressed: () {
            print("dah tekan ");
            MyApp.mode.value = MyApp.mode.value == ThemeMode.light
                ? ThemeMode.dark
                : ThemeMode.light;
          },
          child: Icon(Icons.lightbulb_outline),
        ),
      ),
    );
  }
}
