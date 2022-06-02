import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lko_task/modal/marketing.dart';
import 'package:lko_task/modal/millinnium.dart';
import 'package:lko_task/modal/trandingmodal.dart';
import 'package:lko_task/modal/trending.dart';

class Video_Library extends StatefulWidget {
  const Video_Library({Key? key}) : super(key: key);

  @override
  State<Video_Library> createState() => _Video_LibraryState();
}

class _Video_LibraryState extends State<Video_Library> {
  // List<Data> userArr = [];
  // var Data
  List<MillinniumModal> millinniumData = [];
  List<TrandingModal> trandingData = [];
  List<MarketingModal> marketingData = [];

  StreamController<bool> millinniumStreamController = StreamController();
  StreamController<bool> trandingStreamController = StreamController();
  StreamController<bool> marketingStreamController = StreamController();
  String imagePath = "";
  String imagePath1 = "";

  var all;

  @override
  void initState() {
    super.initState();
    millinniumApiCall();
    trendingApiCall();
    marketingApiCall();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/Rectangle 1298.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
          bottomNavigationBar: BottomNavBarRaisedInsetFb1(),
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              children: [
                Image.asset("images/video.png"),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Video Library",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            actions: [
              Row(
                children: [
                  Image.asset(
                    "images/bell-svgrepo-com.png",
                    scale: 1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "images/market-basket-svgrepo-com.png",
                    scale: 1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "images/Group 766.png",
                    scale: 1,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 110,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: TextField(
                      decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white24,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintText: "Search Video",
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Text(
                            "Categories",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Text(
                            "Learning Tracks",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30, bottom: 20),
                  child: Text(
                    "New to Millennium +",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                StreamBuilder<bool>(
                    stream: millinniumStreamController.stream,
                    initialData: false,
                    builder: (context, snapShot) {
                      if (millinniumData.isEmpty) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Container(
                            height: 200,
                            child: ListView.builder(
                                itemCount: millinniumData.length,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  MillinniumModal item = millinniumData[index];
                                  return Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 20),
                                        height: 200,
                                        width: 130,
                                        // color: Colors.white,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border.all(
                                              color: Colors.transparent,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image(
                                            image: NetworkImage(
                                              "${item.imagePath}${item.image}",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      // Text(userArr!.data![index].vlTitle.toString())
                                    ],
                                  );
                                }),
                          ),
                        );
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30, bottom: 20),
                  child: Text(
                    "Trending Now",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                StreamBuilder<bool>(
                    stream: trandingStreamController.stream,
                    initialData: false,
                    builder: (context, snapShot) {
                      if (trandingData.isEmpty) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Container(
                            height: 200,
                            child: ListView.builder(
                                itemCount: trandingData.length,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  TrandingModal item = trandingData[index];
                                  return Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 20),
                                        height: 200,
                                        width: 130,
                                        // color: Colors.white,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border.all(
                                              color: Colors.transparent,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image(
                                            image: NetworkImage(
                                              "$imagePath${item.mobileVlThumb}",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      // Text(userArr!.data![index].vlTitle.toString())
                                    ],
                                  );
                                }),
                          ),
                        );
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30, bottom: 20),
                  child: Text(
                    "Marketing",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                StreamBuilder<bool>(
                    stream: marketingStreamController.stream,
                    initialData: false,
                    builder: (context, snapShot) {
                      if (marketingData.isEmpty) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Container(
                            height: 200,
                            child: ListView.builder(
                                itemCount: marketingData.length,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  MarketingModal item = marketingData[index];
                                  return Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 20),
                                        height: 200,
                                        width: 130,
                                        // color: Colors.white,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border.all(
                                              color: Colors.transparent,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image(
                                            image: NetworkImage(
                                              "$imagePath1${item.videoLibraries![index].mobileVlThumb}",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      // Text(userArr!.data![index].vlTitle.toString())
                                    ],
                                  );
                                }),
                          ),
                        );
                      }
                    }),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ));
  }

  millinniumApiCall() async {
    var allData = await http.get(Uri.parse(
        "https://www.remaxmillennium.ca/portal/Api/dashboard/recent_video"));
    var data = jsonDecode(allData.body)["data"]["data"];
    // print(data);

    if (data != null) {
      for (var item in data) {
        millinniumData.add(MillinniumModal.fromJson(item));
      }
      millinniumStreamController.sink.add(true);
    }
    // print(alldata.data!.data!.length);
  }

  trendingApiCall() async {
    var allData = await http.get(Uri.parse(
        "https://www.remaxmillennium.ca/portal/Api/api/get_video_libraries"));
    var data = jsonDecode(allData.body);
    imagePath = data["vl_thumb_base_path"];
    var list = data["data"]["video_libraries"];

    if (list != null) {
      for (var item in list) {
        trandingData.add(TrandingModal.fromJson(item));
      }
      trandingStreamController.sink.add(true);
    }
    // print(alldata.data!.data!.length);
  }

  marketingApiCall() async {
    var allData = await http.get(Uri.parse(
        "https://www.remaxmillennium.ca/portal/Api/api/get_video_library_with_category"));
    var data = jsonDecode(allData.body);
    imagePath1 = data["vl_thumb_base_path"];
    var list = data["data"]["library_category"];

    if (list != null) {
      for (var item in list) {
        marketingData.add(MarketingModal.fromJson(item));
      }
      marketingStreamController.sink.add(true);
    }
    // print(alldata.data!.data!.length);
  }
}

class BottomNavBarRaisedInsetFb1 extends StatefulWidget {
  const BottomNavBarRaisedInsetFb1({Key? key}) : super(key: key);

  @override
  _BottomNavBarRaisedInsetFb1State createState() =>
      _BottomNavBarRaisedInsetFb1State();
}

class _BottomNavBarRaisedInsetFb1State
    extends State<BottomNavBarRaisedInsetFb1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 56;

    final primaryColor = Colors.blue;
    final secondaryColor = Colors.black54;
    final accentColor = const Color(0xffffffff);
    final backgroundColor = Colors.white;

    final shadowColor = Colors.grey; //color of Navbar shadow
    double elevation = 100; //Elevation of the bottom Navbar

    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, height),
            painter: BottomNavCurvePainter(
                backgroundColor: backgroundColor,
                shadowColor: shadowColor,
                elevation: elevation),
          ),
          Center(
            heightFactor: 0.12,
            child: FloatingActionButton(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 6, 51, 87),
                  size: 55,
                ),
                elevation: 0.1,
                onPressed: () {}),
          ),
          Container(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    child: Image.asset("images/Group 927.png"),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    child: Image.asset("images/Group 926.png"),
                  ),
                ),
                SizedBox(width: 56),
                InkWell(
                  onTap: () {},
                  child: Container(
                    child: Image.asset("images/Group 925.png"),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    child: Image.asset("images/building-svgrepo-com.png"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavCurvePainter extends CustomPainter {
  BottomNavCurvePainter(
      {this.backgroundColor = Colors.white,
      this.insetRadius = 30,
      this.shadowColor = Colors.grey,
      this.elevation = 100});

  Color backgroundColor;
  Color shadowColor;
  double elevation;
  double insetRadius;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path();

    double insetCurveBeginnningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;

    path.lineTo(insetCurveBeginnningX, 0);
    path.arcToPoint(Offset(insetCurveEndX, 0),
        radius: Radius.circular(100), clockwise: true);

    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height + 56);
    path.lineTo(
        0,
        size.height +
            56); //+56 here extends the navbar below app bar to include extra space on some screens (iphone 11)
    canvas.drawShadow(path, shadowColor, elevation, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// class NavBarIcon extends StatelessWidget {
//   const NavBarIcon(
//       {Key? key,
//       required this.text,
//       required this.icon,
//       required this.selected,
//       required this.onPressed,
//       this.selectedColor = const Color(0xffFF8527),
//       this.defaultColor = Colors.black54})
//       : super(key: key);
//   final String text;
//   final IconData icon;
//   final bool selected;
//   final Function() onPressed;
//   final Color defaultColor;
//   final Color selectedColor;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         IconButton(
//           onPressed: onPressed,
//           splashColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//           icon: Icon(
//             icon,
//             size: 25,
//             color: selected ? selectedColor : defaultColor,
//           ),
//         ),
//       ],
//     );
//   }
// }
