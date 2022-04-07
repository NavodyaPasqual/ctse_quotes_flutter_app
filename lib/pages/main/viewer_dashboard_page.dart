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
      backgroundColor: const Color(0xFF133B5C),
        drawer: NavBar(),
        appBar: AppBar(
          title: Text('Home'),
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
                decoration: const BoxDecoration(color: Color(0xFFFCDAB7)),
                child: InkWell(
                  onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const UserQuotesList()));},
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
                            color: Color(0xFF133B5C),
                          )),
                      SizedBox(height: 20.0),
                      Center(
                        child: Text('My Quotes',
                            style:
                            TextStyle(fontSize: 18.0, color: Color(0xFF133B5C))),
                      )
                    ],
                  ),
                ),
              )),
              Card(
                  elevation: 1.0,
                  margin: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(color: Color(0xFFFCDAB7)),
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
                                Icons.book,
                                size: 40.0,
                                color: Color(0xFF133B5C),
                              )),
                          SizedBox(height: 20.0),
                          Center(
                            child: Text('Motivational Quotes',
                                style:
                                TextStyle(fontSize: 18.0, color: Color(0xFF133B5C))),
                          )
                        ],
                      ),
                    ),
                  )),
              Card(
                  elevation: 1.0,
                  margin: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(color: Color(0xFFFCDAB7)),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: const <Widget>[
                          SizedBox(height: 50.0),
                          Center(
                              child: Icon(
                                Icons.favorite,
                                size: 40.0,
                                color: Color(0xFF133B5C),
                              )),
                          SizedBox(height: 20.0),
                          Center(
                            child: Text('Favourite Quotes',
                                style:
                                TextStyle(fontSize: 18.0, color: Color(0xFF133B5C))),
                          )
                        ],
                      ),
                    ),
                  )),
              Card(
                  elevation: 1.0,
                  margin: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(color: Color(0xFFFCDAB7)),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: const <Widget>[
                          SizedBox(height: 50.0),
                          Center(
                              child: Icon(
                                Icons.girl,
                                size: 40.0,
                                color: Color(0xFF133B5C),
                              )),
                          SizedBox(height: 20.0),
                          Center(
                            child: Text('Happy Quotes',
                                style:
                                TextStyle(fontSize: 18.0, color: Color(0xFF133B5C))),
                          )
                        ],
                      ),
                    ),
                  )),
              Card(
                  elevation: 1.0,
                  margin: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(color: Color(0xFFFCDAB7)),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: const <Widget>[
                          SizedBox(height: 50.0),
                          Center(
                              child: Icon(
                                Icons.face,
                                size: 40.0,
                                color: Color(0xFF133B5C),
                              )),
                          SizedBox(height: 20.0),
                          Center(
                            child: Text('Sad Quotes',
                                style:
                                TextStyle(fontSize: 18.0, color: Color(0xFF133B5C))),
                          )
                        ],
                      ),
                    ),
                  )),
              Card(
                  elevation: 1.0,
                  margin: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(color: Color(0xFFFCDAB7)),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
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
                                color: Color(0xFF133B5C),
                              )),
                          SizedBox(height: 20.0),
                          Center(
                            child: Text('Breakup Quotes',
                                style:
                                TextStyle(fontSize: 18.0, color: Color(0xFF133B5C))),
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
