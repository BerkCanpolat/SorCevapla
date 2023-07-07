import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommentWidget extends StatelessWidget {
  final snap;
  const CommentWidget({super.key,this.snap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 18),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    // style: TextStyle(color: Colors.white),
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: "${snap['name']} :",style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      TextSpan(
                        text: "  ${snap['text']}",style: TextStyle(color: Colors.amber)
                      ),
                    ],
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(DateFormat.Hm().format(snap["datePublished"].toDate()),style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold)),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}