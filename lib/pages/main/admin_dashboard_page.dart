import 'package:ctse_quotes_flutter_app/pages/admin/admin_quotes_list_page.dart';
import 'package:ctse_quotes_flutter_app/pages/admin/admin_quotes_for_user.dart';
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
        title: const Text('Admin Panel',
            style:
            TextStyle(fontSize: 18.0, color: Color(0xFFFCDAB7))),backgroundColor: const  Color(0xFF133B5C)
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(3.0),
          children: <Widget>[
            Card(
                elevation: 1.0,
                margin: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(color: Color(0xFF133B5C)),
                  child: InkWell(
                    onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminQuotesList()));},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      verticalDirection: VerticalDirection.down,
                      children: const <Widget>[
                        SizedBox(height: 50.0),
                        Center(
                            child: Icon(
                              Icons.chrome_reader_mode_rounded ,
                              size: 40.0,
                              color: Color(0xFFFCDAB7),
                            )),
                        SizedBox(height: 20.0),
                        Center(
                          child: Text('Admin Quotes',
                              style:
                              TextStyle(fontSize: 18.0, color: Color(0xFFFCDAB7))),
                        )
                      ],
                    ),
                  ),
                )),
            Card(
                elevation: 1.0,
                margin: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(color: Color(0xFF133B5C)),
                  child: InkWell(
                    onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminQuotesForUser()));},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      verticalDirection: VerticalDirection.down,
                      children: const <Widget>[
                        SizedBox(height: 50.0),
                        Center(
                            child: Icon(
                              Icons.book_online,
                              size: 40.0,
                              color: Color(0xFFFCDAB7),
                            )),
                        SizedBox(height: 20.0),
                        Center(
                          child: Text('User View',
                              style:
                              TextStyle(fontSize: 18.0, color: Color(0xFFFCDAB7))),
                        )
                      ],
                    ),
                  ),
                )),
            Card(
                elevation: 1.0,
                margin: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(color: Color(0xFF133B5C)),
                  child: InkWell(
                    onTap: () { },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      verticalDirection: VerticalDirection.down,
                      children: const <Widget>[
                        SizedBox(height: 50.0),
                        Center(
                            child: Icon(
                              Icons.supervised_user_circle,
                              size: 40.0,
                              color: Color(0xFFFCDAB7),
                            )),
                        SizedBox(height: 20.0),
                        Center(
                          child: Text('User List',
                              style:
                              TextStyle(fontSize: 18.0,color : Color(0xFFFCDAB7))),
                        )
                      ],
                    ),
                  ),
                )),
            Card(
                elevation: 1.0,
                margin: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(color: Color(0xFF133B5C)),
                  child: InkWell(
                    onTap: () { },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      verticalDirection: VerticalDirection.down,
                      children: const <Widget>[
                        SizedBox(height: 50.0),
                        Center(
                            child: Icon(
                              Icons.book,
                              size: 40.0,
                              color: Color(0xFFFCDAB7),
                            )),
                        SizedBox(height: 20.0),
                        Center(
                          child: Text('Reports',
                              style:
                              TextStyle(fontSize: 18.0, color: Color(0xFFFCDAB7))),
                        )
                      ],
                    ),
                  ),
                )),
            Card(
                elevation: 1.0,
                margin: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(color: Color(0xFF133B5C)),
                  child: InkWell(
                    onTap: () { },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      verticalDirection: VerticalDirection.down,
                      children: const <Widget>[
                        SizedBox(height: 50.0),
                        Center(
                            child: Icon(
                              Icons.image,
                              size: 40.0,
                              color: Color(0xFFFCDAB7),
                            )),
                        SizedBox(height: 20.0),
                        Center(
                          child: Text('Images',
                              style:
                              TextStyle(fontSize: 18.0, color: Color(0xFFFCDAB7))),
                        )
                      ],
                    ),
                  ),
                )),
            Card(
                elevation: 1.0,
                margin: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(color: Color(0xFF133B5C)),
                  child: InkWell(
                    onTap: () { },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      verticalDirection: VerticalDirection.down,
                      children: const <Widget>[
                        SizedBox(height: 50.0),
                        Center(
                            child: Icon(
                              Icons.extension_rounded,
                              size: 40.0,
                              color: Color(0xFFFCDAB7),
                            )),
                        SizedBox(height: 20.0),
                        Center(
                          child: Text('Extras',
                              style:
                              TextStyle(fontSize: 18.0, color: Color(0xFFFCDAB7))),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
