import 'package:flutter/material.dart';
import 'package:kretifmarketui/modal/FeedItem.dart';

import 'FeedContent.dart';


//this Widget is for listing the feeds
class FeedUIFeed extends StatelessWidget {
  FeedUIFeed({this.lfeed});
  final List<FeedItem> lfeed;
  @override
  Widget build(BuildContext context) {
    ValueNotifier<Size> imageSize = ValueNotifier<Size>(Size(0, 0));
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return FeedContent(
          feed: lfeed[index],
        );
      }, childCount: lfeed.length),
    );
  }
}
