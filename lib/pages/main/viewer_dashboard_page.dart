import 'package:ctse_quotes_flutter_app/pages/admin/admin_quotes_for_user.dart';
import 'package:ctse_quotes_flutter_app/pages/userQuotes/user_quotes_list_page.dart';
import 'package:flutter/material.dart';
import 'package:ctse_quotes_flutter_app/pages/sidebarlib/NavBar.dart';
import 'package:ctse_quotes_flutter_app/pages/viewer/view_quote.dart';

class ViewerDashboardPage extends StatefulWidget {
  const ViewerDashboardPage({Key? key}) : super(key: key);

  @override
  _ViewerDashboardPageState createState() => _ViewerDashboardPageState();
}

class _ViewerDashboardPageState extends State<ViewerDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text('Category'),
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(height: 55),
            FlatButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => const UserQuotesList()));},
              color: Colors.redAccent,
              child: const Text("My Quotes"),
            ),
            FlatButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminQuotesForUser()));},
              color: Colors.redAccent,
              child: const Text("Quotes"),
            ),
            FlatButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
              color: Colors.redAccent,
              child: const Text("Favourite Quotes"),
            ),
          ]
        )
    );
  }
}
