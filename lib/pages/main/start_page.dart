import 'package:ctse_quotes_flutter_app/pages/main/login_page.dart';
import 'package:ctse_quotes_flutter_app/pages/main/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF133B5C),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 45),
          SizedBox(
            height: 350,
            child: SvgPicture.asset(
                'assets/home.svg'
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCDAB7),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCDAB7).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCDAB7).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Text("Welcome to Motivation",
            textAlign: TextAlign.center,
            style:  GoogleFonts.dosis(
              color: const Color(0xFFFCDAB7),
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36),
                    ),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage())
                      );
                    },
                    color: const Color(0xFFFCDAB7),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: const Text("Login",
                        style: TextStyle(color: Color(0xFF133B5C)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36),
                      side: const BorderSide(
                        color: Color(0xFFFCDAB7),
                      )
                    ),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegistrationPage())
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: const Text("Registration",
                        style: TextStyle(color: Color(0xFFFCDAB7)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
