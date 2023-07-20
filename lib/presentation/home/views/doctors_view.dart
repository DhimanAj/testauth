import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructure/theme/colors.theme.dart';
import '../../../infrastructure/theme/text.theme.dart';
import '../../../res.dart';
import '../controllers/home_controller.dart';

class DoctorsView extends GetView<BaseHomeController> {
  const DoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.E9E4E4,
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
                              Icons.arrow_back,
                              color: ColorsTheme.colWhite,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "DOCTORS",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: regularTextStyle(
                            fontSize: dimen18,
                            color: ColorsTheme.colWhite,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Image.asset(
                        Res.ic_report,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(color: ColorsTheme.colWhite, borderRadius: BorderRadius.circular(40)),
                  margin: const EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 20),
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
                            hintStyle: regularTextStyle(fontSize: dimen14, color: ColorsTheme.colHint),
                          ),
                          readOnly: true,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          recommentedList(context, 0),
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
                  return recommentedList(context, index);
                }),
          ),
        ],
      ),
    );
  }

  recommentedList(context, index) {
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(Res.ic_profile_black)),
                              color: ColorsTheme.col797D7F,
                              shape: BoxShape.circle),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: regularTextStyle(
                            fontSize: dimen14,
                            color: ColorsTheme.colBlack,
                          ),
                        ),
                        Text(
                          "Nephrologist",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: regularTextStyle(
                            fontSize: dimen12,
                            color: ColorsTheme.colHint,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              Res.ic_office,
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "3 Year",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: regularTextStyle(
                                fontSize: dimen12,
                                color: ColorsTheme.colHint,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              Res.ic_like,
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "67 %",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: regularTextStyle(
                                fontSize: dimen12,
                                color: ColorsTheme.colHint,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Total Fee",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: regularTextStyle(
                            fontSize: dimen12,
                            color: ColorsTheme.colHint,
                          ),
                        ),
                        Text(
                          "\$80",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: regularTextStyle(
                            fontSize: dimen13,
                            color: ColorsTheme.colBlack,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(left: 20),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: const BoxDecoration(
                              color: Colors.amber, borderRadius: BorderRadius.all(Radius.circular(25))),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Make an Appointment",
                                style: semiBoldTextStyle(fontSize: 12.0, color: ColorsTheme.colWhite),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.black54,
          )
        ],
      ),
    );
  }
}
