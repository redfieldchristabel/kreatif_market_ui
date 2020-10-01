import 'package:flutter/material.dart';

// this widget is for label in the feed page
class FilterLabelUIFeed extends StatelessWidget {
  FilterLabelUIFeed({this.litems});
  final List<String> litems;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Theme(
        data: Theme.of(context),
        child: Padding(
          padding: const EdgeInsets.only(top: 13),
          child: Container(
            height: 33,
            child: ListView.builder(
              itemCount: litems.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext ctxt, int index) => Padding(
                padding: const EdgeInsets.only(left: 9.9, right: 9.9),
                child: Text(
                  "#${litems[index]}",
                  style: TextStyle(color: Colors.pinkAccent, fontSize: 13),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
