import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  PageController pageController;
  double pageOffset = 0;
  List<SlidingCardItem> slidingCards = List<SlidingCardItem>();

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });

    slidingCards = [
      SlidingCardItem(
        'Shenzhen GLOBAL DESIGN AWARD 2018',
        '4.20-30',
        '1.jpg',
      ),
      SlidingCardItem(
        'Dawan District, Guangdong Hong Kong and Macao',
        '4.28-31',
        '2.jpg',
      ),
      SlidingCardItem(
        'Dawan District, Guangdong Hong Kong and Macao',
        '4.28-31',
        '3.jpg',
      ),
      SlidingCardItem(
        'Dawan District, Guangdong Hong Kong and Macao',
        '4.28-31',
        '4.jpg',
      ),
    ];
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return SlidingCard(
                sci: slidingCards[index],
                offset: pageOffset - (index),
              );
            },
            controller: pageController,
            itemCount: slidingCards.length,
          ),
        ),
      ),
    );
  }
}

class SlidingCardItem {
  final String name;
  final String date;
  final String assetName;

  SlidingCardItem(this.name, this.date, this.assetName);
}

class SlidingCard extends StatelessWidget {
  final SlidingCardItem sci;
  final double offset;

  const SlidingCard({
    Key key,
    @required this.sci,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child: Image.asset(
                'assets/images/${sci.assetName}',
                height: MediaQuery.of(context).size.height * 0.35,
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: CardContent(
                name: sci.name,
                date: sci.date,
                offset: gauss,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String name;
  final String date;
  final double offset;

  const CardContent(
      {Key key,
      @required this.name,
      @required this.date,
      @required this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
            offset: Offset(8 * offset, 0),
            child: Text(name, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 8),
          Transform.translate(
            offset: Offset(32 * offset, 0),
            child: Text(
              date,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Spacer(),
          Row(
            children: <Widget>[
              Transform.translate(
                offset: Offset(48 * offset, 0),
                child: RaisedButton(
                  color: Color(0xFF162A49),
                  child: Transform.translate(
                    offset: Offset(24 * offset, 0),
                    child: Text('Reserve'),
                  ),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  onPressed: () {},
                ),
              ),
              Spacer(),
              Transform.translate(
                offset: Offset(32 * offset, 0),
                child: Text(
                  '0.00 \$',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(width: 16),
            ],
          )
        ],
      ),
    );
  }
}
