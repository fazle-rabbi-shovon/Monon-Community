import 'dart:async';
import 'package:flutter/material.dart';
import 'package:monon/ui/home/home_view.dart';

import '../Common/login_gradient_button_decoration.dart';
import '../Common/normal_gradient_button_decoration.dart';
import '../route/navigation_service.dart';
import '../shared_pref/shared_pref_util.dart';
import '../util/dimen_values_util.dart';
import '../util/image_util.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    // Navigate after 5 seconds
    // Timer(const Duration(seconds: 5), () {
    //   NavigationService.getCurrentState()
    //       ?.pushReplacementNamed('/home', arguments: 0);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Optional
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "ভূমিকা",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "জলবায়ু পরিবর্তন আজ বিশ্বব্যাপী একটি অন্যতম গুরুত্বপূর্ণ সমস্যা হিসেবে আবির্ভূত হয়েছে। বাংলাদেশের উপকূলীয় অঞ্চলে বসবাসকারী বাসিন্দারা জলবায়ু পরিবর্তনের প্রভাব বিশেষভাবে অনুভব করছে। উপকূলীয় অঞ্চলে জলবায়ু পরিবর্তনের ফলে সৃষ্ট প্রাকৃতিক দুর্যোগ, তাপমাত্রা বৃদ্ধি, সমুদ্রপৃষ্ঠের উচ্চতা বৃদ্ধির কারণে মানুষের মধ্যে মানসিক চাপ, দুশ্চিন্তা ও বিষণ্ণতার মতো মানসিক স্বাস্থ্য সমস্যা বেড়ে যাচ্ছে। ঘরবাড়ি, জীবিকা এবং প্রাকৃতিক সম্পদ হারানোর ফলে অনেকের মানসিক অবস্থা বিপর্যস্ত হয়ে পড়ছে, যা তাদের দৈনন্দিন জীবনে নেতিবাচক প্রভাব ফেলছে এবং পারিবারিক ও সামাজিক সম্পর্কগুলো দুর্বল হয়ে পড়ছে। ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "এমতাবস্থায়, ইমোশনাল ইন্টেলিজেন্স বা আবেগীয় বুদ্ধিমত্তা উপকূলীয় অঞ্চলে বসবাসকারী জনগণের মানসিক স্বাস্থ্যের উন্নয়নে একটি কার্যকর ভূমিকা পালন করবে। “মননঃ কমিউনিটি ইমোশনাল ইন্টেলিজেন্স নেটওয়ার্ক” নামক মোবাইল অ্যাপ্লিকেশনটি ইমোশনাল ইন্টেলিজেন্স বা আবেগীয় বুদ্ধিমত্তার বিভিন্ন উপাদান অন্তর্ভুক্ত করেছে, যা ব্যবহারের মাধ্যমে একজন ব্যক্তি নিজের অনুভূতি এবং অন্যদের অনুভূতির প্রতি সচেতন হয়ে যে কোন পরিস্থিতি মোকাবেলা করার সক্ষমতা অর্জন করবে। এটি মানসিক চাপ ও দুশ্চিন্তা কমিয়ে মানসিক শক্তি অর্জন করতে এবং সামগ্রিকভাবে মানসিক স্বাস্থ্যের উন্নয়নে সাহায্য করবে।",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
          Container(
            margin: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 20.0),
            height: DimenValuesUtil.buttonHeight,
            decoration: GradientButtonDecoration(),
            child: InkWell(
              onTap: () {
                NavigationService.getCurrentState()
                    ?.pushReplacementNamed('/emotions_first_submit',);
              },
              child: const Center(
                child: Text(
                  "পরবর্তী",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: DimenValuesUtil.title,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }

  Widget nextButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 20.0),
      height: DimenValuesUtil.buttonHeight,
      decoration: GradientButtonDecoration(),
      child: InkWell(
        onTap: () {
          SharedPrefUtil().setLoggedIn();
          NavigationService.getCurrentState()
              ?.pushReplacementNamed('/intro_page',);
        },
        child: const Center(
          child: Text(
            "সাবমিট",
            style: TextStyle(
              color: Colors.white,
              fontSize: DimenValuesUtil.title,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

}
