import 'package:flutter/material.dart';

class CardImg extends StatelessWidget {

  final CardModel _cardModel;

  CardImg(this._cardModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        size: Size(200, 240),
        foregroundPainter: CardPainter(_cardModel),
        child: Image(
              image: AssetImage(_cardModel.imgPath),
              width: 200,
              height: 240,
              fit: BoxFit.fill,
            ),
      ),
    );
  }
}

class CardPainter extends CustomPainter {
  var _bgPainter;
  var _textPainter;

  CardModel _cardModel;

  CardPainter(CardModel cardModel) {
    this._cardModel = cardModel;
    _bgPainter = Paint()
      ..color = Color.fromRGBO(0, 92, 175, 0.6)
      ..style = PaintingStyle.fill;

    _textPainter = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 6.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (_cardModel.hasTarget) {
      canvas.drawRect(Offset.zero & size, _bgPainter);
      canvas.drawLine(Offset(size.width / 4 + 10, size.height * 0.45), Offset(size.width / 4 + 32, size.height * 0.66 + 2), _textPainter);
      canvas.drawLine(Offset(size.width / 4 + 30, size.height * 0.66), Offset(size.width * 0.75, size.height / 3), _textPainter);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CardModel {
  String imgPath;
  bool hasTarget;
}