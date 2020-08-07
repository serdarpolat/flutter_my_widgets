import 'package:flutter/material.dart';

class PageIndicator2 extends StatefulWidget {
  @override
  _PageIndicator2State createState() => _PageIndicator2State();
}

class _PageIndicator2State extends State<PageIndicator2> {
  int itemcount = 4;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          PageView.builder(
            itemCount: itemcount,
            controller: _pageController,
            itemBuilder: (context, i) {
              return Container(
                color: Colors.red[(i + 1) * 100],
              );
            },
          ),
          Positioned(
            child: Indicators(
              pageController: _pageController,
            ),
            bottom: 100,
            left: 0,
            right: 0,
          )
        ],
      ),
    );
  }
}

class Indicators extends StatelessWidget {
  final PageController pageController;

  const Indicators({Key key, this.pageController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          return CustomPaint(
            painter: PageIndicatorPainter(
              pageCount: 4,
              dotRadius: 10,
              dotOutlineThickness: 3,
              spacing: 25,
              scrollPosition:
                  pageController.hasClients && pageController.page != null
                      ? pageController.page
                      : 0.0,
              dotFillColor: const Color(0x0F000000),
              dotOutlineColor: const Color(0x20000000),
              indicatorColor: const Color(0xFF444444),
            ),
          );
        });
  }
}

class PageIndicatorPainter extends CustomPainter {
  PageIndicatorPainter({
    @required this.pageCount,
    @required this.dotRadius,
    @required this.dotOutlineThickness,
    @required this.spacing,
    this.scrollPosition = 0.0,
    @required Color dotFillColor,
    @required Color dotOutlineColor,
    @required Color indicatorColor,
  })  : dotFillPaint = Paint()..color = dotFillColor,
        dotOutlinePaint = Paint()..color = dotOutlineColor,
        indicatorPaint = Paint()..color = indicatorColor;

  final int pageCount;
  final double dotRadius;
  final double dotOutlineThickness;
  final double spacing;
  final double scrollPosition;
  final Paint dotFillPaint;
  final Paint dotOutlinePaint;
  final Paint indicatorPaint;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final double totalWidth =
        (pageCount * (2 * dotRadius)) + ((pageCount - 1) * spacing);

    _drawDots(canvas, center, totalWidth);
    _drawPageIndicator(canvas, center, totalWidth);
  }

  void _drawPageIndicator(Canvas canvas, Offset center, double totalWidth) {
    final int pageIndexToLeft = scrollPosition.floor();
    final double leftDotX = (center.dx - (totalWidth / 2)) +
        (pageIndexToLeft * ((2 * dotRadius) + spacing));
    final double transitionPercent = scrollPosition - pageIndexToLeft;

    final double laggingLeftPositionPercent =
        (transitionPercent - 0.3).clamp(0.0, 1.0) / 0.7;
    final double acceleratedRightPositionPercent =
        (transitionPercent / 0.5).clamp(0.0, 1.0);

    final double indicatorLeftX =
        leftDotX + (laggingLeftPositionPercent * ((2 * dotRadius) + spacing));
    final double indicatorRightX = leftDotX +
        (acceleratedRightPositionPercent * ((2 * dotRadius) + spacing)) +
        (2 * dotRadius);
    canvas.drawRRect(
      RRect.fromLTRBR(
        indicatorLeftX,
        -dotRadius,
        indicatorRightX,
        dotRadius,
        Radius.circular(dotRadius),
      ),
      indicatorPaint,
    );
  }

  void _drawDots(Canvas canvas, Offset center, double totalWidth) {
    Offset dotCenter = center.translate((-totalWidth / 2) + dotRadius, 0);

    for (int i = 0; i < pageCount; ++i) {
      _drawDot(canvas, dotCenter);
      dotCenter = dotCenter.translate((2 * dotRadius) + spacing, 0);
    }
  }

  void _drawDot(Canvas canvas, Offset dotCenter) {
    canvas.drawCircle(dotCenter, dotRadius - dotOutlineThickness, dotFillPaint);

    Path outlinePath = Path()
      ..addOval(Rect.fromCircle(
        center: dotCenter,
        radius: dotRadius,
      ))
      ..addOval(Rect.fromCircle(
        center: dotCenter,
        radius: dotRadius - dotOutlineThickness,
      ))
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(outlinePath, dotOutlinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
