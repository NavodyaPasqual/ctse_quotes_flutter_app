import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../admin/admin_quotes_read_page.dart';

class ViewQuotes extends StatefulWidget {
  const ViewQuotes({Key? key}) : super(key: key);

  @override
  _ViewQuotesState createState() => _ViewQuotesState();
}

class _ViewQuotesState extends State<ViewQuotes> {
  late FToast fToast;

  @override
  void initState(){
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }
  final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
      .collection('adminQuotes').snapshots();

  final _random = Random();
  showCustomToast(value) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    margin: const EdgeInsets.only(bottom: 250.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.black87,

    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.check,
        color: Colors.white),
        const SizedBox(
          width: 12.0,
        ),
        Text(value,
          style: const TextStyle(fontSize: 20.0,color: Colors.white),
        ),

      ],
    ),
  );


  fToast.showToast(
    child: toast,
    toastDuration: const Duration(seconds: 3),
  );
  }
  Future<void> _copyToClipboard(data) async {
    await Clipboard.setData(ClipboardData(text: data));
    var a = "copied...";
    showCustomToast(a);
  }

  Future<void> share(data) async {
    await Share.share(
      data,
    );
  }
  late bool isFavourite = true;


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

      backgroundColor: const Color(0xFFede8e8),

      appBar: AppBar(
        centerTitle: true,
        title: const Text("Angry"),
        titleTextStyle: const TextStyle(
          color: Color(0xFF000000),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF000000)),
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
                      margin: const EdgeInsets.only(left: 2.0,top: 3.0,right: 2.0,bottom: 2.0),
                      child: GestureDetector(
                        onTap: () =>
                          Navigator.push(context,PageRouteBuilder(
                          transitionDuration:const Duration(milliseconds: 600),
                          reverseTransitionDuration: const Duration(milliseconds: 420),
                          transitionsBuilder:(BuildContext context, Animation<double> animation,
                          Animation<double> secondaryAnimation, Widget child){
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
                          return AdminQuotesRead(docid: snapshot.data!.docs[index]);
                          }
                        )
                      ),
                      child: Column(
                            children: [
                              Card(
                                child: Container(
                                    color: Colors.primaries[_random.nextInt(Colors.primaries.length)]
                                    [_random.nextInt(9) * 100],
                                  padding: const EdgeInsets.only(top: 25.0,bottom: 0.0),
                                  child: ListTile(
                                    title: Text(
                                      snapshot.data!.docChanges[index].doc['quote'],
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.ubuntu(
                                        color: Colors.white,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    subtitle : Container(
                                      margin: const EdgeInsets.only(top: 25.0,bottom: 2.0),
                                      padding: const EdgeInsets.only(top: 1.0,bottom: 10.0),
                                      color: const Color(0x40000000),
                                      child:Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    if(snapshot.data!.docChanges[index].doc['fav'] == true){
                                                      snapshot.data!.docs[index].reference.update({
                                                        'fav': false,
                                                      });
                                                      if(snapshot.data!.docChanges[index].doc['count'] > 0){
                                                        snapshot.data!.docs[index].reference.update({
                                                          'count': snapshot.data!.docChanges[index].doc['count'] - 1,
                                                        });
                                                      }
                                                      var a = "Removed From Fav";
                                                      setState(() {
                                                        isFavourite = true;
                                                      });
                                                      showCustomToast(a);
                                                    }
                                                    else if(snapshot.data!.docChanges[index].doc['fav'] == false){
                                                      snapshot.data!.docs[index].reference.update({
                                                        'fav': true,
                                                        'count': snapshot.data!.docChanges[index].doc['count'] + 1,
                                                      });
                                                      var a = "Added To Fav";
                                                      setState(() {
                                                        isFavourite = false;
                                                      });
                                                      showCustomToast(a);
                                                    }
                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ViewQuotes()));

                                                    },
                                                  icon: Icon(
                                                    Icons.favorite_border,
                                                    size: 25,
                                                    color: isFavourite ? Colors.white : Colors.red,
                                                  ),
                                                ),
                                                const Text('fav',
                                                    style:
                                                    TextStyle(fontSize: 18.0, color: Color(0xFFffffff))),
                                              ],
                                          ),
                                          Column(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  _copyToClipboard(snapshot.data!.docChanges[index].doc['quote']);
                                                  },
                                                icon: const Icon(
                                                  Icons.my_library_add_outlined,
                                                  size: 25,
                                                  color: Color(0xFFFFFFFF),
                                                ),
                                              ),
                                              const Text('Copy',
                                                  style:
                                                  TextStyle(fontSize: 18.0, color: Color(0xFFffffff))),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  share(snapshot.data!.docChanges[index].doc['quote']);
                                                },
                                                icon: const Icon(
                                                  Icons.share_outlined,
                                                  size: 25,
                                                  color: Color(0xFFFFFFFF),
                                                ),
                                              ),
                                              const Text('Share',
                                                  style:
                                                  TextStyle(fontSize: 18.0, color: Color(0xFFffffff))),
                                            ],
                                          ),
                                        ],
                                      ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
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
}
