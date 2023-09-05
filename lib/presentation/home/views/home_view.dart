import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructure/theme/colors.theme.dart';
import '../../../infrastructure/theme/text.theme.dart';
import '../../../res.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<BaseHomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Res.icBgImage), fit: BoxFit.cover)),
              child: Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: Get.width / 0.9,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: const [
                        0.5,
                        0.8
                      ], colors: [
                        Colors.black.withOpacity(0.05),
                        Colors.black.withOpacity(0.9),
                      ]),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 15,
                    right: 15,
                    top: 0,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 120,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  gradient: LinearGradient(
                                    begin: Alignment(0.978, -0.2083),
                                    end: Alignment(-0.2049, 0.978),
                                    colors: [
                                      Color(0x3AFFFFFF), // Transparent color with 22% opacity
                                      Color(0x12FFFFFF), // Transparent color with 7% opacity
                                    ],
                                    stops: [-0.0021, 1.0487], // -0.21% and 104.87% stops
                                  )
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Play",
                                  style: TextStyle(
                                    fontSize: dimen16,
                                    color: ColorsTheme.colWhite,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Taiwan Excellence Gaming Cup 2022",
                                style: mediumTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Pokémon | Gods Reign",
                                style: regularTextStyle(fontSize: dimen14, color: ColorsTheme.colWhite),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          right: 10,
                          left: 10,
                          top: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                Res.icMenu,
                                width: 20,
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    Res.icCamera,
                                    width: 20,
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    Res.icSearch,
                                    width: 20,
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    Res.icBell,
                                    width: 20,
                                    height: 20,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Matches",
                    maxLines: 1,
                    style: mediumTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),
                  ),
                  Text(
                    "View all",
                    maxLines: 1,
                    style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colWhite),
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  cacheExtent: double.maxFinite,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return latestMatchesListView(
                      context,
                      index,
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest show",
                    maxLines: 1,
                    style: mediumTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),
                  ),
                  Text(
                    "View all",
                    maxLines: 1,
                    style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colWhite),
                  ),
                ],
              ),
            ),
            Container(
              height: 300,
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  cacheExtent: double.maxFinite,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return latestShowListView(
                      context,
                      index,
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trending Clips",
                    maxLines: 1,
                    style: mediumTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),
                  ),
                  Text(
                    "View all",
                    maxLines: 1,
                    style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colWhite),
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  cacheExtent: double.maxFinite,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return trendingShowListView(
                      context,
                      index,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  latestShowListView(context, index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: const [
                0.5,
                0.8
              ], colors: [
                Colors.black.withOpacity(0.05),
                Colors.black.withOpacity(0.7),
              ]),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4eR20DNfWQG0k0gzAuqxM1lW-2bpzd1HrdVTZG8rdWIhDxTLSDPgDdO09ZXbTBq3YEoo&usqp=CAU"),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(14)),
          height: 220,
          width: 190,
        ),
        Text(
          "PubgMobile India",
          maxLines: 1,
          style: mediumTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),
        ),
        Text(
          "95.9k Views",
          maxLines: 1,
          style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colWhite),
        ),
      ],
    );
  }

  latestMatchesListView(context, index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              // image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80"), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(14)),
          width: Get.width - 50,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: LinearGradient(
                    begin: Alignment(0.978, -0.2083),
                    end: Alignment(-0.2049, 0.978),
                    colors: [
                      Color(0x481A2A3A), // Transparent color with 28% opacity
                      Color(0xFF1C1C29), // Solid color
                    ],
                    stops: [-0.0021, 1.0487], // -0.21% and 104.87% stops
                  ),
                ),
                height: 250,
                width: Get.width,
              ),
              Positioned(
                right: 10,
                left: 10,
                top: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(

                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.978, -0.2083),
                            end: Alignment(-0.2049, 0.978),
                            colors: [
                              Color(0x3AFFFFFF), // Transparent color with 22% opacity
                              Color(0x12FFFFFF), // Transparent color with 7% opacity
                            ],
                            stops: [-0.0021, 1.0487], // -0.21% and 104.87% stops
                          ),
                         borderRadius: const BorderRadius.all(Radius.circular(10))),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Velorant",
                            style: boldTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "name",
                        style: mediumTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                left: 10,
                top: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      Res.image1,
                      width: 70,
                      height: 70,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "2:0",
                        style: boldTextStyle(fontSize: dimen20, color: ColorsTheme.colWhite),
                      ),
                    ),
                    Image.asset(
                      Res.image_spots,
                      width: 70,
                      height: 70,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 80,
                right: 15,
                left: 15,
                child: Text(
                  "PubgMobile ",
                  maxLines: 1,
                  style: mediumTextStyle(fontSize: dimen14, color: ColorsTheme.colWhite),
                ),
              ),
              Positioned(
                bottom: 50,
                right: 15,
                left: 15,
                child: Text(
                  "PubgMobile ",
                  maxLines: 1,
                  style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colWhite),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 40,
                // left: 40,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.978, -0.2083),
                        end: Alignment(-0.2049, 0.978),
                        colors: [
                          Color(0x3AFFFFFF), // Transparent color with 22% opacity
                          Color(0x12FFFFFF), // Transparent color with 7% opacity
                        ],
                        stops: [-0.0021, 1.0487], // -0.21% and 104.87% stops
                      ), borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${'Play'.tr}',
                        style: boldTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  trendingShowListView(context, index) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(14)),
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: const [
                  0.5,
                  0.8
                ], colors: [
                  Colors.black.withOpacity(0.05),
                  Colors.black.withOpacity(0.7),
                ]),
                borderRadius: BorderRadius.circular(14)),
            height: 280,
            width: Get.width,
          ),
          Positioned(
            bottom: 5,
            right: 0,
            left: 10,
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: ColorsTheme.colBlack,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  margin: const EdgeInsets.all(5),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4eR20DNfWQG0k0gzAuqxM1lW-2bpzd1HrdVTZG8rdWIhDxTLSDPgDdO09ZXbTBq3YEoo&usqp=CAU",
                        fit: BoxFit.fill,
                      )),
                ),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Gods Ember",
                      style: mediumTextStyle(fontSize: dimen13, color: ColorsTheme.colWhite),
                    ),
                    Text(
                      "95k",
                      style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colWhite),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
