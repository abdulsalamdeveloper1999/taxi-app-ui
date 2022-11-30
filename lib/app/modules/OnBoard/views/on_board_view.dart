import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../Widgets/elevated_button_widget.dart';
import '../../../../constants/colors.dart';
import '../controllers/on_board_controller.dart';
import 'into_view.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    return WillPopScope(
      onWillPop: () async {
        return onBackButtonPressed(context);
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                controller: PageController(viewportFraction: 0.9),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return IntroPage(
                    svgUri: images[index],
                    textTitle: textitles[index],
                    textDescrip: textDescrip[index],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  images.length,
                  (index) => _indicator(
                    isActive: _selectedIndex == index ? true : false,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: w * 0.5,
              child: MyButton(
                text: "Get started",
                onPress: () {},
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
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
      margin: EdgeInsets.only(right: 5),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? kprimaryColor : kinactive,
      ),
    );
  }
}

Future<bool> onBackButtonPressed(BuildContext context) async {
  bool exit = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Really?"),
        content: Text('Do you wnat to close app'),
        actions: [
          TextButton(
            onPressed: () {
              (Navigator.of(context).pop(false));
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: Text('yes'),
          ),
        ],
      );
    },
  );
  return exit ?? false;
}
