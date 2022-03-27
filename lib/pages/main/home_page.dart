import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_quotes_flutter_app/models/main/user_model.dart';
import 'package:ctse_quotes_flutter_app/pages/main/admin_dashboard_page.dart';
import 'package:ctse_quotes_flutter_app/pages/main/viewer_dashboard_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      backgroundColor: const Color(0xFF133B5C),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 45),
          SizedBox(
            height: 350,
            child: SvgPicture.asset(
                'assets/home.svg'
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCDAB7),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCDAB7).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCDAB7).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Text("Welcome ${userModel.firstName} ${userModel.secondName}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFFCDAB7),
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10,),
          FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36),
                side: const BorderSide(
                  color: Color(0xFFFCDAB7),
                )
            ),
            onPressed: (){logout(context);},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.center,
              width: 60,
              child: const Text("Logout",
                style: TextStyle(color: Color(0xFFFCDAB7)),
              ),
            ),
          ),
          const SizedBox(height: 40,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36),
                    ),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ViewerDashboardPage())
                      );
                    },
                    color: const Color(0xFFFCDAB7),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: const Text("Viewer",
                        style: TextStyle(color: Color(0xFF133B5C)),
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
                        color: Color(0xFFFCDAB7),
                      )
                    ),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AdminDashboardPage())
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: const Text("Admin",
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
    );
  }
  Future<void> logout(BuildContext context) async{
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
