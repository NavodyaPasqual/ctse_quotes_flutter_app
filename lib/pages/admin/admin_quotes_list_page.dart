import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_quotes_flutter_app/pages/admin/admin_quotes_add_page.dart';
import 'package:ctse_quotes_flutter_app/pages/admin/admin_quotes_edit_page.dart';
import 'package:ctse_quotes_flutter_app/pages/admin/admin_quotes_read_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AdminQuotesList extends StatefulWidget {
  const AdminQuotesList({Key? key}) : super(key: key);

  @override
  _AdminQuotesListState createState() => _AdminQuotesListState();
}

class _AdminQuotesListState extends State<AdminQuotesList> {
  final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance.collection('adminQuotes').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCDAB7),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF133B5C),
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AdminQuotesAdd()));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
          title: const Text('Admin Quotes',
              style:
              TextStyle(fontSize: 18.0, color: Color(0xFFFCDAB7))),backgroundColor: const  Color(0xFF133B5C)
      ),
      body: StreamBuilder(
        stream: usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            return const Text("Something is wrong");
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => AdminQuotesRead(docid: snapshot.data!.docs[index])));
                  },
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: Color(0xFF133B5C),
                            ),
                          ),
                          title: Text(
                            snapshot.data!.docChanges[index].doc['author'],
                            style: const TextStyle(
                              fontSize: 21,color: Color(0xFF133B5C),fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            snapshot.data!.docChanges[index].doc['quote'],
                            style: const TextStyle(
                              fontSize: 20,color: Color(0xFF133B5C),fontStyle: FontStyle.italic,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 13,
                            horizontal: 16,
                          ),
                          trailing: MaterialButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => AdminQuotesEdit(docid: snapshot.data!.docs[index])));
                            },
                            child: const Text('edit',style:
                            TextStyle(fontSize: 17 ,fontWeight: FontWeight.bold, color: Color(0xFF133B5C))),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

