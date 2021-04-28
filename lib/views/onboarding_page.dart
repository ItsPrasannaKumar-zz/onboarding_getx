import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_getx/controller/onboarding_controller.dart';

class OnboardingPage extends StatelessWidget {
  final _controller = OnboardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onboardingPages.length,
                controller: _controller.pagecontroller,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            _controller.onboardingPages[index].imageAsset),
                        SizedBox(
                          height: 32,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 64.0),
                          child: Text(
                            _controller.onboardingPages[index].title,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          _controller.onboardingPages[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: List.generate(
                    _controller.onboardingPages.length,
                    (index) => Obx(() {
                          return Container(
                            margin: const EdgeInsets.all(4),
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    _controller.selectedPageIndex.value == index
                                        ? Colors.red
                                        : Colors.grey),
                          );
                        })),
              ),
            ),
            Positioned(
                right: 20,
                bottom: 20,
                child: FloatingActionButton(
                  onPressed: () {
                    _controller.nextButton();
                  },
                  child: Obx(
                      () => Text(_controller.isLastPage ? 'Start' : "Next")),
                )),
            Positioned(
                top: 20,
                right: 20,
                child: TextButton(
                  child: Text('Skip'),
                  onPressed: () {
                    _controller.pagecontroller.animateToPage(
                        _controller.onboardingPages.length,
                        duration: 300.milliseconds,
                        curve: Curves.ease);
                  },
                ))
          ],
        ),
      ),
    );
  }
}
