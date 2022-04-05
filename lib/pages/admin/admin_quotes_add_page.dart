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
      appBar: AppBar(
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
                "save"
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
