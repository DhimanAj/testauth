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
      backgroundColor: Colors.black54,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: Get.width,
                  height: Get.width / 1.2,
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
                      image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4eR20DNfWQG0k0gzAuqxM1lW-2bpzd1HrdVTZG8rdWIhDxTLSDPgDdO09ZXbTBq3YEoo&usqp=CAU"), fit: BoxFit.fill)
                      // image: DecorationImage(image: AssetImage(Res.intro_bg), fit: BoxFit.cover)
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
                                color: ColorsTheme.colBlack, borderRadius: const BorderRadius.all(Radius.circular(10))),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '${'Log in'.tr} →',
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
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              "name",
                              style: mediumTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),
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
                              Res.home_ic,
                              width: 20,
                              height: 20,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  Res.home_ic,
                                  width: 20,
                                  height: 20,
                                ),
                                Image.asset(
                                  Res.home_ic,
                                  width: 20,
                                  height: 20,
                                ),
                                Image.asset(
                                  Res.home_ic,
                                  width: 20,
                                  height: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          child: Image.asset(
                        Res.ic_calander,
                        height: 25,
                        width: 25,
                      )),
                    ],
                  ),
                ),
              ],
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
              height: 300,
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
              height: 220,
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
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: const [
                0.5,
                0.8
              ], colors: [
                Colors.black.withOpacity(0.05),
                Colors.black.withOpacity(0.7),
              ]),
              image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4eR20DNfWQG0k0gzAuqxM1lW-2bpzd1HrdVTZG8rdWIhDxTLSDPgDdO09ZXbTBq3YEoo&usqp=CAU"), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(14)),
          height: 220,
          width: 140,
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
        InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80"), fit: BoxFit.cover),
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
                  height: 220,
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
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "name",

                          style: mediumTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),
                        ),
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
                  top: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        Res.home_ic,
                        width: 20,
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "name",

                          style: mediumTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),
                        ),
                      ),
                      Image.asset(
                        Res.home_ic,
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 10,
                  left: 10,
                  top: 100,
                  child: Text(
                    "PubgMobile Indiadsdfsdfsfdsfdsfsdf",
                    maxLines: 1,
                    style: mediumTextStyle(fontSize: dimen14, color: ColorsTheme.colWhite),
                  ),
                ),
                Positioned(
                  right: 10,
                  left: 10,
                  top: 120,
                  child: Text(
                    "PubgMobile Indiadsdfsdfsfdsfdsfsdf",
                    maxLines: 1,
                    style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colWhite),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 40,
                  left: 40,
                  child:   Container(
                    width: 80,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        color: ColorsTheme.colBlack, borderRadius: const BorderRadius.all(Radius.circular(10))),
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

  trendingShowListView(context, index) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80"), fit: BoxFit.cover),
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
            height: 220,
            width: Get.width,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
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
                      "name",
                      style: mediumTextStyle(fontSize: dimen13, color: ColorsTheme.colWhite),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    Text(
                      "name",
                      style: regularTextStyle(fontSize: dimen13, color: ColorsTheme.colWhite),
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
