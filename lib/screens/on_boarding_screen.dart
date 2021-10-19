import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_num2/controller/cache_helper.dart';
import 'package:shop_app_num2/models/boarding_model.dart';
import 'package:shop_app_num2/screens/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> item = [
    BoardingModel(title: "Screen title1", subtitle: "Screen subtitle1", image: "assets/images/page_one.png"),
    BoardingModel(title: "Screen title2", subtitle: "Screen subtitle2", image: "assets/images/page_two.png"),
    BoardingModel(title: "Screen title3", subtitle: "Screen subtitle3", image: "assets/images/page_three.png"),
  ];

  PageController boardingController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: Text("Example")),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: item.length,
                controller: boardingController,
                onPageChanged: (int index) {
                  if (index == item.length - 1) {
                    setState(() {
                      isLastPage = true;
                    });
                  } else {
                    setState(() {
                      isLastPage = false;
                    });
                  }
                },
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => _header(_size, context, index),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: boardingController,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Theme.of(context).primaryColor,
                      dotColor: Colors.grey,
                      expansionFactor: 3,
                      dotHeight: 10,
                    ),
                    count: item.length,
                  ),
                  Spacer(),
                  FloatingActionButton(
                    heroTag: "bt1",
                    onPressed: () {
                      if (isLastPage) {
                        CacheHelper.saveData(key: "OnBoardingScreen", value: true);
                        Get.off(() => LoginScreen());
                      } else {
                        boardingController.nextPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 27,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _header(Size _size, BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: _size.width,
          height: _size.height * 0.55,
          alignment: Alignment.center,
          child: Image.asset(item[index].image),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            item[index].title,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            item[index].subtitle,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
