import 'package:apna_mart_seller/const/const.dart';

Widget normalText({text, color = Colors.white, size = 14.0}) {
  return "$text".text.color(color).size(size).make();
}

Widget boldText({text, color, size}) {
  return "$text"
      .text
      .fontWeight(FontWeight.bold)
      .size(size)
      .color(color)
      .make();
}
