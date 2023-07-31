import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase09/utils/firebase_helper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Container(
                      height: 23.h,
                      width: 80.w,
                      child: Image.asset("assets/images/login.png")),
                  SizedBox(height: 15),
                  Text(
                    "Login",
                    style: GoogleFonts.play(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: TextField(
                      controller: txtemail,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      style: GoogleFonts.play(color: Colors.black,fontSize: 20),
                      decoration: InputDecoration(prefixIcon: Icon(CupertinoIcons.mail,color: Colors.black,size: 20),hintText: "Email",hintStyle: GoogleFonts.play(color: Colors.black,fontSize: 20),border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8))),
                    ),
                      width: 75.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),),
                  SizedBox(height: 10),
                  Container(
                    child: TextField(
                      controller: txtpassword,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: Colors.black,
                      style: GoogleFonts.play(color: Colors.black,fontSize: 20),
                      decoration: InputDecoration(prefixIcon: Icon(CupertinoIcons.lock,color: Colors.black,size: 20),hintText: "password",hintStyle: GoogleFonts.play(color: Colors.black,fontSize: 20),border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8)),suffixIcon: Icon(CupertinoIcons.eye_fill,color: Colors.grey,size: 20,)),
                    ),
                    width: 75.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Forget Password?",style: GoogleFonts.play(fontSize: 17,color: Colors.blue)),
                  ),
                  SizedBox(height: 22),
                  InkWell(
                    onTap: () async {
                      var email = txtemail.text;
                      var password= txtpassword.text;
                      var res = await fireBase_Helper.firebase.emailSignIn(email,password);
                      if(res=="Success") {
                        Get.snackbar(
                            "congratulations", "You Sucess Fully Login With Us!");
                        Get.offAndToNamed("viewproduct");
                      }
                      else{
                         Get.snackbar(
                        backgroundGradient: LinearGradient(colors: [Colors.red,Colors.yellow]),
                          icon: Icon(Icons.gpp_good,color: Colors.red),
                            "Please Try Again Later!", "$res");
                      }
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          "Login",
                          style: GoogleFonts.play(
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                      height: 7.h,
                      width: 75.w,
                      decoration: BoxDecoration(color: Color(0xff1317DD),borderRadius: BorderRadius.circular(23)),
                    ),
                  ),
                  SizedBox(height: 22),
                  Text("OR",style: GoogleFonts.play(fontSize: 18,color: Colors.black),),
                  SizedBox(height: 14,),
                  Text("Login With",style: GoogleFonts.play(fontSize: 16,color: Colors.black),),
                  SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(radius: 30,backgroundColor: Colors.white,child: Container(height: 6.h,width: 12.w,child: Image.asset("assets/images/google.png",fit: BoxFit.fitWidth,))),
                      CircleAvatar(radius: 30,backgroundColor: Colors.white,child: Container(height: 6.h,width: 12.w,child: Image.asset("assets/images/facebook.png",fit: BoxFit.fitWidth,))),
                      CircleAvatar(radius: 30,backgroundColor: Colors.white,child: Container(height: 6.h,width: 12.w,child: Image.asset("assets/images/apple.png",fit: BoxFit.fitWidth,))),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don’t have an account?",style: GoogleFonts.play(color: Colors.black,fontSize: 14),),
                        TextButton(onPressed: () {
                          Get.offAndToNamed("register");
                        },child: Text("Register now",style: GoogleFonts.play(color: Color(0xff1317DD),fontSize: 15),)),
                      ],
                    ),
                  ),
                    ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
