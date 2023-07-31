import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase09/utils/firebase_helper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({super.key});

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController txtemail = TextEditingController();
    TextEditingController txtpassword = TextEditingController();
    return SafeArea(
      child: Scaffold(
          body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(height: 25.h,width: 100.w,child: Image.asset("assets/images/register.png"),),
                  SizedBox(height: 20),
                  Text("Sign Up",style: GoogleFonts.play(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.black,
                      style: GoogleFonts.play(color: Colors.black,fontSize: 20),
                      decoration: InputDecoration(prefixIcon: Icon(CupertinoIcons.person,color: Colors.black,size: 20),hintText: "First Name",hintStyle: GoogleFonts.play(color: Colors.black,fontSize: 20),border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8))),
                    ),
                    width: 75.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),),
                  SizedBox(height: 10),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.black,
                      style: GoogleFonts.play(color: Colors.black,fontSize: 20),
                      decoration: InputDecoration(prefixIcon: Icon(CupertinoIcons.person,color: Colors.black,size: 20),hintText: "Last Name",hintStyle: GoogleFonts.play(color: Colors.black,fontSize: 20),border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8))),
                    ),
                    width: 75.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),),
                  SizedBox(height: 10),
                  Container(
                    child: TextField(controller: txtemail,
                      keyboardType: TextInputType.name,
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
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.black,
                      style: GoogleFonts.play(color: Colors.black,fontSize: 20),
                        decoration: InputDecoration(suffixIcon: Icon(CupertinoIcons.eye_fill,color: Colors.grey),prefixIcon: Icon(CupertinoIcons.lock,color: Colors.black,size: 20),hintText: "Password",hintStyle: GoogleFonts.play(color: Colors.black,fontSize: 20),border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8))),
                    ),
                    width: 75.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),),
                  SizedBox(height: 10),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType .name,
                      cursorColor: Colors.black,
                      style: GoogleFonts.play(color: Colors.black,fontSize: 20),
                      decoration: InputDecoration(suffixIcon: Icon(CupertinoIcons.eye_fill,color: Colors.grey),prefixIcon: Icon(CupertinoIcons.lock,color: Colors.black,size: 20),hintText: "Confirm Password",hintStyle: GoogleFonts.play(color: Colors.black,fontSize: 20),border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8))),
                    ),
                    width: 75.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Get.offAndToNamed('login');
                      var email = txtemail.text;
                      var password= txtpassword.text;
                      fireBase_Helper.firebase.crateUserWithEmail(email, password);
                     },
                    child: Container(
                      child: Center(
                        child: Text(
                          "SingUp",
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
                  SizedBox(height: 2.h),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already Have Acount?",style: GoogleFonts.play(color: Colors.black,fontSize: 18),),
                        TextButton(onPressed: () {
                          Get.offAndToNamed("login");
                        },child: Text("Login",style: GoogleFonts.play(color: Color(0xff1317DD),fontSize: 18),)),
                      ],
                    ),
                  ),
                  SizedBox(height:10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
