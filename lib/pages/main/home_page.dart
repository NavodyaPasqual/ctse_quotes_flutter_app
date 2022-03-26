import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_quotes_flutter_app/models/main/user_model.dart';
import 'package:ctse_quotes_flutter_app/pages/userQuotes/user_quotes_list_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel userModel = UserModel();

  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance
    .collection("users")
    .doc(user!.uid)
    .get()
    .then((value){
      userModel = UserModel.fromMap(value.data());
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final userQuotesButton = Material(
      elevation: 5,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserQuotesList())
          );
        },
        child: const Text(
          "UserQuotesList",
        ),
      ),
    );

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "${userModel.firstName} ${userModel.secondName}",
              style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500
              ),
            ),
            Text(
              "${userModel.email}",
              style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500
              ),
            ),
            const SizedBox(height: 15),
            ActionChip(label: const Text("Logout"), onPressed: (){
              logout(context);
            }),
            const SizedBox(height: 30),
            userQuotesButton
          ],
        ),
      ),
    );
  }
  Future<void> logout(BuildContext context) async{
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
