import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
  body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.amber, Colors.red, Colors.blue],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            ),
            border: Border.all(width: 2, color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Container(
              height: 48,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hello Word"),
                  Icon(
                    Icons.android,
                    color: Colors.white,
                  ),
                ],
              ),
              // color: Colors.amber,
            ),
          ),
        ),

        // Text(
        //   "Helllo word",
        //   style: TextStyle(fontSize: 24, fontFamily: "Custom"),
        // ), chỉnh trong file pubspec.yaml
        Text(
          'This is Google Fonts',
          style: GoogleFonts.monsieurLaDoulaise(),
        ),
        Card(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 24),
              children: [
                TextSpan(text: "Don't have account "),
                TextSpan(
                  text: "Create account",
                  style: TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () =>
                        _launchUrl('https://www.youtube.com/'),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 200,
          height: 200,
          child: Image(
          image: AssetImage("./assets/image/con_bo.png"),
          filterQuality:FilterQuality.high,
          // image: NetworkImage(
          //   "https://scontent.fhan4-5.fna.fbcdn.net/v/t39.30808-6/494799991_2190117964776246_1262403563128055906_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeGU6Deg-sJV79mhIdemhSzpVBZ4XcDxebNUFnhdwPF5s24vPjH_ZRLXq9HuSYDa1QwrKXmKnI2zhBjd-U4FhjTv&_nc_ohc=iDmQuBLEf7oQ7kNvwEd_iUF&_nc_oc=Adl8taXd9NmMvDkhYrusfq51tOtBsSZnUGaetoY1p9MKTQoVugD8uUJM1Gr_vnqNTOo&_nc_zt=23&_nc_ht=scontent.fhan4-5.fna&_nc_gid=vZlSDbpeZu4iD1gdVLcvXg&oh=00_Afa_NV_9l62zbcdvyZ9xrbDav9psE8gD21kKnW0b1NGBvA&oe=68BDEF21",
          // ),
          fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  ),
),
    );
  }
}
