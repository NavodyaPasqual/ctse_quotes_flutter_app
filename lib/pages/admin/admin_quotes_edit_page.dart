import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_quotes_flutter_app/pages/admin/admin_quotes_list_page.dart';
import 'package:flutter/material.dart';

class AdminQuotesEdit extends StatefulWidget {
  DocumentSnapshot docid;
  AdminQuotesEdit({required this.docid});

  @override
  _AdminQuotesEditState createState() => _AdminQuotesEditState();
}

class _AdminQuotesEditState extends State<AdminQuotesEdit> {
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
                    context, MaterialPageRoute(builder: (_) => const AdminQuotesList())
                );
              });
            },
            child: const Text('save'),
          ),
          MaterialButton(
            onPressed: (){
              widget.docid.reference.delete().whenComplete((){
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => const AdminQuotesList())
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
