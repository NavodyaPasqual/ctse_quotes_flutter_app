import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_quotes_flutter_app/pages/userQuotes/user_quotes_add_page.dart';
import 'package:ctse_quotes_flutter_app/pages/userQuotes/user_quotes_edit_page.dart';
import 'package:ctse_quotes_flutter_app/pages/userQuotes/user_quotes_read_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_color/random_color.dart';

class UserQuotesList extends StatefulWidget {
  const UserQuotesList({Key? key}) : super(key: key);

  @override
  _UserQuotesListState createState() => _UserQuotesListState();
}

class _UserQuotesListState extends State<UserQuotesList> {
  final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
      .collection('userQuotes').snapshots();

  final TextEditingController _textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery
                .of(context)
                .size
                .width,
            maxHeight: MediaQuery
                .of(context)
                .size
                .height),
        context: context);
    return Scaffold(

      backgroundColor: const Color(0xFF000000),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFCDAB7),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => UserQuotesAdd()));
        },
        child: const Icon(
          Icons.add,
          color: Color(0xFF1D2D50),
        ),
      ),
      appBar: AppBar(
        title: const Text("My Quotes"),
        titleTextStyle: const TextStyle(
          color: Color(0xFFFCDAB7),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        backgroundColor: const Color(0xFF000000),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFCDAB7)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: StreamBuilder(
        stream: usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(6),
                  physics: const AlwaysScrollableScrollPhysics(),
                  //shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (_, index) {
                    return Container(
                        margin: const EdgeInsets.only(left: 4.0,top: 6.0,right: 4.0,bottom: 6.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) =>
                                UserQuotesRead(docid: snapshot.data!.docs[index])));
                          },
                          child: Column(
                            children: [
                              Card(
                                color: Colors.black,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color(0xFFFCDAB7), Color(0xFF313130)],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(20),
                                        left: Radius.circular(20)),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      snapshot.data!.docChanges[index].doc['quote'],
                                      style: GoogleFonts.josefinSans(
                                        color: Colors.black,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,

                                      ),
                                    ),
                                    subtitle: Text(
                                      snapshot.data!.docChanges[index].doc['author'],
                                      style: GoogleFonts.dosis(
                                        color: Colors.black,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.only(
                                        left: 22.0, right: 0.0,top: 12.0, bottom: 12.0
                                    ),
                                    trailing: IconButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (_) =>
                                                UserQuotesEdit(docid: snapshot.data!
                                                    .docs[index])));
                                      },

                                      icon: const Icon(
                                        Icons.edit_note_rounded,
                                        size: 25,
                                        color: Color(0xFFFCDAB7),
                                      ),
                                    ),

                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    final getColor = (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    };
    return MaterialStateProperty.resolveWith(getColor);
  }


}