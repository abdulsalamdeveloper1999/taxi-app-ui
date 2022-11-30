import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/constants/colors.dart';
import 'package:taxi_app/constants/weight.dart';
import '../../../../Widgets/my_text.dart';

List<String> images = [
  'assets/icons/onboardOne.png',
  'assets/icons/onboardTwo.png',
  'assets/icons/onboardThree.png',
];
List<String> textitles = [
  'Accept a job',
  'Tracking Realtime',
  'Earn Money',
];
List<String> textDescrip = [
  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
];

class IntroPage extends StatelessWidget {
  final svgUri;
  final textTitle;
  final textDescrip;
  const IntroPage({
    Key? key,
    required this.svgUri,
    required this.textTitle,
    required this.textDescrip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    int _selectedIndex = 0;

    return Column(
      children: [
        MyText(
          text: "$textTitle",
          size: 42 * sp,
          weight: kfour,
          color: Colors.black,
          fontFamily: 'Medel',
        ),
        SizedBox(height: h * 0.01),
        MyText(
          text: "$textDescrip",
          size: 16 * sp,
          fontFamily: 'Poppins',
          color: Color(0xff525252),
        ),
        Expanded(
          child: Image.asset(
            "$svgUri",
            height: 300,
          ),
        ),
      ],
    );
  }
}

class _indicator extends StatelessWidget {
  final bool isActive;
  const _indicator({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? kprimaryColor : kinactive,
      ),
    );
  }
}
