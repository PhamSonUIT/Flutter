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
              Text("Hello Word"),
              // Text(
              //   "Helllo word",
              //   style: TextStyle(fontSize: 24, fontFamily: "Custom"),
              // ), chỉnh trong file pubspec.yaml
              Text(
                'This is Google Fonts',
                style: GoogleFonts.monsieurLaDoulaise(),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 24),
                  children: [
                    TextSpan(text: "Don't have account "),
                    TextSpan(
                      text: "Create account",
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => _launchUrl('https://www.youtube.com/'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
