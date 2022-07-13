// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class NHExpandedText extends StatefulWidget {
  final String text;

  /// default is "Sans"
  String? fontFamily;

  /// default is "نمایش بیشتر"
  String? showMoreText;

  /// default is "نمایش کمتر"
  String? showLessText;

  /// default is 14
  double? fontSize;

  NHExpandedText({
    required this.text,
    Key? key,
    this.showMoreText,
    this.showLessText,
    this.fontSize,
    this.fontFamily,
  }) : super(key: key);

  @override
  NHExpandedTextState createState() => NHExpandedTextState();
}

class NHExpandedTextState extends State<NHExpandedText> {
  late String firstHalf;
  late String secondHalf;
  late double fontSize;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 200) {
      firstHalf = widget.text.substring(0, 200);
      secondHalf = widget.text.substring(200, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: widthScreen,
      alignment: Alignment.topRight,
      child: secondHalf.isEmpty
          ? Text(firstHalf)
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  flag ? ("$firstHalf...") : (firstHalf + secondHalf),
                  style: TextStyle(
                      fontSize: widget.fontSize ?? 14.0,
                      fontFamily: widget.fontFamily ?? "Sans"),
                  // textAlign: TextAlign.justify,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          flag
                              ? widget.showMoreText ?? "نمایش بیشتر"
                              : widget.showLessText ?? "نمایش کمتر",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        flag = !flag;
                      });
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
