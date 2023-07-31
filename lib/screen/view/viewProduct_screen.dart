import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase09/screen/model/add_product_model.dart';
import 'package:flutterfirebase09/utils/firebase_helper.dart';
import 'package:flutterfirebase09/utils/notification_services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class viewProductScreen extends StatefulWidget {
  const viewProductScreen({super.key});

  @override
  State<viewProductScreen> createState() => _viewProductScreenState();
}

class _viewProductScreenState extends State<viewProductScreen> {
  @override
  Widget build(BuildContext context) {
    List imageList = [
      "https://www.livemint.com/lm-img/img/2023/06/19/1600x900/nothing_phone_2_1686725667419_1687151978565.jpg",
      "https://images.samsung.com/in/smartphones/galaxy-z-flip4/images/galaxy-z-flip4_highlights_kv.jpg",
      "https://sm.mashable.com/mashable_in/photo/default/6dd6d39c-fda7-4629-bd2d-e0142dfbe93b_5v2z.jpg",
      "https://m.media-amazon.com/images/G/31/img21/Wireless/ssserene/AppleNPI/Aplus/r1805_r1595_Product_Page_Flex_Module_Avail_Amazon_Desktop__en-IN_01._CB595156976_.png",
    ];
    CarouselController buttonCarouselController = CarouselController();
    fireBase_Helper fbh = fireBase_Helper();
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      floatingActionButton: FloatingActionButton(
           backgroundColor: Colors.black,
           onPressed: () {
             Get.toNamed("addproduct");
           },
           child: Icon(
             CupertinoIcons.add,
             color: Colors.white,
           )),
      appBar: AppBar(
        backgroundColor: Color(0xffF9F9F9),
        elevation: 0,
        leading: InkWell(onTap: () {
          NotificationServices.notificationservice.soundNotification();
        },
          child: Icon(CupertinoIcons.line_horizontal_3_decrease,
              color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: InkWell(
              onTap: () {
                NotificationServices.notificationservice.bigPictureNotification();
              },
              child: Icon(
                CupertinoIcons.cart_fill,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: fbh.readFireBaseData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              QuerySnapshot querySnapshot = snapshot.data!;
              List<QueryDocumentSnapshot> qdocList = querySnapshot.docs;
              // Map? MapData = {};
              List<addProductModel> productDataList = [];
              for (var x in qdocList) {
                Map MapData = x.data() as Map;
                // MapData = x.data() as Map;
                String id = x.id;
                String name = MapData['name'];
                String price = MapData['price'];
                String description = MapData['description'];
                String offer = MapData['offer'];
                String category = MapData['category'];
                String size = MapData['size'];
                String image = MapData['image'];
                addProductModel model = addProductModel(
                    pprice: price,
                    psize: size,
                    poffer: offer,
                    pcateg: category,
                    pdesc: description,
                    id: id,
                    pname: name,
                   img: image
                );
                productDataList.add(model);
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                        "\t\tHey, User !\n\t\ Get 70% Discount",
                        style: GoogleFonts.play(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            style: GoogleFonts.play(
                                color: Colors.black, fontSize: 20),
                            decoration: InputDecoration(
                                prefixIcon: Icon(CupertinoIcons.search,
                                    color: Colors.black, size: 16),
                                hintText: "Search For Best Offer!",
                                hintStyle: GoogleFonts.play(
                                    color: Colors.black, fontSize: 16),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                          width: 50.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xffF3F4F9)),
                        ),
                        Icon(
                          Icons.filter_list_outlined,
                          color: Colors.black,
                          size: 4.h,
                        )
                      ],
                    ),
                    SizedBox(height: 14),
                    CarouselSlider(
                      disableGesture: true,
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(height: 190.0,autoPlay: true,animateToClosest: true,autoPlayCurve: Curves.easeOutBack,padEnds: true),
                      items: imageList.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                            height: 200,
                            width: 75.w,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),image: DecorationImage( image: NetworkImage("$i")),
                                                              ),
                              ));
                          },
                        );
                      }).toList(),
                    ),

                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Recommended Items",
                              style: GoogleFonts.play(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 230,
                      child: ListView.builder(
                        itemCount: productDataList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(

onLongPress: () {
  fireBase_Helper.firebase.deleteProductInFireBase(productDataList[index].id as String);
},                            child: Container(
                              height: 150,
                              width: 150,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xffFEFEFE),
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 6)
                                ],
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(CupertinoIcons.heart,color: Colors.orangeAccent,size: 25,),
                                      ),
                                    ],
                                  ),
                                    Container(height: 80,width: 120,child: CachedNetworkImage(
                                      imageUrl: "${productDataList[index].img}",
                                      placeholder: (context, url) => Container(
                                        height: 20,
                                        width: 20,
                                        child: LoadingIndicator(
                                          indicatorType: Indicator.ballPulseRise
                                          ,
                                          colors:  [Colors.red,Colors.redAccent,Colors.orange,Colors.orangeAccent,Colors.yellow],
                                          pathBackgroundColor: Colors.yellow,
                                          strokeWidth: 2,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                    ),),
                                  SizedBox(height: 10),
                                  Text("${productDataList[index].pname}",style: GoogleFonts.play(color: Colors.black,fontSize: 14),),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("₹${productDataList[index].pprice}",style: GoogleFonts.play(color: Colors.orangeAccent,fontSize: 17),),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(onTap: () {
                                          Get.toNamed("update",arguments: productDataList[index].id);
                                        },child: Icon(Icons.add,color: Colors.orangeAccent,size: 17)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Top Deals",style: GoogleFonts.play(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 230,
                      child: ListView.builder(
                        itemCount: 20,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 150,
                            width: 150,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xffFEFEFE),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 6)
                              ],
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(CupertinoIcons.heart,color: Colors.orangeAccent,size: 25,),
                                    ),
                                  ],
                                ),
                                Container(height: 80,width: 120,child: Image.network("https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1678371931/Croma%20Assets/Communication/Mobiles/Images/270414_onoxxi.png?tr=w-600 "),),
                                SizedBox(height: 10),
                                Text("Iphone 14 Plus",style: GoogleFonts.play(color: Colors.black,fontSize: 18),),
                                Spacer(),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("₹55,000",style: GoogleFonts.play(color: Colors.orangeAccent,fontSize: 17),),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.add,color: Colors.orangeAccent,size: 17),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                          );
                        },
                      ),
                    ),Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Best Of This Month",style: GoogleFonts.play(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 230,
                      child: ListView.builder(
                        itemCount: 20,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 150,
                            width: 150,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xffFEFEFE),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 6)
                              ],
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(CupertinoIcons.heart,color: Colors.orangeAccent,size: 25,),
                                    ),
                                  ],
                                ),
                                Container(height: 80,width: 120,child: Image.network("https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/u/m/b/-original-imagrdefbw6bhbjr.jpeg?q=70"),),
                                SizedBox(height: 10),
                                Text("Nothing Phone 2",style: GoogleFonts.play(color: Colors.black,fontSize: 15),),
                                Spacer(),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("₹39,999",style: GoogleFonts.play(color: Colors.orangeAccent,fontSize: 17),),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.add,color: Colors.orangeAccent,size: 17),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Top Picks",style: GoogleFonts.play(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 230,
                      child: ListView.builder(
                        itemCount: 20,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 150,
                            width: 150,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xffFEFEFE),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 6)
                              ],
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(CupertinoIcons.heart,color: Colors.orangeAccent,size: 25,),
                                    ),
                                  ],
                                ),
                                Container(height: 80,width: 120,child: Image.network("https://m.media-amazon.com/images/I/61k7BDoL7dL._SL1280_.jpg"),),
                                SizedBox(height: 10),
                                Text("Tecno Phantom X2 5G",style: GoogleFonts.play(color: Colors.black,fontSize: 13),),
                                Spacer(),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("₹22,999",style: GoogleFonts.play(color: Colors.orangeAccent,fontSize: 17),),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.add,color: Colors.orangeAccent,size: 17),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            ));
          },
        ),
      ),
    );
  }
}
