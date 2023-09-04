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

            Row(
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
            Row(
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
            
            
          ],
        ),
      ),
    );
  }

   latestShowListView( context,  index) {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         InkWell(
           onTap: () {
           },
           child: Container(
             decoration: BoxDecoration(
                 image: DecorationImage(image: NetworkImage("url"), fit: BoxFit.cover),
                 borderRadius: BorderRadius.circular(14)),
             width: 200,
             margin: const EdgeInsets.symmetric(horizontal: 8),
             child: Stack(
               children: [
                 Container(
                   decoration: BoxDecoration(
                       gradient: LinearGradient(
                           begin: Alignment.topCenter,
                           end: Alignment.bottomCenter,
                           stops: const [0.5, 0.8],
                           colors: [
                             Colors.black.withOpacity(0.05),
                             Colors.black.withOpacity(0.7),
                           ]
                       ),
                       borderRadius: BorderRadius.circular(14)
                   ),
                   height: 220,
                   width: Get.width,
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
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           Container(
                             margin: const EdgeInsets.only(bottom: 10),
                             child: Text(
                               "name",
                               maxLines: 2,
                               style: mediumTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),
                             ),
                           ),


                         ],
                       ),
                       Positioned(
                         top: 20,
                         right: 0,
                         child: Image.asset(
                           Res.home_ic,
                           width: 60,
                           height: 60,
                         ),
                       ),

                       Positioned(child: Image.asset(Res.ic_calander,height: 25,width: 25,)),

                     ],
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

}
