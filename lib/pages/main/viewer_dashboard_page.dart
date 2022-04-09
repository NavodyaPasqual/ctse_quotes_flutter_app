import 'package:flutter/material.dart';
import 'package:ctse_quotes_flutter_app/pages/sidebarlib/NavBar.dart';
import 'package:ctse_quotes_flutter_app/pages/viewer/view_quote.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ctse_quotes_flutter_app/pages/viewer/view_best_quote.dart';


class ViewerDashboardPage extends StatefulWidget {
  const ViewerDashboardPage({Key? key}) : super(key: key);

  @override
  _ViewerDashboardPageState createState() => _ViewerDashboardPageState();
}

class _ViewerDashboardPageState extends State<ViewerDashboardPage> {
  Icon customIcon = const Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFede8e8),
        drawer: const NavBar(),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Category',
              style:  GoogleFonts.dosis(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            IconButton(
              onPressed: () {},
              icon: customIcon,
            )
          ],
          backgroundColor: const  Color(0xFFFFFFFF),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
          child: GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(3.0),
            children: <Widget>[
              Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(6.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.yellow, Colors.green],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewBestQuotes()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: const <Widget>[
                          Center(
                            child: Text( "Happy Quotes",
                                style:
                                TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  )),
              Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(6.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.black],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: const <Widget>[
                          Center(
                            child: Text( "Angry Quotes",
                                style:
                                TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  )),
              Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(6.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.orange],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: const <Widget>[
                          Center(
                            child: Text( "Attitude Quotes",
                                style:
                                TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  )),
              Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(6.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.green, Colors.purple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: const <Widget>[
                          Center(
                            child: Text( "Awesome Quotes",
                                style:
                                TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  )),
              Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(6.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black, Colors.blue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: const <Widget>[
                          Center(
                            child: Text( "Beard Quotes",
                                style:
                                TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  )),
              Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(6.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.pink, Colors.yellow],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: const <Widget>[
                          Center(
                            child: Text( "Best Quotes",
                                style:
                                TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  )),
              Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(6.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.green, Colors.black],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: const <Widget>[
                          Center(
                            child: Text( "Birthday Quotes",
                                style:
                                TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  )),
              Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(6.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange, Colors.red],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: const <Widget>[
                          Center(
                            child: Text( "Bike Quotes",
                                style:
                                TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  )),
              Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(6.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black, Colors.orange],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: const <Widget>[
                          Center(
                            child: Text( "Birthday Quotes",
                                style:
                                TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  )),
              Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(6.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.yellow, Colors.green],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: const <Widget>[
                          Center(
                            child: Text( "Beautiful Quotes",
                                style:
                                TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  )),
              Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(6.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange, Colors.red],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: const <Widget>[
                          Center(
                            child: Text( "Busy Quotes",
                                style:
                                TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  )),
              Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(6.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange, Colors.pink],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: const <Widget>[
                          Center(
                            child: Text( "Brother Quotes",
                                style:
                                TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  )),
              Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(6.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black, Colors.white],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: const <Widget>[
                          Center(
                            child: Text( "Mother Quotes",
                                style:
                                TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  )),
              Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(6.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange, Colors.pink],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: const <Widget>[
                          Center(
                            child: Text( "Family's Quotes",
                                style:
                                TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  )),
              Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(6.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.blue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: const <Widget>[
                          Center(
                            child: Text( "Emotional Quotes",
                                style:
                                TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  )),
              Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(6.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.pink, Colors.red],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: const <Widget>[
                          Center(
                            child: Text( "Adventure Quotes",
                                style:
                                TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  )),
              Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(6.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.purple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: const <Widget>[
                          Center(
                            child: Text( "Brother Quotes",
                                style:
                                TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  )),
              Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(6.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.brown, Colors.yellow],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: InkWell(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewQuotes()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: const <Widget>[
                          Center(
                            child: Text( "Sister Quotes",
                                style:
                                TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
    );
  }
}
