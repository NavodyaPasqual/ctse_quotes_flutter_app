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
      backgroundColor: const Color(0xFFFCDAB7),
      appBar: AppBar(
        title: const Text("Home"),
        elevation: .1,
        backgroundColor: const  Color(0xFF133B5C),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem("Admin Quotes", Icons.book),
            makeDashboardItem("User List", Icons.alarm),
            makeDashboardItem("User View", Icons.co_present ),
            makeDashboardItem("Reports", Icons.alarm),
            makeDashboardItem("Option1", Icons.alarm),
            makeDashboardItem("Option2", Icons.alarm)
          ],
        ),
      ),
    );
  }

  Card makeDashboardItem(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: InkWell(
            onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminQuotesList()));},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                const SizedBox(height: 50.0),
                Center(
                    child: Icon(
                      icon,
                      size: 40.0,
                      color: Colors.black,
                    )),
                const SizedBox(height: 20.0),
                Center(
                  child: Text(title,
                      style:
                      const TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }
}
