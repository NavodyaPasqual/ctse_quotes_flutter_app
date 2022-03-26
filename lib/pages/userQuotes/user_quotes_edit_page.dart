import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_quotes_flutter_app/pages/userQuotes/user_quotes_list_page.dart';
import 'package:flutter/material.dart';

class UserQuotesEdit extends StatefulWidget {
  DocumentSnapshot docid;
  UserQuotesEdit({required this.docid});

  @override
  _UserQuotesEditState createState() => _UserQuotesEditState();
}

class _UserQuotesEditState extends State<UserQuotesEdit> {
  TextEditingController author = TextEditingController();
  TextEditingController quote = TextEditingController();

  @override
  void initState(){
    author = TextEditingController(text: widget.docid.get('author'));
    quote = TextEditingController(text: widget.docid.get('quote'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
              onPressed: (){
                widget.docid.reference.update({
                  'author': author.text,
                  'quote': quote.text,
                }).whenComplete(() {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => const UserQuotesList())
                  );
                });
              },
            child: const Text('save'),
          ),
          MaterialButton(
            onPressed: (){
              widget.docid.reference.delete().whenComplete((){
                Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const UserQuotesList())
                );
              });
            },
            child: const Text('delete'),
            ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              controller: author,
              decoration: const InputDecoration(
                hintText: 'author',
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: quote,
                expands: true,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'quote'
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
