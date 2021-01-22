import 'package:cat_task1/Singinpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
TextEditingController emailcontroller = new TextEditingController();
TextEditingController pwcontroller = new TextEditingController();
String a ;
String b ;


  SharedPreferences Prefs;
  Savedata() async {
    Prefs = await SharedPreferences.getInstance();
    Prefs.setString("email", emailcontroller.toString());
    Prefs.setString("password", pwcontroller.toString());

  }
Getdata() async {
    Prefs = await SharedPreferences.getInstance();
    setState(() {
        a = Prefs.get('email');
        b=  Prefs.get('password');
    });
}
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_outlined),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signin()));
                      }),
                ),
                Text("Register to CAT Reloaded",
                    style: GoogleFonts.fredokaOne(
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 25))),
                SizedBox(
                  height: height * 0.02,
                ),

                Textformff(
                  "FullName",
                ),
                Textformff(
                  "Email",
                  emailcontroller ,


                ),
                Textformff("Mobile Number"),
                Textformfp(
                  "password",
                  pwcontroller ,
                ),
                Textformfp("confirm Password"),
                SizedBox(
                  height: height * 0.03,
                ),
                Center(
                  child: Container(
                      width: 350,
                      child: FlatButton(
                        onPressed: () {
                          Savedata();

                        },
                        height: 50,
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        color: Colors.red.shade900,
                      )),
                ),
                SizedBox(height: height * 0.03),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Center(
                      child: Text(
                    "by registering you agree to terms & conditions and privacy policy of the cat",
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Textformff(
    String x, [TextEditingController y]
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: y,
        decoration: InputDecoration(
            labelText: x,
            labelStyle: TextStyle(color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            )),
      ),
    );
  }
  Widget Textformfp(
      String x, [TextEditingController y]
      ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: y,
        obscureText: true,
        decoration: InputDecoration(
            labelText: x,
            labelStyle: TextStyle(color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            )),
      ),
    );
  }
}
