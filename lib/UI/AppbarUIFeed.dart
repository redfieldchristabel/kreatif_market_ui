import 'package:flutter/material.dart';

class AppbarUIFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double top = 111;
    return Theme(
      data: Theme.of(context),
      child: SliverAppBar(
        pinned: true,
        title: Text(
          "Redfield",
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Theme.of(context).primaryColor
            : Colors.black,
//              title: Text("Redfield"),
        expandedHeight: 133.0,
        flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          top = constraints.biggest.height;
          return FlexibleSpaceBar(
            title: AnimatedOpacity(
              duration: Duration(milliseconds: 333),
              opacity: top > 99.0 ? 1.0 : 0.0,
              child: Text(
                "kreatifmarket",
                style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        }),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.pinkAccent,
            ),
            tooltip: 'Add new entry',
            onPressed: () {/* ... */},
          ),
          IconButton(
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.pinkAccent,
            ),
            tooltip: 'Add new entry',
            onPressed: () {/* ... */},
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.camera_alt,
            color: Colors.pinkAccent,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
