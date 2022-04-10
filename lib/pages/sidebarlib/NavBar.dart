import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ctse_quotes_flutter_app/pages/main/login_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ctse_quotes_flutter_app/pages/viewer/fav.dart';


import '../../models/main/user_model.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();

}
class _NavBarState extends State<NavBar> {
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
  Future<void> share(data) async {
    await Share.share(
      data[0]+" "+data[1],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFffffff),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("${userModel.firstName} ${userModel.secondName}"),
            accountEmail: Text("${userModel.email}"),
            decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: NetworkImage(
                'https://media.istockphoto.com/photos/black-gold-background-gradient-texture-soft-golden-with-light-gray-picture-id1191154632?k=20&m=1191154632&s=612x612&w=0&h=oBja8kFtESo7DpZtPfYL2xpo6vwleAbBf6jrbUUpJek='
              ),
              fit: BoxFit.cover,
            )
          ),
          ),
          ListTile(
          leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FavList())),
            },
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: () => share([userModel.uid, userModel.email]),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () => {
              logout(context)
            },
          ),
        ]
      )
    );
  }
  Future<void> logout(BuildContext context) async{
    await FirebaseAuth.instance.signOut();
    Fluttertoast.showToast(msg: "Logged Out");
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
