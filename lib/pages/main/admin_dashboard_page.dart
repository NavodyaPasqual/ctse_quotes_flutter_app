import 'package:ctse_quotes_flutter_app/pages/admin/admin_quotes_list_page.dart';
import 'package:flutter/material.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({Key? key}) : super(key: key);

  @override
  _AdminDashboardPageState createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: <Widget>[
              const SizedBox(height: 55),
              FlatButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminQuotesList()));},
                color: Colors.redAccent,
                child: const Text("Admin Quotes"),
              ),

              const SizedBox(height: 55),
              FlatButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminQuotesList()));},
                color: Colors.redAccent,
                child: const Text("User List"),
              ),
            ]
        )
    );
  }

}
