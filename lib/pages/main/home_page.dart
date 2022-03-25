import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_quotes_flutter_app/models/main/user_model.dart';
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
