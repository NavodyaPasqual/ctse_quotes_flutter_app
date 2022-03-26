import 'package:ctse_quotes_flutter_app/pages/userQuotes/user_quotes_list_page.dart';
import 'package:flutter/material.dart';

class ViewerDashboardPage extends StatefulWidget {
  const ViewerDashboardPage({Key? key}) : super(key: key);

  @override
  _ViewerDashboardPageState createState() => _ViewerDashboardPageState();
}

class _ViewerDashboardPageState extends State<ViewerDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            FlatButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => const UserQuotesList()));},
              color: Colors.redAccent,
              child: const Text("User Quotes"),
            ),
          ]
        )
    );
  }
}