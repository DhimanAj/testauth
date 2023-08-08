import 'package:auth/infrastructure/core/base/base_view.dart';
import 'package:auth/presentation/booking_details/booking_detial_controller.dart';
import 'package:auth/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../infrastructure/core/utils/header_app_bar.dart';
import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text.theme.dart';

class BookingDetailPage extends BaseView<BookingDetailController> {
  BookingDetailPage({super.key});

  @override
  Widget body(BuildContext context) {
    return SafeArea(
        child: Obx(() => SingleChildScrollView(
          child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header.defaultAppBar("Bookings Details"),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Booking #${controller.bookedData.value.bookingId.toString()}",
                      style: boldTextStyle(
                        fontSize: dimen18,
                        color: ColorsTheme.colBlack,
                      ),
                    ),
                    Text(
                      controller.bookedData.value.bookingDate.toString(),
                      style: mediumTextStyle(
                        fontSize: dimen14,
                        color: ColorsTheme.colHint,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Divider(
                        height: 1,
                        color: ColorsTheme.colHint,
                      ),
                    ),
                    Row(children: [
                      Container(
                        height: 80,
                        width: 80,
                        color: Colors.black38,
                        child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset(Res.home_ic)),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Room",
                            style: boldTextStyle(
                              fontSize: dimen14,
                              color: ColorsTheme.colBlack,
                            ),
                          ),
                          Text(
                            "Room size: ${controller.bookedData.value.getRoom![0].roomSize}",
                            overflow: TextOverflow.ellipsis,
                            style: mediumTextStyle(
                              fontSize: dimen14,
                              color: ColorsTheme.colBlack,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.deepPurple.shade400, borderRadius: BorderRadius.all(Radius.circular(2))),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Classic',
                                  style: regularTextStyle(fontSize: dimen10, color: ColorsTheme.colWhite),
                                )),
                          ),
                        ],
                      )
                    ]),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Divider(
                        height: 1,
                        color: ColorsTheme.colHint,
                      ),
                    ),
                    Text(
                      "Guest Details",
                      style: boldTextStyle(
                        fontSize: dimen18,
                        color: ColorsTheme.colHint,
                      ),
                    ),
                    Text(
                      controller.bookedData.value.guestName.toString(),
                      style: boldTextStyle(
                        fontSize: dimen16,
                        color: ColorsTheme.colBlack,
                      ),
                    ),
                    Text(
                      "${controller.bookedData.value.phone.toString()} • ${controller.bookedData.value.email.toString()}",
                      style: mediumTextStyle(
                        fontSize: dimen12,
                        color: ColorsTheme.colBlack,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Booking Details",
                      style: boldTextStyle(
                        fontSize: dimen18,
                        color: ColorsTheme.colHint,
                      ),
                    ),
                    Container(
                        width: Get.width,
                        margin: const EdgeInsets.only(
                          top: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.redAccent.shade100),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Dates",
                                    style: mediumTextStyle(fontSize: dimen14, color: ColorsTheme.colBlack),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "${controller.bookedData.value.bookingDate.toString()} - ${controller.bookedData.value.checkOut.toString()} ",
                                    style: boldTextStyle(fontSize: dimen14, color: Colors.red),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Divider(
                                  height: 1,
                                  color: Colors.red,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Guest",
                                    style: mediumTextStyle(fontSize: dimen14, color: ColorsTheme.colBlack),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    controller.bookedData.value.guestQty.toString(),
                                    style: boldTextStyle(fontSize: dimen14, color: Colors.red),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Divider(
                                  height: 1,
                                  color: Colors.red,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Room",
                                    style: mediumTextStyle(fontSize: dimen14, color: ColorsTheme.colBlack),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    controller.bookedData.value.roomQty.toString(),
                                    style: boldTextStyle(fontSize: dimen14, color: Colors.red),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Meals Details",
                      style: boldTextStyle(
                        fontSize: dimen18,
                        color: ColorsTheme.colHint,
                      ),
                    ),
                    Container(
                        width: Get.width,
                        margin: const EdgeInsets.only(
                          top: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorsTheme.colHint),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.black38,
                                  child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset(Res.home_ic)),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Breakfast",
                                      style: boldTextStyle(
                                        fontSize: dimen14,
                                        color: ColorsTheme.colBlack,
                                      ),
                                    ),
                                    Text("Indian Menu",
                                      overflow: TextOverflow.ellipsis,
                                      style: mediumTextStyle(
                                        fontSize: dimen14,
                                        color: ColorsTheme.colHint,
                                      ),
                                    ),

                                  ],
                                )
                              ]),

                              Text(
                                "₹ ${controller.bookedData.value.mealAmount.toString()}",
                                style: boldTextStyle(
                                  fontSize: dimen14,
                                  color: ColorsTheme.colBlack,
                                ),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Payment Details",
                      style: boldTextStyle(
                        fontSize: dimen18,
                        color: ColorsTheme.colHint,
                      ),
                    ),
                    Container(
                        width: Get.width,
                        margin: const EdgeInsets.only(
                          top: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.redAccent.shade100),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Text(controller.bookedData.value.getRoom![0].category.toString(),
                                    style: mediumTextStyle(fontSize: dimen14, color: ColorsTheme.colBlack),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "₹ ${controller.bookedData.value.getRoom![0].roomRent  .toString()} ",
                                    style: boldTextStyle(fontSize: dimen14, color: Colors.red),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Divider(
                                  height: 1,
                                  color: Colors.red,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Text(
                                    "Meal",
                                    style: mediumTextStyle(fontSize: dimen14, color: ColorsTheme.colBlack),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text( "₹ ${controller.bookedData.value.mealAmount.toString()}",
                                    style: boldTextStyle(fontSize: dimen14, color: Colors.red),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Divider(
                                  height: 1,
                                  color: Colors.red,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Amount",
                                    style: mediumTextStyle(fontSize: dimen14, color: ColorsTheme.colBlack),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text("₹ ${(int.parse(controller.bookedData.value.mealAmount.toString()) + (int.parse(controller.bookedData.value.getRoom![0].roomRent.toString())))}",
                                    style: boldTextStyle(fontSize: dimen14, color: Colors.red),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
        )));
  }
}
