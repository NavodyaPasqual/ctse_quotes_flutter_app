import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const Text(
              "Name",
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500
              ),
            ),
            const Text(
              "Email",
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500
              ),
            ),
            const SizedBox(height: 15),
            ActionChip(label: const Text("Logout"), onPressed: (){}),
          ],
        ),
      ),
    );
  }
}
