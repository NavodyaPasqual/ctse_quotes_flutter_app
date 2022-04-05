import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminQuotesRead extends StatefulWidget {
  DocumentSnapshot docid;
  AdminQuotesRead({required this.docid});

  @override
  _AdminQuotesReadState createState() => _AdminQuotesReadState();
}


class _AdminQuotesReadState extends State<AdminQuotesRead> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Quotes"),
      ),
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