import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kretifmarketui/modal/FeedItem.dart';

/// this Widget is a feed widget
class FeedContent extends StatefulWidget {
  FeedContent({this.feed});
  final FeedItem feed;

  @override
  _FeedContentState createState() => _FeedContentState();
}

class _FeedContentState extends State<FeedContent>
    with SingleTickerProviderStateMixin {
  int feedHeight = 0;
  int feedwidth = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Theme(
        data: Theme.of(context),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? Theme.of(context).primaryColor
                  : Colors.black,
              borderRadius: BorderRadius.circular(9),
              boxShadow: Theme.of(context).brightness == Brightness.light
                  ? [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]
                  : []),
          child: AnimatedSize(
//                height: value.height == 0 ? 0 : null,
//                width: value.width == 0 ? 0 : null,
            duration: Duration(milliseconds: 999),
            curve: Curves.elasticInOut,
            vsync: this,
            child: Container(
//        height: feedHeight == 0 ? 0 : null,
//        width: feedwidth == 0 ? 0 : null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3, top: 9, left: 3),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.feed.author),
                          Text(
                            widget.feed.dateAdded.toIso8601String(),
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                          Wrap(
                            children: List.generate(widget.feed.tags.length,
                                (int index) {
                              return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text("#${widget.feed.tags[index]}"),
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: GestureDetector(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Image.network(
                            widget.feed.url,
                            filterQuality: FilterQuality.low,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null) {
//                                  imageSize.value = Size(1, 1);
                                return child;
                              }
                              ;
                              return Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes
                                        : null,
                                  ),
                                ),
                              );
                            },
                          )),
                      onDoubleTap: () {
                        Fluttertoast.showToast(
                            msg: "you love this feed",
                            toastLength: Toast.LENGTH_SHORT);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 7),
                                  child: Icon(Icons.favorite_border),
                                ),
                                onTap: () {
                                  Fluttertoast.showToast(
                                      msg: "you love this feed");
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 7),
                                child: Icon(Icons.photo_library),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 7),
                            child: Icon(Icons.arrow_downward),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
