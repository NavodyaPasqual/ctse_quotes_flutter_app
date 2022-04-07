import 'package:flutter/material.dart';
import 'package:ctse_quotes_flutter_app/pages/userQuotes/user_quotes_list_page.dart';
import 'package:ctse_quotes_flutter_app/pages/main/login_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Tandin Wangchen"),
            accountEmail: Text("taandinWangchen27@gmail.com"),
            decoration: BoxDecoration(
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
          leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () => print('Fav'),
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () => print('share'),
          ),
          ListTile(
            leading: Icon(Icons.my_library_add),
            title: Text('My Quotes'),
            onTap: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const UserQuotesList())),
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => print('Set'),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage())),
            },
          ),
        ]
      )
    );
  }
}
