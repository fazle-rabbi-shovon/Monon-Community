import 'package:flutter/material.dart';

import '../../util/image_util.dart';

class AudioWidgets {
  static Widget emotionalIntelligenceInfo = const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ইমোশনাল ইন্টেলিজেন্স বা আবেগীয় বুদ্ধিমত্তা হলো এমন একধরণের ক্ষমতা যেখানে ব্যক্তি নিজের অনুভূতি বুঝতে পারে এবং নিয়ন্ত্রণ করতে পারে, একইসাথে অপরের অনুভূতি বুঝতে পারে এবং মূল্যায়ন করার মাধ্যমে মানিয়ে চলতে পারে।",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "মনোবিজ্ঞানী ড্যানিয়েল গোলম্যান তার প্রস্তাবিত ইমোশনাল ইন্টেলিজেন্স বা আবেগীয় বুদ্ধিমত্তার মডেলকে প্রথমে পাঁচটি মূল উপাদানে বিভক্ত করেন, যেমন আত্ম-সচেতনতা (Self-awareness), আত্মনিয়ন্ত্রণ (Self-regulation), অনুপ্রেরণা (Motivation), সমানুভূতি বা সমমর্মিতা (Empathy) এবং সামাজিক দক্ষতা (Social Skills)।",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "পরবর্তীতে আরও গবেষণার মাধ্যমে এই পাঁচটি উপাদানকে সীমিত করে পুনরায় চারটি মূল উপাদানের সমন্বয়ে একটি মডেল তৈরি করা হয়, যেমন আত্ম-সচেতনতা (Self-awareness), আত্ম-ব্যবস্থাপনা (Self-management), সামাজিক সচেতনতা (Social awareness) এবং সম্পর্ক ব্যবস্থাপনা (Relationship management)।  ",
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
  );

  static Widget selfAwarenessWidget = const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "আত্মসচেতনতা বলতে বোঝায় নিজের অনুভূতি সম্পর্কে সচেতন থাকা এবং অনুভূতিগুলো কিভাবে আচরণে প্রভাব ফেলে তা বুঝতে পারা। একজন আত্মসচেতন ব্যক্তি নিজের মানসিক শক্তি এবং সীমাবদ্ধতা পরিপূর্ণভাবে অনুধাবন করতে পারেন। এর ফলে তিনি তার সিদ্ধান্ত নির্ধারণে এবং সমস্যা সমাধানে কার্যকরী ভূমিকা পালন করতে পারেন।  ",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "\nকিভাবে বুঝবেন আপনি আত্মসচেতন",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text("•  যে কোন পরিস্থিতিতে নিজের অনুভূতি ও প্রতিক্রিয়া নিয়ন্ত্রণ করতে পারা।", style: TextStyle(fontSize: 16)),
        Text("•  অপরের অনুভূতির প্রতি সমানুভূতি বা সমমর্মীতা প্রদর্শন করা। ", style: TextStyle(fontSize: 16)),
        Text("•  অন্যদের মতামত বা ফিডব্যাক ইতিবাচকভাবে গ্রহণ করতে পারা।", style: TextStyle(fontSize: 16)),

        Text("\nআত্মসচেতন হওয়ার গুরুত্ব", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("•  আত্মসচেতন ব্যক্তি মানসিকভাবে সচেতন থাকেন।", style: TextStyle(fontSize: 16)),
        Text("•  আত্মসচেতনতা আমাদের আত্মবিশ্বাস বাড়ায়। ", style: TextStyle(fontSize: 16)),
        Text("•  ব্যক্তি নিজেকে ও অপরকে সঠিকভাবে মূল্যায়ন করতে পারেন যা সম্পর্ক উন্নয়নে সাহায্য করে।", style: TextStyle(fontSize: 16)),
        Text("•  আত্মসচেতন ব্যক্তি যে কোন পরিস্থিতিতে নিজেকে স্থিতিশীল রাখতে পারেন।", style: TextStyle(fontSize: 16)),

        Text("\nআত্মসচেতনতা বৃদ্ধি করার উপায়", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("আমরা বিভিন্ন উপায়ে আত্মসচেতনতা বৃদ্ধি করতে পারি। যেমনঃ", style: TextStyle(fontSize: 16)),
        Text("•  মাইন্ডফুলনেস মেডিটেশন করা: মাইন্ডফুলনেস অনুশীলন চিন্তা-ভাবনাকে বর্তমান মুহূর্তে নিয়ে আসতে সাহায্য করে যা ব্যক্তিকে আরও বেশি শান্ত ও মনযোগী করে আত্মসচেতনতা বৃদ্ধি করে।", style: TextStyle(fontSize: 16)),
        Text("•  ডায়েরি লেখা: প্রতিদিন ডায়েরি লেখার ফলে নিজের অনুভূতিগুলো সম্পর্কে গভীরভাবে জানা যায়।", style: TextStyle(fontSize: 16)),
        Text("•  ফিডব্যাক নেয়া: কাছের মানুষদের থেকে ফিডব্যাক নেয়ার মাধ্যমে নিজের সম্পর্কে আরও ভালভাবে জানা যায়। এটি আপনার ভুল-ত্রুটিগুলোকে সংশোধন করতে সাহায্য করবে।", style: TextStyle(fontSize: 16)),
        Text("•  নিজের সম্পর্কে জানাঃ নিজের সক্ষমতা ও দুর্বলতাগুলো চিহ্নিত করতে পারলে আত্মবিশ্বাস বাড়ে এবং আত্মসচেতন হওয়া যায়।", style: TextStyle(fontSize: 16)),
      ],
    ),
  );

  static Widget selfRegulationWidget = const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "আত্মনিয়ন্ত্রণ একজন ব্যক্তিকে তার অনিয়ন্ত্রিত আবেগগুলোকে (রাগ, দুশ্চিন্তা, হতাশা, বিরক্ত, ইত্যাদি) সঠিকভাবে পরিচালনা করতে সহায়তা করে। আত্মনিয়ন্ত্রণের মাধ্যমে ব্যক্তি তার নেতিবাচক আচরণগুলোকে প্রতিহত করতে পারে এবং একটি দীর্ঘমেয়াদি লক্ষ্যে মনোনিবেশ করতে সক্ষম হয়।    ",
          style: TextStyle(fontSize: 16),
        ),

        Text(
          "\nকিছু দক্ষতা অর্জনের মাধ্যমে আমরা নিজেদের আত্মনিয়ন্ত্রণ করতে পারি",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text("•  নিজের আবেগগুলোকে স্থিতিশীল রাখা।", style: TextStyle(fontSize: 16)),
        Text("•  আত্ম-শৃঙ্খলার মাধ্যমে নিজের আচরণগুলোকে নিয়ন্ত্রণে রাখা।", style: TextStyle(fontSize: 16)),
        Text("•  বিভিন্ন পরিস্থিতিতে সহজেই নিজেকে খাপ খাওয়ানো বা মানিয়ে নেয়া। ", style: TextStyle(fontSize: 16)),
        Text("•  কঠিন সময়গুলোতে ধৈর্য ধারণ করা।", style: TextStyle(fontSize: 16)),
        Text("•  ব্যক্তিগত মূল্যবোধ, যা বিভিন্ন ধরণের প্রতিক্রিয়া এবং সিদ্ধান্ত অর্জনে সহায়তা করে।", style: TextStyle(fontSize: 16)),

        Text(
          "\nআত্মনিয়ন্ত্রণের উপায়",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text("•  মাইন্ডফুলনেস অনুশীলন চিন্তা-ভাবনাকে বর্তমান মুহূর্তে নিয়ে আসতে সাহায্য করে যা ব্যক্তিকে আরও বেশি শান্ত ও মনযোগী করে তোলে।", style: TextStyle(fontSize: 16)),
        Text("•  যে কোন পরিস্থিতিতে শান্ত থাকা এবং স্পষ্টভাবে চিন্তা করা।", style: TextStyle(fontSize: 16)),
        Text("•  গভীর শ্বাস-প্রশ্বাসের ব্যায়াম করা।", style: TextStyle(fontSize: 16)),
        Text("•  ১ থেকে ১০ পর্যন্ত গণনা করা। হাঁটাহাঁটি করা।", style: TextStyle(fontSize: 16)),
        Text("•  যতক্ষণ পর্যন্ত মনে হয় আবেগ নিয়ন্ত্রণ নেই, ততক্ষণ পর্যন্ত কোন প্রতিক্রিয়া না দেখানো।", style: TextStyle(fontSize: 16)),
        Text("•  নিজেকে ও অপরকে ক্ষমা করা।", style: TextStyle(fontSize: 16)),
        Text("•  প্রতিক্রিয়া জানানোর পরিবর্তে সরাসরি কথা বলা।", style: TextStyle(fontSize: 16)),
        Text("•  কিছু স্বাস্থ্যকর অভ্যাস গড়ে তোলার মাধ্যমে নিজের আচরণগুলোকে নিয়ন্ত্রণ করা যায়, যেমন শারীরিকভাবে সক্রিয় থাকা, সুষম খাবার খাওয়া, পর্যাপ্ত ঘুম এবং ধূমপান পরিহার করা। ", style: TextStyle(fontSize: 16)),
        Text("•  ইতিবাচক চিন্তা-ভাবনা করা এবং ধর্মীয় রীতিনীতি মেনে চলা। ", style: TextStyle(fontSize: 16)),
      ],
    ),
  );

  static Widget motivationWidget = const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "অনুপ্রেরণা হলো ব্যক্তির নিজস্ব ইচ্ছাশক্তি থেকে উদ্যোগী হয়ে কাজ করার প্রবণতা। এর বিভিন্ন দিক এর মধ্যে রয়েছে, দক্ষতা বাড়ানো; প্রতিশ্রুতি রক্ষা করা; কোন বিষয়ে উদ্যোগী হয়ে তাৎক্ষণিকভাবে পদক্ষেপ নেয়া; আশাবাদী হওয়া অর্থাৎ বাধা বা প্রতিকূলতা আসা সত্ত্বেও নিজের লক্ষ্যে অবিচল থাকা; এবং নিজের সক্ষমতা বৃদ্ধি করার প্রবল আকাঙ্ক্ষা।  ",
          style: TextStyle(fontSize: 16),
        ),

        Text(
          "\nকোন কাজে নিজেকে অনুপ্রাণিত করার সাধারণ কৌশলসমূহ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text("•  যে কাজগুলো আপনার মনোযোগ বাড়ায়, সেগুলো সঠিকভাবে পরিকল্পনা করুন। ", style: TextStyle(fontSize: 16)),
        Text("•  যদি কোনো কাজ সন্তোষজনক না হয়, তবে তার মধ্যে থাকা ভালো দিকগুলোতে মনোনিবেশ করুন অথবা তা আনন্দদায়ক কাজের সাথে যুক্ত করুন। কাজ সম্পন্ন হলে নিজেকে যথাযথভাবে পুরস্কৃত করুন।", style: TextStyle(fontSize: 16)),
        Text("•  কাজের গতি কমে গেলে, বড় বিষয়গুলোকে ছোট ছোট অংশে ভাগ করে নিন। কতটুকু কাজ সম্পন্ন করা বাকি আছে তা নির্ণয় করুন।", style: TextStyle(fontSize: 16)),
        Text("•  সামাজিকভাবে কাছের মানুষ বা ভালো সহকর্মীদের কাজ থেকে অনুপ্রেরণা নিন ও নিজেকে উৎসাহিত করুন, অন্যদের পরামর্শ দিয়ে নিজের কাজের গতি বাড়ান, এবং যাদের জন্য আপনি সফল হতে চান তাদের সর্বদা মনে রাখুন। ", style: TextStyle(fontSize: 16)),
      ],
    ),
  );

  static Widget empathyWidget = Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "সমানুভূতি বা সমমর্মিতা বা Empathy হলো সংবেদনশীলভাবে অন্য ব্যক্তির আবেগ-অনুভূতি বোঝা এবং তার অবস্থান বা দৃষ্টিকোণ থেকে কোন বিষয় দেখার ক্ষমতা। এটি একজন ব্যক্তিকে অন্যদের চিন্তা ও অনুভূতিগুলোর সাথে যুক্ত করে, যার ফলে সম্পর্কগুলো আরও গভীর হয়।",
          style: TextStyle(fontSize: 16),
        ),

        const Text(
          "\nসহানুভূতি বা Sympathy এবং সমানুভূতি বা Empathy এর মধ্যে পার্থক্য",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const Text(
          "সহানুভূতি বা Sympathy হলো, কোন ব্যক্তির কষ্টের কথাগুলো মনোযোগ দিয়ে শোনা এবং তার প্রতি দুঃখ বোধ করা বা দুঃখ প্রকাশ করা, কিন্তু তার অবস্থানে থেকে তার কষ্ট কিংবা অনুভূতিগুলো সম্পূর্ণরূপে অনুভব করতে না পারা।  "
              "অন্যদিকে, সমানুভূতি বা সমমর্মিতা বা Empathy হলো, ব্যক্তির অবস্থানে থেকে তার দৃষ্টিকোণ থেকে তার কষ্ট কিংবা অনুভূতিগুলো সম্পূর্ণরূপে অনুভব করা বা বোঝার ক্ষমতা।",
          style: TextStyle(fontSize: 16),
        ),
        const Text(
          "আসুন, সহানুভূতি বা Sympathy এবং সমানুভূতি বা সমমর্মিতা বা Empathy কে আমরা একটি উদাহরণের মাধ্যমে বোঝার চেষ্টা করি।",
          style: TextStyle(fontSize: 16),
        ),

        const SizedBox(height: 16),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     Column(
        //       children: [
        //         Container(
        //           padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        //           decoration: BoxDecoration(
        //             border: Border.all(color: Colors.blue),
        //             borderRadius: BorderRadius.circular(4),
        //           ),
        //           child: const Text("সহানুভূতি বা Sympathy", style: TextStyle(fontWeight: FontWeight.bold)),
        //         ),
        //         const SizedBox(height: 8),
        //         Container(
        //           width: 150,
        //           padding: const EdgeInsets.all(12),
        //           decoration: BoxDecoration(
        //             shape: BoxShape.rectangle,
        //             border: Border.all(color: Colors.blue),
        //             borderRadius: BorderRadius.circular(75),
        //           ),
        //           child: const Text(
        //             "তোমার ঘটনাটা অনুভবের কথা শুনে অনেক কষ্ট পেয়েছি।",
        //             textAlign: TextAlign.center,
        //           ),
        //         ),
        //       ],
        //     ),
        //     Column(
        //       children: [
        //
        //         Container(
        //           padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        //           decoration: BoxDecoration(
        //             border: Border.all(color: Colors.green),
        //             borderRadius: BorderRadius.circular(4),
        //           ),
        //           child: const Text("সমানুভূতি বা Empathy", style: TextStyle(fontWeight: FontWeight.bold)),
        //         ),
        //         const SizedBox(height: 8),
        //         Container(
        //           width: 160,
        //           padding: const EdgeInsets.all(12),
        //           decoration: BoxDecoration(
        //             shape: BoxShape.rectangle,
        //             border: Border.all(color: Colors.green),
        //             borderRadius: BorderRadius.circular(80),
        //           ),
        //           child: const Text(
        //             "আমি বুঝতে পারছি, এই অনুভূতি তোমার মনের কতটা কষ্টের। আমি তোমার পাশে আছি, যেকোন দরকার হলে জানাতে ভুলো না।",
        //             textAlign: TextAlign.center,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),

        Center(
          child: Image.asset(
            ImageUtil.AUDIO_EMPATHY,
            // key: const Key('logo-image'),
            width: 300,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 20),

        const Text(
          "সমানুভূতি বা সমমর্মিতা বা Empathy এর গুরুত্ব",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const Text("•  সমমর্মিতার মাধ্যমে পরস্পরের সাথে ইতিবাচক ও দৃঢ় সম্পর্ক গড়ে ওঠে। ", style: TextStyle(fontSize: 16)),
        const Text("•  সমমর্মিতা সামাজিক সহযোগিতামূলক আচরণে উৎসাহ দেয় যার ফলে আপনি অন্যের প্রয়োজনের প্রতি সংবেদনশীল থাকবেন। ", style: TextStyle(fontSize: 16)),
        const Text("•  সামাজিক বিভিন্ন পরিস্থিতিতে, সমমর্মিতা সঠিকভাবে সিদ্ধান্ত গ্রহণে সাহায্য করে। যেমন, পরিবারের কোনও সদস্য যদি কাজের চাপে মানসিকভাবে অবসন্ন থাকে তাহলে তাকে অন্য কোন অতিরিক্ত দায়িত্ব নিতে না করা।  ", style: TextStyle(fontSize: 16)),
        const Text("•  ক্লান্তি বা মানসিক অবসাদ কমায়ঃ কঠিন কাজের পরিবেশেও সমমর্মিতা আরও ভাল যোগাযোগ এবং সহযোগিতার সুযোগ সৃষ্টি করে দেয়, যা ব্যক্তির ক্লান্তি বা মানসিক অবসাদ কমাতে সাহায্য করে। ", style: TextStyle(fontSize: 16)),
        const Text("•  দ্বন্দ্ব নিরসনে সাহায্য করেঃ যখন আপনি অন্য কারো দৃষ্টিভঙ্গি ভালোভাবে বুঝতে পারবেন, তখন যে কোন দ্বন্দ্ব বা বিরোধ নিরসন সহজ হয়ে ওঠে। ", style: TextStyle(fontSize: 16)),
        const Text("•  পরস্পরের প্রতি সমানুভূতি বা সমমর্মিতা সম্পূর্ণরূপে অনুভব করার মাধ্যমেই একটি শক্তিশালী সম্পর্কের নেটওয়ার্ক গড়ে উঠে।", style: TextStyle(fontSize: 16)),
      ],
    ),
  );

  static Widget socialSkillsWidget = const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "সামাজিক দক্ষতা আচার-আচরণের এমন একটি উপাদান, যা আমাদের বিভিন্ন সামাজিক পরিস্থিতিতে মানিয়ে চলতে সাহায্য করে। সামাজিক দক্ষতা গড়ে তোলার ক্ষেত্রে পরিবারের গুরুত্ব অপরিসীম। জীবনের বিভিন্ন ক্ষেত্রে সাফল্য অর্জনে ও মানবিক সম্পর্ক উন্নয়নে সামাজিক দক্ষতা অত্যন্ত গুরুত্বপূর্ণ। সামাজিক মানুষ হিসেবে আমরা পরস্পরের সঙ্গে কথা বলি, শিখতে চেষ্টা করি এবং আমরা একে অপরের উপর নির্ভরশীল। সামাজিক দক্ষতাগুলি একজন মানুষের ব্যক্তিগত ও পেশাগত সম্পর্ক গড়ে তোলা, সঠিক সিদ্ধান্ত নেয়া, এবং দল বা সংগঠনের নেতৃত্ব প্রদানে সহায়তা করে।",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "\nসামাজিক দক্ষতাগুলির মধ্যে রয়েছেঃ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text("•  প্রভাব বিস্তার: অন্যদের আপনার মতামত গ্রহণ করতে বা আপনার সিদ্ধান্তে সম্মত হতে উৎসাহিত করার কৌশল।", style: TextStyle(fontSize: 16)),
        Text("•  যোগাযোগ: অন্যদের কাছে স্পষ্ট এবং বোধগম্য বার্তা পাঠানো, যাতে আপনার কথা সঠিকভাবে বোঝা যায়।", style: TextStyle(fontSize: 16)),
        Text("•  নেতৃত্ব: অন্যদের উৎসাহিত করা এবং লক্ষ্য অর্জনের জন্য নির্দেশনা দেওয়া।", style: TextStyle(fontSize: 16)),
        Text("•  পরিবর্তনে উদবুদ্ধকারী: একটি দল বা সংগঠনের মধ্যে পরিবর্তন আনার বা পরিচালনা করার দক্ষতা। ", style: TextStyle(fontSize: 16)),
        Text("•  দ্বন্দ্ব মোকাবেলার কৌশল: বিরোধ ও মতবিরোধ সমাধান করা এবং সকল পক্ষের জন্য গ্রহণযোগ্য সমাধান আলোচনা করা। ", style: TextStyle(fontSize: 16)),
        Text("•  দৃঢ় সম্পর্ক গড়ে তোলা: ব্যক্তিগত ও পেশাগতভাবে পরস্পরের সঙ্গে স্থায়ী ও উপকারী সম্পর্ক তৈরি করা ও বজায় রাখা। ", style: TextStyle(fontSize: 16)),
        Text("•  সহযোগিতা এবং দলগত একতা: অন্যদের সাথে যৌথভাবে লক্ষ্য অর্জনের উদ্দেশ্যে কাজ করা। ", style: TextStyle(fontSize: 16)),
        Text("•  দলগত সামর্থ্য বা কার্যক্ষমতা: একটি ঐক্যবদ্ধ ও কার্যকর দল গঠন করা, যা একসঙ্গে কাজ করে লক্ষ্য অর্জন করে। ", style: TextStyle(fontSize: 16)),
      ],
    ),
  );

  static Widget sadnessWidget = const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "দুঃখ-কষ্ট হল এমন একটি আবেগিক অবস্থা যা সাধারণত ব্যর্থতা, কোন কিছু হারানো, অপূর্ণতা, এবং অসহায়তার মতো অনুভূতির মাধ্যমে প্রকাশ পায়। আমাদের দুঃখের কারণ ব্যক্তিগত এবং সাংস্কৃতিক ধারণা অনুসারে ভিন্ন হতে পারে। যদিও দুঃখকে প্রায়ই একটি \"নেতিবাচক\" অনুভূতি হিসেবে দেখা হয়, এটি আসলে সাহায্য বা সান্ত্বনা পাওয়ার প্রয়োজনীয়তা চিহ্নিত করার ক্ষেত্রে গুরুত্বপূর্ণ ভূমিকা পালন করে। দুঃখ-কষ্টের এই অবস্থা সাময়িক বা দীর্ঘমেয়াদি হতে পারে, তাই দুঃখ-কষ্টকে জয় করেই আমাদের সামনে এগিয়ে যেতে হবে।",
          style: TextStyle(fontSize: 16),
        ),

        Text("\nকারণসমূহ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• অনাকাঙ্ক্ষিত কোন ঘটনা", style: TextStyle(fontSize: 16)),
        Text("• বিপদগ্রস্ত অবস্থা", style: TextStyle(fontSize: 16)),
        Text("• অসুস্থতা বা প্রিয়জনের মৃত্যু", style: TextStyle(fontSize: 16)),
        Text("• সম্পর্কের ভাঙ্গন", style: TextStyle(fontSize: 16)),
        Text("• প্রত্যাশিত ফলাফল না পাওয়া", style: TextStyle(fontSize: 16)),
        Text("• প্রাকৃতিক দুর্যোগ।", style: TextStyle(fontSize: 16)),

        Text("\nলক্ষণসমূহ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

        Text("\nশারীরিক", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• শারীরিক দুর্বলতা বা ক্লান্ত অনুভব করা", style: TextStyle(fontSize: 16)),
        Text("• মাথাব্যথা বা শারীরিক যন্ত্রণা", style: TextStyle(fontSize: 16)),
        Text("• ঘুমের সমস্যা", style: TextStyle(fontSize: 16)),
        Text("• ক্ষুধামন্দা বা অতিরিক্ত খাওয়া।", style: TextStyle(fontSize: 16)),

        Text("\nমানসিক", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• কোন কিছু পাওয়ার আগ্রহ কমে যাওয়া", style: TextStyle(fontSize: 16)),
        Text("• কান্নাকাটি করা", style: TextStyle(fontSize: 16)),
        Text("• একাকীত্ব এবং হীনমন্যতাবোধ", style: TextStyle(fontSize: 16)),
        Text("• সবকিছু বিরক্ত লাগা", style: TextStyle(fontSize: 16)),
        Text("• হতাশা", style: TextStyle(fontSize: 16)),
        Text("• নেতিবাচক চিন্তা-ভাবনা।", style: TextStyle(fontSize: 16)),

        Text("\nআচরণগত", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• চুপচাপ থাকা", style: TextStyle(fontSize: 16)),
        Text("• সবকিছু থেকে নিজেকে গুটিয়ে রাখা", style: TextStyle(fontSize: 16)),
        Text("• আত্মসমালোচনা করা", style: TextStyle(fontSize: 16)),
        Text("• কোনও কাজ করতে অনীহা প্রকাশ করা।", style: TextStyle(fontSize: 16)),

        Text("\nকরণীয়", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• নিজের আবেগ-অনুভূতি ও আচরণের প্রতি লক্ষ্য রাখুন এবং নিয়ন্ত্রণ করার চেষ্টা করুন।", style: TextStyle(fontSize: 16)),
        Text("• নিজেকে সময় দিন এবং আপনার দুঃখের কারণ ও ধরণ বোঝার চেষ্টা করুন।", style: TextStyle(fontSize: 16)),
        Text("• আত্মবিশ্বাস বাড়ান।", style: TextStyle(fontSize: 16)),
        Text("• নিজের পছন্দের কাজগুলো করুন।", style: TextStyle(fontSize: 16)),
        Text("• অন্যের সাথে তুলনা না করে নিজের যা আছে তা নিয়ে সন্তুষ্ট থাকুন।", style: TextStyle(fontSize: 16)),
        Text("• পছন্দের কোন জায়গায় ঘুরতে বেরিয়ে পড়ুন।", style: TextStyle(fontSize: 16)),
        Text("• ভাল বই পড়ার চেষ্টা করুন।", style: TextStyle(fontSize: 16)),
        Text("• প্রিয়জনের সঙ্গে সময় কাটান এবং নেতিবাচক মানুষ থেকে নিজেকে দূরে রাখুন।", style: TextStyle(fontSize: 16)),
        Text("• নিয়মিত প্রার্থনা করুন।", style: TextStyle(fontSize: 16)),
        Text("• মাইন্ডফুলনেস মেডিটেশন এর অনুশীলন করুন।", style: TextStyle(fontSize: 16)),
        Text("• নিজের অনুভূতিগুলো বিশ্বস্ত কারো সাথে শেয়ার করুন।", style: TextStyle(fontSize: 16)),
        Text("• প্রয়োজনে মেন্টাল হেলথ প্রফেশনালদের সাহায্য নিন।", style: TextStyle(fontSize: 16)),
      ],
    ),
  );


  static Widget angerWidget = const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "রাগ একটি তীব্র আবেগ যা সাধারণত অসন্তুষ্টি বা অন্যায় আচরণের প্রতিক্রিয়া হিসেবে প্রকাশ পায়। এটি শুধু আমাদের শরীরের উপরই প্রভাব ফেলেনা, বরং মনের উপরও গভীর প্রভাব ফেলে। রাগ আমাদের চিন্তা ও অনুভূতির গতিপথ পরিবর্তন করে সিদ্ধান্ত গ্রহণে ভুল পথে পরিচালিত করতে পারে। অন্যান্য আবেগের মতই রাগ মানুষের একটি স্বাভাবিক আবেগ হলেও এর নিয়ন্ত্রণহীন বহিঃপ্রকাশ ব্যক্তি এবং তার আশপাশের মানুষের ক্ষতির কারণ হতে পারে। রাগ পুরোপুরি নির্মূল করা সম্ভব নয়, তবে রাগের উপর নিয়ন্ত্রণ রেখে জীবনকে সফলভাবে পরিচালনা করা সম্ভব।",
          style: TextStyle(fontSize: 16),
        ),

        Text("\nকারণসমূহ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• খারাপ কোন পরিস্থিতির সম্মুখীন হওয়া", style: TextStyle(fontSize: 16)),
        Text("• অর্থনৈতিক বা পেশাগত জীবনে দীর্ঘমেয়াদে বঞ্চিত থাকা", style: TextStyle(fontSize: 16)),
        Text("• সামাজিক বা ব্যক্তিগত বিভিন্ন ধরনের সমস্যা", style: TextStyle(fontSize: 16)),
        Text("• অতিরিক্ত এবং দীর্ঘমেয়াদি কাজের চাপ", style: TextStyle(fontSize: 16)),
        Text("• স্বাস্থ্যগত সমস্যা", style: TextStyle(fontSize: 16)),
        Text("• বংশগত কারণ", style: TextStyle(fontSize: 16)),
        Text("• নেশাজাতীয় দ্রব্য সেবন।", style: TextStyle(fontSize: 16)),

        Text("\nলক্ষণসমূহ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

        Text("\nশারীরিক", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• হৃদস্পন্দন বেড়ে যাওয়া", style: TextStyle(fontSize: 16)),
        Text("• রক্তচাপ বেড়ে যাওয়া", style: TextStyle(fontSize: 16)),
        Text("• বুকে চাপ অনুভব করা", style: TextStyle(fontSize: 16)),
        Text("• শরীরের তাপমাত্রা বেড়ে যাওয়া, ঘাম হওয়া", style: TextStyle(fontSize: 16)),
        Text("• মাথা ব্যথা", style: TextStyle(fontSize: 16)),
        Text("• মাংস-পেশী শক্ত হয়ে যাওয়া।", style: TextStyle(fontSize: 16)),

        Text("\nমানসিক", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• অতিরিক্ত চিন্তা করা", style: TextStyle(fontSize: 16)),
        Text("• উদাসীনতা", style: TextStyle(fontSize: 16)),
        Text("• অস্থিরতা", style: TextStyle(fontSize: 16)),
        Text("• সহজেই বিরক্ত হওয়া", style: TextStyle(fontSize: 16)),
        Text("• অপমানিত অনুভব করা", style: TextStyle(fontSize: 16)),
        Text("• মনোযোগ কমে যাওয়া", style: TextStyle(fontSize: 16)),
        Text("• অন্যান্য মানুষের প্রতি নেতিবাচক বা ক্ষতিকর চিন্তাভাবনা করা।", style: TextStyle(fontSize: 16)),

        Text("\nআচরণগত", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• ধৈর্য্যের অভাব", style: TextStyle(fontSize: 16)),
        Text("• আক্রমণাত্মক আচরণ বা মারধর করা", style: TextStyle(fontSize: 16)),
        Text("• হিতাহিত জ্ঞান হারিয়ে ফেলা", style: TextStyle(fontSize: 16)),
        Text("• দ্রুত বা আবেগপ্রবণভাবে সিদ্ধান্ত নেয়া", style: TextStyle(fontSize: 16)),
        Text("• নেতিবাচক ভাষা ব্যবহার করা", style: TextStyle(fontSize: 16)),
        Text("• চিৎকার করা", style: TextStyle(fontSize: 16)),
        Text("• ভাঙচুর করা", style: TextStyle(fontSize: 16)),
        Text("• নিজেকে আঘাত করা।", style: TextStyle(fontSize: 16)),

        Text("\nকরণীয়", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• নিজের আবেগ-অনুভূতি ও আচরণের প্রতি লক্ষ্য রাখুন এবং নিয়ন্ত্রণ করার চেষ্টা করুন।", style: TextStyle(fontSize: 16)),
        Text("• ধীর গতিতে শ্বাস নিন। শ্বাস-প্রশ্বাসের ব্যায়াম অনুশীলন করুন।", style: TextStyle(fontSize: 16)),
        Text("• কয়েকবার ধীরে ধীরে ১ থেকে ১০ পর্যন্ত গণনা করুন যা আপনার রাগ কমাতে সাহায্য করবে।", style: TextStyle(fontSize: 16)),
        Text("• প্রতিকূল পরিবেশে মানসিকভাবে স্থির থাকার অভ্যাস করুন।", style: TextStyle(fontSize: 16)),
        Text("• কোনও সমস্যা দেখে বিরক্ত না হয়ে, সমাধান খুঁজুন।", style: TextStyle(fontSize: 16)),
        Text("• মানসিক প্রশান্তির জন্য সাময়িকভাবে স্থান পরিবর্তন করুন।", style: TextStyle(fontSize: 16)),
        Text("• রাগ পুষে না রেখে সরাসরি কথা বলুন।", style: TextStyle(fontSize: 16)),
        Text("• নিজের যত্ন নিন যা আপনাকে শান্ত রাখতে সাহায্য করবে।", style: TextStyle(fontSize: 16)),
        Text("• নিয়মিত ব্যায়াম করুন।", style: TextStyle(fontSize: 16)),
        Text("• প্রতিদিন নির্দিষ্ট সময়ে ঘুমাতে যান এবং পর্যাপ্ত পরিমাণে ঘুমান।", style: TextStyle(fontSize: 16)),
        Text("• নিয়মিত প্রার্থনা করুন।", style: TextStyle(fontSize: 16)),
        Text("• মাইন্ডফুলনেস মেডিটেশন এর অনুশীলন করুন।", style: TextStyle(fontSize: 16)),
        Text("• প্রয়োজনে মেন্টাল হেলথ প্রফেশনালদের সাহায্য নিন।", style: TextStyle(fontSize: 16)),
      ],
    ),
  );

  static Widget fearWidget = const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "ভয় এমন এক বিশেষ অনুভূতি যা কোন বিপদ বা ক্ষতির সম্ভাবনা থেকে উদ্ভূত হয় এবং মানুষকে বিপদজনক পরিস্থিতি সম্পর্কে সচেতন করে তোলে। এটি মানুষের স্বভাবজাত বিষয়। ভয় মানুষের জন্য মাঝে মাঝে উপকারী হলেও মাত্রাতিরিক্ত ভয় বিভিন্ন মানসিক সমস্যার কারণ হতে পারে। তাই ভয়কে সতর্কতা ও দৃঢ় মনোবলের সাথে মোকাবেলা করলে তা আমাদের নিরাপদে থাকতে সাহায্য করবে।",
          style: TextStyle(fontSize: 16),
        ),
        Text("\nকারণসমূহ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• অনাকাঙ্ক্ষিত কোন ঘটনা", style: TextStyle(fontSize: 16)),
        Text("• অতীতের ভয়ঙ্কর বা খারাপ অভিজ্ঞতা", style: TextStyle(fontSize: 16)),
        Text("• বিপদ অথবা অনিরাপদ বোধ করা", style: TextStyle(fontSize: 16)),
        Text("• সামাজিকভাবে প্রত্যাখ্যানের ভয়", style: TextStyle(fontSize: 16)),
        Text("• অন্ধকার ও উচ্চতা", style: TextStyle(fontSize: 16)),
        Text("• প্রাকৃতিক দুর্যোগ", style: TextStyle(fontSize: 16)),
        Text("• কোনও বস্তু বা প্রাণী", style: TextStyle(fontSize: 16)),
        Text("• বংশগত কারণ", style: TextStyle(fontSize: 16)),
        Text("• মৃত্যু ভয়", style: TextStyle(fontSize: 16)),

        Text("\nলক্ষণসমূহ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

        Text("\nশারীরিক", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• বুক ধড়ফড় করা", style: TextStyle(fontSize: 16)),
        Text("• বুকে ব্যথা অনুভব করা", style: TextStyle(fontSize: 16)),
        Text("• শ্বাস-প্রশ্বাস দ্রুত বেড়ে যাওয়া বা শ্বাস নিতে কষ্ট হওয়া", style: TextStyle(fontSize: 16)),
        Text("• শীত শীত অনুভূত হওয়া", style: TextStyle(fontSize: 16)),
        Text("• মুখ শুকিয়ে আসা বা ঘাম হওয়া", style: TextStyle(fontSize: 16)),
        Text("• বমি বমি ভাব বা বমি হওয়া", style: TextStyle(fontSize: 16)),
        Text("• শরীর কাঁপা, মাংস-পেশীতে টান", style: TextStyle(fontSize: 16)),
        Text("• পেটে সমস্যা, যেমন পেট ব্যথা, ডায়রিয়া", style: TextStyle(fontSize: 16)),
        Text("• মাথা ঘোরা, অজ্ঞান হয়ে যাওয়া।", style: TextStyle(fontSize: 16)),

        Text("\nমানসিক", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• অতিরিক্ত দুশ্চিন্তা", style: TextStyle(fontSize: 16)),
        Text("• আতংকিত হওয়া", style: TextStyle(fontSize: 16)),
        Text("• অস্থিরতা বা অস্বস্তিবোধ করা", style: TextStyle(fontSize: 16)),
        Text("• মনোযোগ কমে যাওয়া", style: TextStyle(fontSize: 16)),
        Text("• নেতিবাচক চিন্তা করা", style: TextStyle(fontSize: 16)),
        Text("• হতাশ লাগা।", style: TextStyle(fontSize: 16)),

        Text("\nআচরণগত", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• কোন কিছুর প্রতি আগ্রহ হারানো", style: TextStyle(fontSize: 16)),
        Text("• আত্মবিশ্বাস কমে যাওয়া", style: TextStyle(fontSize: 16)),
        Text("• সামাজিকভাবে বিচ্ছিন্ন হওয়া", style: TextStyle(fontSize: 16)),
        Text("• অতিরিক্ত সাবধানতা বা বিভিন্ন পরিস্থিতি এড়িয়ে চলা।", style: TextStyle(fontSize: 16)),

        Text("\nকরণীয়", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• নিজের আবেগ-অনুভূতি ও আচরণের প্রতি লক্ষ্য রাখুন এবং নিয়ন্ত্রণ করার চেষ্টা করুন।", style: TextStyle(fontSize: 16)),
        Text("• নিয়মিতভাবে শ্বাস-প্রশ্বাসের ব্যায়াম অনুশীলন করুন। বুকভরে শ্বাস নিন।", style: TextStyle(fontSize: 16)),
        Text("• ভয়ের কারণ সম্পর্কে জানুন এবং বিশ্বস্ত কারো সাথে মন খুলে কথা বলুন।", style: TextStyle(fontSize: 16)),
        Text("• দৃঢ় মনোবলের সাথে ভয়কে মোকাবেলা করুন।", style: TextStyle(fontSize: 16)),
        Text("• নেতিবাচক চিন্তা করা বাদ দিন।", style: TextStyle(fontSize: 16)),
        Text("• ইতিবাচক মনোভাবসম্পন্ন লোকের সঙ্গে মিশুন।", style: TextStyle(fontSize: 16)),
        Text("• বিভিন্ন ধরণের ভাল বই পড়ার অভ্যাস করুন।", style: TextStyle(fontSize: 16)),
        Text("• স্বাস্থ্যকর জীবন অভ্যাস গড়ে তুলুন।", style: TextStyle(fontSize: 16)),
        Text("• নিয়মিত ব্যায়াম করুন। পর্যাপ্ত পরিমাণে বিশ্রাম নিন। নিয়মিত প্রার্থনা করুন।", style: TextStyle(fontSize: 16)),
        Text("• মাইন্ডফুলনেস মেডিটেশন এর অনুশীলন করুন।", style: TextStyle(fontSize: 16)),
        Text("• প্রয়োজনে মেন্টাল হেলথ প্রফেশনাল বা মানসিক স্বাস্থ্য বিশেষজ্ঞের সাহায্য নিন।", style: TextStyle(fontSize: 16)),
      ],
    ),
  );

  static Widget disgustWidget = const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "বিরক্তি হল আবেগের এমন একটি প্রতিক্রিয়া যা কোনো কিছু বা কারো প্রতি অসন্তুষ্টির ফলে সৃষ্টি হয়। এটির বহিঃপ্রকাশ এমন কিছু থেকে হয় যা থেকে সাধারণত আমরা দূরে থাকতে চেষ্টা করি বা এড়িয়ে চলতে চাই। বিরক্তি একজন ব্যক্তির সামাজিক যোগাযোগ এবং কার্যকারিতায় ব্যাঘাত ঘটায়। এই আবেগের সঠিক ব্যবস্থাপনা আমাদের মানসিক স্বাস্থ্য এবং সম্পর্কের জন্য অত্যন্ত গুরুত্বপূর্ণ।",
          style: TextStyle(fontSize: 16),
        ),

        Text("\nকারণসমূহ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• অনাকাঙ্ক্ষিত কোন ঘটনার পুনরাবৃত্তি হলে", style: TextStyle(fontSize: 16)),
        Text("• কোনো ব্যক্তির অস্বাভাবিক কার্যকলাপ", style: TextStyle(fontSize: 16)),
        Text("• অস্বস্তিকর আওয়াজ", style: TextStyle(fontSize: 16)),
        Text("• কোন কিছুর দুর্গন্ধ", style: TextStyle(fontSize: 16)),
        Text("• খাবারের অস্বস্তিকর স্বাদ", style: TextStyle(fontSize: 16)),
        Text("• ব্যক্তিগত বা সামাজিক সীমালঙ্ঘন", style: TextStyle(fontSize: 16)),
        Text("• অপরিচ্ছন্ন বা বিশৃঙ্খল পরিবেশ", style: TextStyle(fontSize: 16)),
        Text("• অন্যের অনাকাঙ্ক্ষিত পরামর্শ বা সমালোচনা।", style: TextStyle(fontSize: 16)),

        Text("\nলক্ষণসমূহ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

        Text("\nশারীরিক", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• অস্বস্তি বা অস্থিরতা", style: TextStyle(fontSize: 16)),
        Text("• অঙ্গভঙ্গি বা মুখমণ্ডলের অভিব্যক্তি", style: TextStyle(fontSize: 16)),
        Text("• দুর্বলতা", style: TextStyle(fontSize: 16)),
        Text("• ঘুমের সমস্যা", style: TextStyle(fontSize: 16)),
        Text("• মাথা ধরা বা ব্যথা", style: TextStyle(fontSize: 16)),

        Text("\nমানসিক", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• মনোযোগ কমে যাওয়া", style: TextStyle(fontSize: 16)),
        Text("• চিন্তাগ্রস্ত থাকা", style: TextStyle(fontSize: 16)),
        Text("• দ্বিধাদ্বন্দ্বে ভোগা", style: TextStyle(fontSize: 16)),
        Text("• সহজে রেগে যাওয়া।", style: TextStyle(fontSize: 16)),

        Text("\nআচরণগত", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• আত্মবিশ্বাসের অভাব", style: TextStyle(fontSize: 16)),
        Text("• ধৈর্য হারানো", style: TextStyle(fontSize: 16)),
        Text("• সম্পর্কের অবনতি হওয়া", style: TextStyle(fontSize: 16)),
        Text("• অকারণে চিৎকার  করা", style: TextStyle(fontSize: 16)),
        Text("• মানুষ বা কোন পরিস্থিতি এড়িয়ে চলা", style: TextStyle(fontSize: 16)),
        Text("• কাজের প্রতি অনীহা।", style: TextStyle(fontSize: 16)),

        Text("\nকরণীয়", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• নিজের আবেগ-অনুভূতি ও আচরণের প্রতি লক্ষ্য রাখুন এবং নিয়ন্ত্রণ করার চেষ্টা করুন।", style: TextStyle(fontSize: 16)),
        Text("• শ্বাস-প্রশ্বাসের ব্যায়াম অনুশীলন করুন।", style: TextStyle(fontSize: 16)),
        Text("• সামাজিক কর্মকাণ্ডে নিজেকে যুক্ত করুন।", style: TextStyle(fontSize: 16)),
        Text("• আপনার চেষ্টাগুলোকে মূল্যায়ন করুন।", style: TextStyle(fontSize: 16)),
        Text("• নিজের আবেগ প্রকাশ করুন (কারো সাথে কথা বলুন , ডায়েরি  লিখুন)।", style: TextStyle(fontSize: 16)),
        Text("• নিজের শখের কাজগুলো করুন।", style: TextStyle(fontSize: 16)),
        Text("• শারীরিক সক্রিয়তা বৃদ্ধি করুন যেমন হাঁটা, দৌড়ানো, ইত্যাদি।", style: TextStyle(fontSize: 16)),
        Text("• বিরক্তির কারণ চিহ্নিত করে সমাধান করুন।", style: TextStyle(fontSize: 16)),
        Text("• নিয়মিত প্রার্থনা করুন।", style: TextStyle(fontSize: 16)),
        Text("• মাইন্ডফুলনেস মেডিটেশন এর অনুশীলন করুন।", style: TextStyle(fontSize: 16)),
        Text("• প্রয়োজনে মেন্টাল হেলথ প্রফেশনাল বা মানসিক স্বাস্থ্য বিশেষজ্ঞদের সাহায্য নিন।", style: TextStyle(fontSize: 16)),
      ],
    ),
  );


  static Widget joyWidget = const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "আনন্দ সব আবেগের মধ্যে সবচেয়ে কাঙ্ক্ষিত অনুভূতি। এটি এমন একটি অনুভূতি যেখানে মানুষ মনের গভীর থেকে সন্তুষ্টি অনুভব করে যা ব্যক্তির মনোজগতে ইতিবাচক প্রভাব ফেলে। এটি এমন এক ধরনের আবেগীয় অভিজ্ঞতা যা সাধারণত কোনো পছন্দের ঘটনা বা মুহূর্তের ফলে সৃষ্টি হয়। আনন্দের উৎসগুলো চিহ্নিত করা এবং সেগুলোকে কাজে লাগানোর ফলে আমাদের জীবনে ইতিবাচক পরিবর্তন আসে।  আনন্দ আমাদের জীবনযাত্রায় উৎসাহ যোগায় এবং মানসিকভাবে প্রশান্তি দেয়।",
          style: TextStyle(fontSize: 16),
        ),

        Text("\nকারণসমূহ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• কৃতজ্ঞতা প্রকাশ", style: TextStyle(fontSize: 16)),
        Text("• ব্যক্তিগত সাফল্য অর্জন বা প্রিয়জনের সাফল্য", style: TextStyle(fontSize: 16)),
        Text("• অপরকে ক্ষমা করা", style: TextStyle(fontSize: 16)),
        Text("• আত্ম-উন্নয়ন", style: TextStyle(fontSize: 16)),
        Text("• আপন মানুষের ভালো থাকায়", style: TextStyle(fontSize: 16)),
        Text("• কাছের মানুষদের সাথে সময় কাটানো", style: TextStyle(fontSize: 16)),
        Text("• নিজের বা অন্যের কষ্ট লাঘব করার অভিজ্ঞতা থেকে আনন্দ পাওয়া যায়।", style: TextStyle(fontSize: 16)),

        Text("\nলক্ষণসমূহ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

        Text("\nশারীরিক", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• হাস্যজ্জল চেহারা", style: TextStyle(fontSize: 16)),
        Text("• শারীরিক সুস্থতা", style: TextStyle(fontSize: 16)),
        Text("• সাহসী ও শিথিলভাব", style: TextStyle(fontSize: 16)),
        Text("• শক্তি বৃদ্ধি ও সক্রিয় থাকা।", style: TextStyle(fontSize: 16)),

        Text("\nমানসিক", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• আত্মবিশ্বাসী", style: TextStyle(fontSize: 16)),
        Text("• উৎসাহী", style: TextStyle(fontSize: 16)),
        Text("• মানসিকভাবে চাপহীন থাকা", style: TextStyle(fontSize: 16)),
        Text("• উদ্যোগী", style: TextStyle(fontSize: 16)),
        Text("• বুদ্ধিমত্তার উন্নতি", style: TextStyle(fontSize: 16)),
        Text("• আত্মতৃপ্তি", style: TextStyle(fontSize: 16)),
        Text("• আবেগ-নিয়ন্ত্রণ।", style: TextStyle(fontSize: 16)),

        Text("\nআচরণগত", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• অন্যদের সাথে সামাজিক সুসম্পর্ক", style: TextStyle(fontSize: 16)),
        Text("• অন্যের উপকার করা", style: TextStyle(fontSize: 16)),
        Text("• কৃতজ্ঞতাবোধ", style: TextStyle(fontSize: 16)),
        Text("• সৃজনশীল কাজে অংশ নেওয়া", style: TextStyle(fontSize: 16)),
        Text("• নিজের যত্ন নেয়া।", style: TextStyle(fontSize: 16)),

        Text("\nকরণীয়", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• ইতিবাচক চিন্তা-ভাবনা করুন।", style: TextStyle(fontSize: 16)),
        Text("• সৃষ্টিকর্তার প্রতি কৃতজ্ঞতা প্রকাশ করুন।", style: TextStyle(fontSize: 16)),
        Text("• দুঃখের মূল কারণগুলো খুঁজে বের করে সমাধানের চেষ্টা করুন।", style: TextStyle(fontSize: 16)),
        Text("• সেবামূলক কাজে নিজেকে নিয়োজিত করুন।", style: TextStyle(fontSize: 16)),
        Text("• কাছের মানুষদের সাথে সময় কাটানোর চেষ্টা করুন।", style: TextStyle(fontSize: 16)),
        Text("• নিজেকে সময় দিন এবং পছন্দের কাজ করে সময় কাটান।", style: TextStyle(fontSize: 16)),
        Text("• মানুষের প্রয়োজনে সাহায্যের হাত বাড়িয়ে দিন।", style: TextStyle(fontSize: 16)),
        Text("• যে কোনো পরিস্থিতিতে নিজের উপর নিয়ন্ত্রণ রাখতে শিখুন ।", style: TextStyle(fontSize: 16)),
        Text("• নিজের জীবনের লক্ষ্যগুলি নিয়ে কাজ করুন।", style: TextStyle(fontSize: 16)),
        Text("• অন্যকে স্বীকৃতি দেয়া বা প্রশংসা করার মানসিকতা গড়ে তুলুন।", style: TextStyle(fontSize: 16)),
        Text("• নিজের দক্ষতা বৃদ্ধিতে কাজ করুন।", style: TextStyle(fontSize: 16)),
      ],
    ),
  );

  static Widget anxietyWidget = const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "দুশ্চিন্তা হলো ভবিষ্যতের কোন ঘটনা বা পরিস্থিতি সম্পর্কে মানসিক উদ্বেগ বা অস্থিরতা। দুশ্চিন্তা আমাদের জীবনের একটি অবিচ্ছেদ্য অংশ। প্রতিদিনের ব্যস্ত এবং জটিল জীবনযাত্রায় বিভিন্ন কারণে আমরা দুশ্চিন্তায় ভুগি। ব্যক্তিগত, পারিবারিক, সামাজিক কিংবা পেশাগত দায়িত্বের চাপ প্রতিনিয়ত আমাদের মানসিক অবস্থার ওপর প্রভাব ফেলে । জীবনের ছোট থেকে বড় নানা বিষয় নিয়ে চিন্তা-ভাবনা করা স্বাভাবিক হলেও, অতিরিক্ত দুশ্চিন্তা আমাদের মানসিক এবং শারীরিক স্বাস্থ্যের ওপর নেতিবাচক প্রভাব ফেলতে পারে। এছাড়াও এটি আমাদের দৈনন্দিন স্বাভাবিক কাজকর্মে বাধা দিয়ে জীবনযাত্রার মান কমিয়ে দেয়। তাই, দুশ্চিন্তার কারণগুলো চিহ্নিত করে তা নিয়ন্ত্রণে রাখা অত্যন্ত গুরুত্বপূর্ণ।",

          style: TextStyle(fontSize: 16),
        ),

        Text("\nকারণসমূহ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• শারীরিক অবস্থা সংক্রান্ত ", style: TextStyle(fontSize: 16)),
        Text("• অর্থনৈতিক অবস্থা ", style: TextStyle(fontSize: 16)),
        Text("• অতিরিক্ত কাজের চাপ ", style: TextStyle(fontSize: 16)),
        Text("• পারিবারিক সমস্যা  ", style: TextStyle(fontSize: 16)),
        Text("• দাম্পত্য কলহ বা ডিভোর্স   ", style: TextStyle(fontSize: 16)),
        Text("• প্রাকৃতিক দুর্যোগ  ", style: TextStyle(fontSize: 16)),
        Text("• সোশ্যাল মিডিয়ায় অতিরিক্ত সময় ব্যয় বা ইন্টারনেটের অতিরিক্ত ব্যবহার", style: TextStyle(fontSize: 16)),
        Text("• অতিরিক্ত ধূমপান বা মাদকাসক্তি।", style: TextStyle(fontSize: 16)),

        Text("\nলক্ষণসমূহ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("\nশারীরিক ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• বুক ধড়ফড় করা ", style: TextStyle(fontSize: 16)),
        Text("• দ্রুত শ্বাস-প্রশ্বাস নেওয়া  ", style: TextStyle(fontSize: 16)),
        Text("• ঘুমের ব্যাঘাত ঘটা ", style: TextStyle(fontSize: 16)),
        Text("• ক্ষুধামন্দা হওয়া ", style: TextStyle(fontSize: 16)),
        Text("• মাথাব্যথা করা ", style: TextStyle(fontSize: 16)),
        Text("• ঘাম হওয়া, দুর্বল ও ক্লান্তি লাগা", style: TextStyle(fontSize: 16)),
        Text("• পেটে সমস্যা, যেমন পেট ব্যথা, ডায়রিয়া।", style: TextStyle(fontSize: 16)),

        Text("\nমানসিক ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• অস্থির লাগা ", style: TextStyle(fontSize: 16)),
        Text("• অতিরিক্ত চিন্তা করা বা নেতিবাচক চিন্তা ", style: TextStyle(fontSize: 16)),
        Text("• ভুলে যাওয়া ", style: TextStyle(fontSize: 16)),
        Text("• মনোযোগের অভাব।", style: TextStyle(fontSize: 16)),

        Text("\nআচরণগত ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• সহজে উত্তেজিত হওয়া বা অল্পতেই ভেঙে পড়া বা হতাশ হওয়া ", style: TextStyle(fontSize: 16)),
        Text("• বিচলিত বোধ করা", style: TextStyle(fontSize: 16)),
        Text("• আত্মবিশ্বাসের অভাব ", style: TextStyle(fontSize: 16)),
        Text("• খাবার গ্রহণে অস্বাভাবিকতা।", style: TextStyle(fontSize: 16)),

        Text("\nকরণীয়", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("• নিজের আবেগ-অনুভূতি ও আচরণের প্রতি লক্ষ্য রাখুন এবং নিয়ন্ত্রণ করার চেষ্টা করুন। ", style: TextStyle(fontSize: 16)),
        Text("• নিয়মিতভাবে শ্বাস-প্রশ্বাসের ব্যায়াম অনুশীলন করুন। ", style: TextStyle(fontSize: 16)),
        Text("• শুধুমাত্র বর্তমানের দিকে মনোনিবেশ করুন, ভবিষ্যৎ নিয়ে কম ভাবুন। ", style: TextStyle(fontSize: 16)),
        Text("• সৃজনশীল কাজে নিজেকে নিয়োজিত রাখুন। ", style: TextStyle(fontSize: 16)),
        Text("• শখের কাজ করুন এবং কিছু সময় নিজের জন্য রাখুন। ", style: TextStyle(fontSize: 16)),
        Text("• পর্যাপ্ত ঘুম নিশ্চিত করুন।  ", style: TextStyle(fontSize: 16)),
        Text("• নিয়মিত ব্যায়াম করুন। সর্বদা নিজেকে সক্রিয় রাখুন। স্বাস্থ্যকর খাবার গ্রহণ করুন।  ", style: TextStyle(fontSize: 16)),
        Text("• নিজের সাথে ইতিবাচক কথা বলুন এবং ইতিবাচক মনোভাব সম্পন্ন লোকের সঙ্গে মিশুন।    ", style: TextStyle(fontSize: 16)),
        Text("• সোস্যাল মিডিয়া থেকে কিছু সময়ের জন্য বিরত থাকুন।   ", style: TextStyle(fontSize: 16)),
        Text("• নিজের ভুল ত্রুটি মেনে নিতে শিখুন এবং সকল কাজে নিখুঁত হওয়া থেকে বিরত থাকুন।  ", style: TextStyle(fontSize: 16)),
        Text("• সমস্যাগুলোর একটা তালিকা তৈরি করুন এবং সমাধানের চেষ্টা করুন।  ", style: TextStyle(fontSize: 16)),
        Text("• নিয়মিত প্রার্থনা করুন।     ", style: TextStyle(fontSize: 16)),
        Text("• মাইন্ডফুলনেস মেডিটেশন এর অনুশীলন করুন।  ", style: TextStyle(fontSize: 16)),
        Text("• প্রয়োজনে মেন্টাল হেলথ প্রফেশনালদের সাহায্য নিন।   ", style: TextStyle(fontSize: 16)),
      ],
    ),
  );

}
