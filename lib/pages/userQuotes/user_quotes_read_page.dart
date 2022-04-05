import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_color/random_color.dart';

class UserQuotesRead extends StatefulWidget {
  DocumentSnapshot docid;
  UserQuotesRead({required this.docid});
  @override
  _UserQuotesReadState createState() => _UserQuotesReadState();
}

class _UserQuotesReadState extends State<UserQuotesRead> {
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    speak(String quote) async{
      await flutterTts.setLanguage('en-us');
      await flutterTts.setPitch(0.3);
      await flutterTts.setSpeechRate(0.3);
      await flutterTts.speak(quote);
    }
    RandomColor _randomColor = RandomColor();
    Color _color = _randomColor.randomColor(
        colorBrightness: ColorBrightness.dark
    );
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        context: context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFCDAB7)),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        width: ScreenUtil().screenWidth,
        color: _color,
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(16),
          vertical: ScreenUtil().setHeight(0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/quote_icon.png',
              color: Colors.white.withOpacity(0.4),
              width: ScreenUtil().setWidth(70),
              height: ScreenUtil().setHeight(70),
            ),
            Expanded(
              child: Center(
                child: Text(
                  widget.docid.get('quote'),
                  style: GoogleFonts.lacquer(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    fontSize: ScreenUtil().setSp(34),
                  ),
                ),
              ),
            ),
            Text(
                widget.docid.get('author'),
                style: GoogleFonts.dosis(
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.w300,
                  fontSize: ScreenUtil().setSp(26),
                ),
              ),
            const SizedBox(height: 30),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => speak(
                        widget.docid.get('quote')
                    ),
                    style: ButtonStyle(
                      foregroundColor: getColor(_color, Colors.white),
                      backgroundColor: getColor(Colors.white,_color.withOpacity(0.5)),
                    ),
                    child: const Icon(Icons.volume_up_rounded, size: 35),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      FlutterClipboard.copy(widget.docid.get('quote'));
                      Fluttertoast.showToast(msg: "Copied");
                    },
                    style: ButtonStyle(
                      foregroundColor: getColor(_color, Colors.white),
                      backgroundColor: getColor(Colors.white,_color.withOpacity(0.5)),
                    ),
                    child: const Icon(Icons.copy, size: 28),
                  ),
                ],

              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  MaterialStateProperty<Color> getColor(Color color, Color colorPressed){
    final getColor = (Set<MaterialState> states){
      if(states.contains(MaterialState.pressed)){
        return colorPressed;
      }else{
        return color;
      }
    };
    return MaterialStateProperty.resolveWith(getColor);
  }
}