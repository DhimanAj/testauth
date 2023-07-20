import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructure/theme/colors.theme.dart';
import '../../../infrastructure/theme/text.theme.dart';
import '../../../res.dart';
import '../controllers/home_controller.dart';

class AppointmentView extends GetView<BaseHomeController> {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.E9E4E4,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                          "APPOINTMENT",
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
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        Res.ic_report,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            margin: EdgeInsets.only(top: 20),
            child: Row(
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
                    const SizedBox(
                      height: 5,
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
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(top: 20),
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Cost",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: regularTextStyle(
                              fontSize: dimen12,
                              color: ColorsTheme.colBlack,
                            ),
                          ),
                          Text(
                            "Session for 30 min",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: regularTextStyle(
                              fontSize: dimen12,
                              color: ColorsTheme.colHint,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "\$80",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: regularTextStyle(
                          fontSize: dimen12,
                          color: ColorsTheme.colBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "To Pay",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: regularTextStyle(
                          fontSize: dimen12,
                          color: ColorsTheme.colBlack,
                        ),
                      ),
                      Text(
                        "\$80",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: regularTextStyle(
                          fontSize: dimen12,
                          color: ColorsTheme.colBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    height: 1,
                    color: Colors.black54,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(40)),
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 15),
                        child: Image.asset(
                          Res.ic_percentage,
                          height: 20,
                          width: 20,
                        ),
                      ),
                      Text("Use Promo Code",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: regularTextStyle(
                            fontSize: dimen14,
                            color: ColorsTheme.colBlack,
                          )),
                      Container(
                        margin: const EdgeInsets.only(right: 15),
                        child: Image.asset(
                          Res.ic_right_arrow,
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Payment Mode",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: regularTextStyle(
                      fontSize: dimen16,
                      color: ColorsTheme.colBlack,
                    ),
                  ),
                ),
                Container(
                  width: Get.width,
                  margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsTheme.colHint),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: ListView.separated(
                    itemCount: controller.paymentModeList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Obx(() => Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: InkWell(
                              onTap: () {
                                controller.cardSelectedIndex.value = index;
                              },
                              child: Row(
                                children: [
                                  controller.cardSelectedIndex.value != index
                                      ? Image.asset(
                                          Res.icunselect,
                                          height: 20,
                                          width: 20,
                                        )
                                      : Image.asset(
                                          Res.icselect,
                                          height: 20,
                                          width: 20,
                                        ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    controller.paymentModeList[index].toString().tr,
                                    style: regularTextStyle(fontSize: dimen16, color: ColorsTheme.colBlack),
                                  ),
                                ],
                              ),
                            ),
                          ));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Divider(color: ColorsTheme.colHint, thickness: 1),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          // SizedBox(height: 50,),
          Container(
            color: Colors.white,
            child: InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration:
                    const BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Make Payment",
                      style: semiBoldTextStyle(fontSize: 12.0, color: ColorsTheme.colWhite),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
