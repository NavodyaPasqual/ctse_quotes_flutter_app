import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AdminQuotesRead extends StatefulWidget {
  DocumentSnapshot docid;
  AdminQuotesRead({required this.docid});
  @override
  _AdminQuotesReadState createState() => _AdminQuotesReadState();
}

class _AdminQuotesReadState extends State<AdminQuotesRead> {
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        context: context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF133B5C),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFCDAB7)),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        width: ScreenUtil().screenWidth,
        color: const Color(0xFF133B5C),
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(16),
          vertical: ScreenUtil().setHeight(0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  widget.docid.get('quote'),
                  style: TextStyle(
                    color: const Color(0xFFFCDAB7),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    fontSize: ScreenUtil().setSp(34),
                  ),
                ),
              ),
            ),
            Text(
              widget.docid.get('author'),
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.w300,
                fontSize: ScreenUtil().setSp(26),
              ),
            ),
          ],
        ),
      ),
    );
  }

}