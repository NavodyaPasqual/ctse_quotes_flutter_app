import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminQuotesForUser extends StatefulWidget {
  const AdminQuotesForUser({Key? key}) : super(key: key);

  @override
  _AdminQuotesForUserState createState() => _AdminQuotesForUserState();
}

class _AdminQuotesForUserState extends State<AdminQuotesForUser> {
  final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
      .collection('adminQuotes').snapshots();

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
      appBar: AppBar(
        title: const Text("Quotes"),
        titleTextStyle: const TextStyle(
          color: Color(0xFF5F97C4),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        backgroundColor: const Color(0xFF000000),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF5F97C4)),
          onPressed: () =>
              Navigator.of(context).pop(),
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
                        child: Column(
                          children: [
                            Card(
                              color: Colors.black,
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Color(0xFF82BDEE), Color(0xFF383882)],
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
                                  ),
                                ),
                              ),
                          ],
                        ),
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
