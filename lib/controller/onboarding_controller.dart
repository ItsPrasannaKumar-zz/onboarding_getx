import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:onboarding_getx/models/onboarding_info.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:onboarding_getx/views/home_screen.dart';
import 'package:get/get_navigation/get_navigation.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pagecontroller = PageController();
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  nextButton() {
    if (isLastPage) {
      Get.off(HomeScreen());
    } else
      pagecontroller.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
        imageAsset: "images/banner_f.png",
        title: "Order Your Food",
        description:
            "Now you can order your food any time right from your mobile."),
    OnboardingInfo(
        imageAsset: "images/banner_s.png",
        title: "Cooking Safe Food",
        description:
            "We are maintain safety and we keep clean while making food"),
    OnboardingInfo(
        imageAsset: 'images/banner_t.png',
        title: "Quick Delivery",
        description: "Now you can order food any time right from your mobile"),
  ];
}
