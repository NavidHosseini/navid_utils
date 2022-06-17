import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String text;
  final String fromPage;
  final bool isTextWithHashtag;
  final direction;
  final fontFamily;

  const DescriptionTextWidget({
    required this.text,
    Key? key,
    required this.fromPage,
    required this.isTextWithHashtag,
    this.direction,
    this.fontFamily,
  }) : super(key: key);

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  var size;

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
    switch (widget.fromPage) {
      case "news":
        size = 14.0;
        break;
      case "trands":
        size = 14.0;
        break;
      default:
        size = 14.0;
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
                  flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                  style: TextStyle(
                      fontSize: size, fontFamily: widget.fontFamily ?? "Sans"),
                  // textAlign: TextAlign.justify,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: widget.direction == null
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.direction == null
                              ? flag
                                  ? "Show more".tr
                                  : "Show less".tr
                              : flag
                                  ? "Show more"
                                  : "Show less",
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
