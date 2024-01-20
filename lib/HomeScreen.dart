import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = LiquidController();

  final pages = [
    Container(
      color: Colors.purple,
      child: const Center(
        child: Text('Screen 1'),
      ),
    ),
    Container(
      color: Colors.green,
      child: const Center(
        child: Text('Screen 2'),
      ),
    ),
    Container(
      color: Colors.orange,
      child: const Center(
        child: Text('Screen 3'),
      ),
    ),
    Container(
      color: Colors.grey,
      child: const Center(
        child: Text('Screen 4'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            liquidController: controller,
            enableSideReveal: true,
            slideIconWidget: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            pages: pages,
            onPageChangeCallback: (index) {
              setState(() {});
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    controller.jumpToPage(page: pages.length - 1);
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                AnimatedSmoothIndicator(
                  activeIndex: controller.currentPage,
                  count: pages.length,
                  effect: const WormEffect(
                      spacing: 15,
                      dotColor: Colors.white54,
                      activeDotColor: Colors.black54),
                  onDotClicked: (index) {
                    controller.animateToPage(page: index);
                  },
                ),
                TextButton(
                  onPressed: () {
                    final page = controller.currentPage + 1;
                    controller.animateToPage(
                      page: page > pages.length ? 0 : page,
                      duration: 700,
                    );
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ContentView(
// contentBackColor: Colors.blue.shade700,
// imageUrl: 'assets/linkedin.png',
// title: 'Linked In',
// subTitle: 'LinkedIn is a professional networking platform that allows individuals to connect with colleagues, employers, and other '
// 'professionals. Users create profiles that serve as virtual resumes, highlighting their work experience, education, skills, and '
// 'recommendations. LinkedIn is widely used for job searching, recruitment, and professional networking.',
// ),

// ContentView(
// contentBackColor: Colors.green.shade700,
// imageUrl: 'assets/whatsapp.png',
// title: 'WhatsApp',
// subTitle: 'WhatsApp is a popular messaging application that allows users to send text messages, voice messages, multimedia files '
// '(such as photos and videos), and make voice and video calls. Here are some key features and information about WhatsApp:',
// ),

// ContentView(
// contentBackColor: Colors.red.shade700,
// imageUrl: 'assets/youtube.png',
// title: 'YouTube',
// subTitle: ' Users can access YouTube through web browsers or the official mobile apps for iOS and Android. YouTube has become a '
// 'significant platform for entertainment, education, and information, with billions of users around the world. ',
// ),

// ContentView(
// contentBackColor: Colors.yellow.shade700,
// imageUrl: 'assets/snapchat.png',
// title: 'Snapchat',
// subTitle: 'Snapchat is primarily a mobile app available for iOS and Android devices. It has been popular among younger users for its '
// 'ephemeral and creative nature. Over time, Snapchat has expanded its features to compete with other social media platforms.',
// ),

// ContentView(
// contentBackColor: Colors.deepOrange,
// imageUrl: 'assets/subscribe.png',
// title: 'Please Subscribe',
// subTitle: "Join our community! Follow & Subscribe now for these type of videos and be part of THECODEME. "
// "Together, let's explore, learn, and grow!",
// ),
