import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../infrastructure/theme/colors.theme.dart';
import '../../../infrastructure/theme/text.theme.dart';
import '../../../res.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<BaseHomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Column(
        children: [
          Container(
            // height: 80,

            padding: EdgeInsets.only(top: 50, bottom: 20),
            color: Colors.blueGrey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.back(result: true);
                                  },
                                  child: Icon(
                                    size: 30,
                                    Icons.ac_unit,
                                    color: ColorsTheme.colWhite,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Hello",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: regularTextStyle(
                                  fontSize: dimen14,
                                  color: ColorsTheme.colWhite,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 10),
                            child: Text(
                              "Ajay",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: regularTextStyle(
                                fontSize: dimen18,
                                color: ColorsTheme.colWhite,
                              ),
                            ),
                          ),
                        ]),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(Res.ic_profile_black)),
                                color: ColorsTheme.col797D7F,
                                shape: BoxShape.circle),
                          )),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: ColorsTheme.colWhite,
                      borderRadius: BorderRadius.circular(40)),
                  margin: const EdgeInsets.only(
                      left: 16, right: 16, top: 20, bottom: 20),
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 15),
                        child: Image.asset(
                          Res.iconSearch,
                          height: 20,
                          width: 20,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: regularTextStyle(
                                fontSize: dimen14, color: ColorsTheme.colHint),
                          ),
                          readOnly: true,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 60,
                    child: Obx(
                      () => ListView.builder(
                          itemCount: controller.nextSevenDays.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          physics: const ScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  children: [
                                    Text(
                                      DateFormat('EE')
                                          .format(
                                              controller.nextSevenDays[index])
                                          .substring(0, 2)
                                          .toUpperCase(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: regularTextStyle(
                                        fontSize: dimen12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Container(
                                          width: 40,
                                          height: 40,

                                          color:
                                              index ==
                                                      0
                                                  ? Colors.blueGrey.shade700
                                                  : Colors.white,
                                          child: Center(
                                            child: Text(
                                              controller
                                                  .nextSevenDays[index].day
                                                  .toString(),
                                              style: regularTextStyle(
                                                fontSize: dimen12,
                                                color: index ==
                                                        0
                                                    ? Colors.white
                                                    : Colors.blueGrey,
                                              ),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            );
                          }),
                    )),
              ],
            ),
          ),
          Container(
              width: double.maxFinite,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "DOCTORS NEARBY",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: regularTextStyle(
                            fontSize: dimen12,
                            color: ColorsTheme.colPrimary,
                          ),
                        ),
                        Text(
                          "See all",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: regularTextStyle(
                            fontSize: dimen12,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Image.asset(
                                  Res.ic_pulse,
                                  height: 70,
                                  width: 70,
                                ),
                                Text(
                                  "Covid-19",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: regularTextStyle(
                                    fontSize: dimen12,
                                    color: ColorsTheme.colBlack,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              )),
          const Divider(
            height: 10,
            color: Colors.transparent,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  return dailyReport(context, index);
                }),
          ),
        ],
      ),
    );
  }

  dailyReport(context, index) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                Visibility(
                  visible: index == 0 ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "DOCTORS NEARBY",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: regularTextStyle(
                            fontSize: dimen12,
                            color: ColorsTheme.colPrimary,
                          ),
                        ),
                        Text(
                          "See all",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: regularTextStyle(
                            fontSize: dimen12,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Symptons of covid to watch out for",
                            style: regularTextStyle(
                              fontSize: dimen14,
                              color: ColorsTheme.colBlack,
                            ),
                          ),
                          Text(
                            "march 07",
                            style: regularTextStyle(
                              fontSize: dimen12,
                              color: ColorsTheme.colHint,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          color: ColorsTheme.colHint,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg"),
                              fit: BoxFit.fill
                              // image: AssetImage(Res.ic_pulse),fit:BoxFit.fill
                              )),
                    )
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
