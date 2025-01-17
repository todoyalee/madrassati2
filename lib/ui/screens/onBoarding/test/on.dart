import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:madrassati/ui/screens/onBoarding/test/slide.dart';
import 'package:madrassati/presentation/presentation.dart';

class BoardingPage extends StatefulWidget {
  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingPage> {
  // creating all the widget before making our home screeen

  int _currentPage = 0;
  List<Slide> _slides = [];
  PageController _pageController = PageController();

  @override
  void initState() {
    _currentPage = 0;
    _slides = [
      Slide(Assets.on1,
          "Let’s get started by setting up your profile and enrolling in your courses"),
      Slide(Assets.on2,
          "Access all your classes, assignments, and grades in one place"),
      Slide(Assets.on3, "Welcome to your learning platform!"),
    ];
    _pageController = PageController(initialPage: _currentPage);
    super.initState();
  }

  List<Widget> _buildSlides() {
    return _slides.map(_buildSlide).toList();
  }

  Widget _buildSlide(Slide slide) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.all(32),
            child: Image.asset(slide.image, fit: BoxFit.contain),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Text(
            slide.heading,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(
          height: 230,
        )
      ],
    );
  }

  // handling the on page changed
  void _handlingOnPageChanged(int page) {
    setState(() => _currentPage = page);
  }

  // building page indicator
  Widget _buildPageIndicator() {
    Row row = Row(mainAxisAlignment: MainAxisAlignment.center, children: []);
    for (int i = 0; i < _slides.length; i++) {
      row.children.add(_buildPageIndicatorItem(i));
      if (i != _slides.length - 1)
        row.children.add(SizedBox(
          width: 12,
        ));
    }
    return row;
  }

  Widget _buildPageIndicatorItem(int index) {
    return Container(
      width: index == _currentPage ? 8 : 5,
      height: index == _currentPage ? 8 : 5,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == _currentPage
              ? Color.fromRGBO(136, 144, 178, 1)
              : Color.fromRGBO(206, 209, 223, 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: _handlingOnPageChanged,
            physics: BouncingScrollPhysics(),
            children: _buildSlides(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: <Widget>[
                _buildPageIndicator(),
                SizedBox(
                  height: 32,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: SizedBox(
                    width: double.infinity,
                    child: GradientButton(
                      callback: () {
                        _pageController.animateToPage(
                          _currentPage + 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(255, 255, 0, 1),
                        Color.fromRGBO(255, 255, 0, 1),

                        //Color.fromRGBO(20, 200, 220, 1),
                        //Color.fromRGBO(75, 183, 183, 1)
                        //Colors.blue
                      ]),
                      elevation: 0,
                      increaseHeightBy: 28,
                      increaseWidthBy: double.infinity,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        "MADRASSATI",
                        style: TextStyle(
                          letterSpacing: 4,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
