import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserQuotesRead extends StatefulWidget {
  DocumentSnapshot docid;
  UserQuotesRead({required this.docid});

  @override
  _UserQuotesReadState createState() => _UserQuotesReadState();
}

class _UserQuotesReadState extends State<UserQuotesRead> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Text(
                    widget.docid.get('author')
                )
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: Text(
                widget.docid.get('quote'),
              )
            ),
          )
        ],
      ),
    );
  }
}