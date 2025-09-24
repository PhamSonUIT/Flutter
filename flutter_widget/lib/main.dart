// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(MyApp());
// }

// class UserInfo extends StatelessWidget {
//   const UserInfo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   Future<void> _launchUrl(String url) async {
//     final Uri uri = Uri.parse(url);
//     if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final controler = ScrollController();
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               DecoratedBox(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.amber, Colors.red, Colors.blue],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomRight,
//                   ),
//                   border: Border.all(width: 2, color: Colors.black),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 20,
//                     horizontal: 30,
//                   ),
//                   child: Container(
//                     height: 48,
//                     width: 100,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("Hello Word"),
//                         Icon(Icons.android, color: Colors.white),
//                       ],
//                     ),
//                     // color: Colors.amber,
//                   ),
//                 ),
//               ),

//               // Text(
//               //   "Helllo word",
//               //   style: TextStyle(fontSize: 24, fontFamily: "Custom"),
//               // ), chỉnh trong file pubspec.yaml
//               Text(
//                 'This is Google Fonts',
//                 style: GoogleFonts.monsieurLaDoulaise(),
//               ),
//               Card(
//                 child: RichText(
//                   text: TextSpan(
//                     style: TextStyle(color: Colors.black, fontSize: 24),
//                     children: [
//                       TextSpan(text: "Don't have account "),
//                       TextSpan(
//                         text: "Create account",
//                         style: TextStyle(color: Colors.blue),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () =>
//                               _launchUrl('https://www.youtube.com/'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 200,
//                 height: 200,
//                 child: Image(
//                   image: AssetImage("./assets/image/con_bo.png"),
//                   filterQuality: FilterQuality.high,
//                   // image: NetworkImage(
//                   //   "https://scontent.fhan4-5.fna.fbcdn.net/v/t39.30808-6/494799991_2190117964776246_1262403563128055906_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeGU6Deg-sJV79mhIdemhSzpVBZ4XcDxebNUFnhdwPF5s24vPjH_ZRLXq9HuSYDa1QwrKXmKnI2zhBjd-U4FhjTv&_nc_ohc=iDmQuBLEf7oQ7kNvwEd_iUF&_nc_oc=Adl8taXd9NmMvDkhYrusfq51tOtBsSZnUGaetoY1p9MKTQoVugD8uUJM1Gr_vnqNTOo&_nc_zt=23&_nc_ht=scontent.fhan4-5.fna&_nc_gid=vZlSDbpeZu4iD1gdVLcvXg&oh=00_Afa_NV_9l62zbcdvyZ9xrbDav9psE8gD21kKnW0b1NGBvA&oe=68BDEF21",
//                   // ),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// --------------
// Flutter form

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _query = '';
  String _result = '0';
  bool isValid = false;

  void _onButtonPress(String value) {
    setState(() {
      if (value == '=') {
        _calculateResult();
      } else if (value == 'C') {
        _query = '';
        _result = '0';
      } else {
        _query += value;
      }
    });
  }

  void _calculateResult() {
    try {
      // Very basic evaluation logic.
      // This can be expanded to handle more complex expressions.
      // Note: A more robust solution would use a dedicated math expression parser.
      final expression = _query.replaceAll('x', '*');
      final parts = expression.split(RegExp(r'(\+|\-|\*)'));
      final operators = expression
          .split(RegExp(r'[0-9]+'))
          .where((e) => e.isNotEmpty)
          .toList();
      if (parts.length < 2) {
        _result = expression;
        return;
      }

      double currentResult = double.parse(parts[0]);

      for (int i = 0; i < operators.length; i++) {
        final operator = operators[i];
        final nextNumber = double.parse(parts[i + 1]);

        if (operator == '+') {
          currentResult += nextNumber;
        } else if (operator == '-') {
          currentResult -= nextNumber;
        } else if (operator == '*') {
          currentResult *= nextNumber;
        }
      }
      _result = currentResult.toString();
      _query = _result;
    } catch (e) {
      _result = 'Error';
      _query = '';
    }
  }
  bool isAcepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        _query = value;
                        if (value.length > 0) {
                          isValid = true;
                          setState(() {});
                        } else {
                          isValid = false;
                          setState(() {});
                        }
                      },
                      validator: (value) {
                        if ((value!.length >= 8)) {
                          return null;
                        }
                        return 'Do dai chua du 8';
                      },
                      autovalidateMode: AutovalidateMode.always,
                      initialValue: '',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,

                        fillColor: _query.length >= 8 ? Colors.green : Colors.amber,
                        hintText: 'Nhap username ua ban',
                        label: Text('Username'),
                        prefixIcon: Icon(Icons.supervised_user_circle),
                        suffixIcon: Icon(
                          Icons.check,
                          color: !isValid ? Colors.red : Colors.green,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _result,
                      style: const TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            DropdownButtonFormField(items: [

              DropdownMenuItem(child: Text("item1"), value: "1",),
              DropdownMenuItem(child: Text("item2"), value: "2",),
              DropdownMenuItem(child: Text("item3"), value: "3",),
            ], onChanged: (value){}),
            CheckboxListTile(value: isAcepted, onChanged: (value){
              setState(() {
                isAcepted = value ?? false;
              });
            })
            // RadioListTile()
            // SwitchListTile()
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(shape: const CircleBorder()),
        onPressed: () => _onButtonPress(text),
        child: Text(text, style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}
