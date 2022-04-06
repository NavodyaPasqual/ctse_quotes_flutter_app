import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_quotes_flutter_app/pages/admin/admin_quotes_list_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      backgroundColor: const Color(0xFFFCDAB7),
      appBar: AppBar(
        title: const Text("Edit quote"),
        titleTextStyle: const TextStyle(
          color: Color(0xFF133B5C),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF133B5C)),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Container(
          color: const Color(0xFFFCDAB7),
          child: Padding(
            padding: const EdgeInsets.only(left: 34.0, right: 34.0,top: 0.0,bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 25),
                TextField(
                  controller: author,
                  style: const TextStyle(
                    color: Color(0xFF133B5C),
                  ),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    labelText: "Author",
                    labelStyle: const TextStyle(color: Color(0xFF133B5C)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xFF133B5C),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xFF133B5C),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: TextFormField(
                    controller: quote,
                    expands: true,
                    maxLines: null,
                    style: const TextStyle(
                      color: Color(0xFF133B5C),
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      labelText: "Quote",
                      labelStyle: const TextStyle(color: Color(0xFF133B5C)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFF133B5C),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFF133B5C),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36),
                          ),
                          onPressed: (){
                            widget.docid.reference.update({
                              'author': author.text,
                              'quote': quote.text,
                            }).whenComplete(() {
                              Fluttertoast.showToast(msg: "Quote updated");
                              Navigator.pushReplacement(
                                  context, MaterialPageRoute(builder: (_) => const AdminQuotesList())
                              );
                            });
                          },
                          color: const Color(0xFF133B5C),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: const Text("UPDATE",
                              style: TextStyle(color: Color(0xFFFCDAB7)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36),
                              side: const BorderSide(
                                color: Color(0xFF133B5C),
                              )
                          ),
                          onPressed: (){
                            Fluttertoast.showToast(msg: "Quote deleted");
                            widget.docid.reference.delete().whenComplete(() {
                              Navigator.pushReplacement(
                                  context, MaterialPageRoute(builder: (_) => const AdminQuotesList())
                              );
                            });
                          },
                          color: const Color(0xFF133B5C),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: const Text("DELETE",
                              style: TextStyle(color: Color(0xFFFCDAB7)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
