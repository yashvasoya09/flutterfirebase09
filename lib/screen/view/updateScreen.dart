import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase09/screen/model/add_product_model.dart';
import 'package:flutterfirebase09/utils/firebase_helper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

String? id;

class updateProductScreen extends StatefulWidget {
  const updateProductScreen({super.key});

  @override
  State<updateProductScreen> createState() => _updateProductScreenState();
}

class _updateProductScreenState extends State<updateProductScreen> {
  TextEditingController txtpname = TextEditingController();
  TextEditingController txtpprice = TextEditingController();
  TextEditingController txtpdesc = TextEditingController();
  TextEditingController txtpcateg = TextEditingController();
  TextEditingController txtpoffer = TextEditingController();
  TextEditingController txtpsize = TextEditingController();
  TextEditingController txtimg = TextEditingController();
  @override
  void initState() {
    super.initState();
    addProductModel model = Get.arguments;
    id = model.id;

     txtpname = TextEditingController(text: model.pname);
     txtpprice = TextEditingController(text: model.pprice);
     txtpdesc = TextEditingController(text: model.pdesc);
     txtpcateg = TextEditingController(text: model.pcateg);
     txtpoffer = TextEditingController(text: model.poffer);
     txtpsize = TextEditingController(text: model.psize);
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Update Your Product",style: GoogleFonts.play()),backgroundColor: CupertinoColors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TextField(
                        controller: txtpname,
                        keyboardType: TextInputType.name,
                        cursorColor: Colors.black,
                        style: GoogleFonts.play(color: Colors.black,fontSize: 20),
                        decoration: InputDecoration(prefixIcon: Icon(CupertinoIcons.cube_box,color: Colors.black,size: 20),hintText: "Product Name",hintStyle: GoogleFonts.play(color: Colors.black,fontSize: 20),border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8))),
                      ),
                      width: 75.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TextField(
                        controller: txtpprice,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        style: GoogleFonts.play(color: Colors.black,fontSize: 20),
                        decoration: InputDecoration(prefixIcon: Icon(CupertinoIcons.money_dollar,color: Colors.black,size: 20),hintText: "Product Price",hintStyle: GoogleFonts.play(color: Colors.black,fontSize: 20),border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8))),
                      ),
                      width: 75.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 75.w,
                      child: TextField(
                        controller: txtpdesc,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,maxLines: 4,
                        style: GoogleFonts.play(color: Colors.black,fontSize: 20),
                        maxLength: 200,
                        decoration: InputDecoration(hintText: "Product Description",hintStyle: GoogleFonts.play(color: Colors.black,fontSize: 20),border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8))),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TextField(
                        controller: txtimg,
                        keyboardType: TextInputType.url,
                        cursorColor: Colors.black,
                        style: GoogleFonts.play(color: Colors.black,fontSize: 20),
                        decoration: InputDecoration(prefixIcon: Icon(CupertinoIcons.photo,color: Colors.black,size: 20),hintText: "Product Image Link",hintStyle: GoogleFonts.play(color: Colors.black,fontSize: 20),border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8))),
                      ),
                      width: 75.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TextField(
                        controller: txtpcateg,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        style: GoogleFonts.play(color: Colors.black,fontSize: 20),
                        decoration: InputDecoration(prefixIcon: Icon(CupertinoIcons.list_bullet,color: Colors.black,size: 20),hintText: "Product Category",hintStyle: GoogleFonts.play(color: Colors.black,fontSize: 20),border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8))),
                      ),
                      width: 75.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TextField(
                        controller: txtpoffer,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        style: GoogleFonts.play(color: Colors.black,fontSize: 20),
                        decoration: InputDecoration(prefixIcon: Icon(CupertinoIcons.percent ,color: Colors.black,size: 20),hintText: "Product Offer",hintStyle: GoogleFonts.play(color: Colors.black,fontSize: 20),border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8))),
                      ),
                      width: 75.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TextField(
                        controller: txtpsize,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        style: GoogleFonts.play(color: Colors.black,fontSize: 20),
                        decoration: InputDecoration(prefixIcon: Icon(CupertinoIcons.fullscreen,color: Colors.black,size: 20),hintText: "Product Size",hintStyle: GoogleFonts.play(color: Colors.black,fontSize: 20),border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8))),
                      ),
                      width: 75.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),),
                  ),
                  SizedBox(height: 15),
                  InkWell(onTap: () {
                    addProductModel model =addProductModel(id: id,pname: txtpname.text,pprice: txtpprice.text,pdesc: txtpdesc.text,pcateg: txtpcateg.text,poffer: txtpoffer.text,psize: txtpsize.text,img: txtimg.text);
                    fireBase_Helper.firebase.updateProductInFireBase(model);
                    Get.toNamed("viewproduct");
                  },child: Container(child: Center(child: Text('Update Product',style: GoogleFonts.play(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold))),height: 8.h,width: 75.w,decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(20)))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
