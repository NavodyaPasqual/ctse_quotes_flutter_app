import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_quotes_flutter_app/pages/userQuotes/user_quotes_list_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserQuotesAdd extends StatelessWidget {
  TextEditingController author = TextEditingController();
  TextEditingController quote = TextEditingController();
  
  CollectionReference ref = FirebaseFirestore.instance.collection('userQuotes');

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0,end: 1.0),
      duration: const Duration(milliseconds: 1500),
      child: Scaffold(
        backgroundColor: const Color(0xFF133B5C),
        appBar: AppBar(
          title: const Text("Make your own quote"),
          titleTextStyle: const TextStyle(
            color: Color(0xFFFCDAB7),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFFFCDAB7)),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: Container(
            color: const Color(0xFF133B5C),
            child: Padding(
              padding: const EdgeInsets.only(left: 34.0, right: 34.0,top: 0.0,bottom: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 25),
                  TextFormField(
                    style: const TextStyle(
                      color: Color(0xFFFCDAB7),
                    ),
                    controller: author,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      labelText: "Author",
                      labelStyle: const TextStyle(color: Color(0x81FCDAB7)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFFFCDAB7),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFFFCDAB7),
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
                      keyboardType: TextInputType.multiline,
                      style: const TextStyle(
                        color: Color(0xFFFCDAB7),
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        labelText: "Quote",
                        labelStyle: const TextStyle(color: Color(0x81FCDAB7)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFFFCDAB7),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFFFCDAB7),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xC9FCDAB7),
                    child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {
                        ref.add({
                          'author': author.text,
                          'quote': quote.text,
                        }).whenComplete(() {
                          Fluttertoast.showToast(msg: "Quote added");
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const UserQuotesList()));
                        });
                      },
                      child: const Text(
                        "save",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF133B5C), fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      builder: (BuildContext context, dynamic value, child){
        return ShaderMask(shaderCallback: (rect){
          return RadialGradient(
            radius: value * 5,
            colors: const [Colors.white,Colors.white,Colors.transparent,Colors.transparent],
            stops: const [0.0,0.55,0.6,1.0],
            center: const FractionalOffset(0.95, 0.90),
          ).createShader(rect);
        }, child: child,);
      },
    );
  }
}
