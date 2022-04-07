import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_quotes_flutter_app/pages/admin/admin_quotes_list_page.dart';
import 'package:flutter/material.dart';

class AdminQuotesAdd extends StatelessWidget {
  TextEditingController author = TextEditingController();
  TextEditingController quote = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('adminQuotes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCDAB7),
      appBar: AppBar( title: const Text('Add Quotes',
          style:
          TextStyle(fontSize: 18.0, color: Color(0xFFFCDAB7))),backgroundColor: const  Color(0xFF133B5C),
        actions: [
          MaterialButton(onPressed: () {
            ref.add({
              'author': author.text,
              'quote': quote.text,
            }).whenComplete(() {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AdminQuotesList()));
            });
          },
            child: const Text(
                "save",style:
            TextStyle(fontSize: 17 ,fontWeight: FontWeight.bold, color: Color(0xFFFCDAB7))
            ),
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
                hintText: 'Author',
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
                    hintText: 'Quote',
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}
