import 'package:cat_task1/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Signuppage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
TextEditingController Semailcontroller = new TextEditingController();
TextEditingController Spasswordcontroller = new TextEditingController();
SharedPreferences Prefs ;
String a ;
String b ;
Getdata() async {
  Prefs = await SharedPreferences.getInstance();
  setState(() {
    a = Prefs.get('email');
    b=  Prefs.get('password');
  });
}  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: ListView(
          children: [
            Column(
              children: [

                SizedBox( height: hight*0.1,),
               Stack(
                 children: [
                   CircleAvatar(
                     radius: 35.0,
                     backgroundImage: AssetImage("images/catreloaded.jpg"),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(top: 30 , right: 30 , left:  30),
                     child: Container(
                       color: Colors.white,
                       width: width*0.2,
                       height: hight*0.06 ,
                       child: Column(
                         children: [
                           Text(
                             "CAT" , style: TextStyle(color: Colors.red.shade900, fontSize: 35 , fontWeight: FontWeight.bold),
                           ),
                         ],
                       )

                     ),
                   ),



                 ],
               ),
                Text("reloaded" , style: GoogleFonts.pacifico( textStyle: TextStyle( fontSize: 25 , fontWeight: FontWeight.bold)) ,),
                SizedBox(
                  height: hight*0.1,
                ),


                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width*0.4,
                      height: hight*0.06,
                      child: OutlineButton.icon(
                        onPressed: () {},
                        label: Text(
                          "facebook",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        icon: Icon(
                          FontAwesomeIcons.facebook,
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width*0.06 ,
                    ),
                    Container(
                      width: width*0.4,
                      height: hight*0.06,
                      child: OutlineButton.icon(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.google ),
                          label: Text(
                            "Google",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          )),
                    ),
                  ],
                ),
                SizedBox(height: hight*0.03,),
                Text("or" , style: TextStyle(color: Colors.grey , fontSize: 20),),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child:
                      TextFormField(
                        controller: Semailcontroller,
                        decoration: InputDecoration(
                            labelText: ('Email ID' ) ,
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 15 , right: 15 , top: 15),
                  child: TextFormField(
                    controller: Spasswordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'password',
                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 250 , top: 10 , bottom: 30),
                  child: GestureDetector(child: Text("Forgot Password?" , style: TextStyle(color: Colors.black , fontSize: 16 , fontWeight: FontWeight.bold),) ,onTap: (){},),
                ),
                Container(
                    width: 350,
                    child: FlatButton(onPressed: (){
                      if( a == Semailcontroller || b == Spasswordcontroller){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));

                      }
                      else{
                        SnackBarAction(
                          label: " something went wrong",
                        );
                      }
                    }, height: 50, child: Text("Login" , style: TextStyle( color: Colors.white , fontWeight: FontWeight.bold , fontSize: 17 ),) , color: Colors.red.shade900, )) ,

                SizedBox(
                  height: hight*0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? " , style: TextStyle(color: Colors.black),),
                    GestureDetector(
                      child: Text(" Register Now "),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                      },
                    )
                  ],
                ),



              ],
            )

          ],
        ),
      ),
    );
  }
}
