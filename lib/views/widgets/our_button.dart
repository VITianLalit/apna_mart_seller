import 'package:apna_mart_seller/const/const.dart';
import 'package:apna_mart_seller/views/widgets/text_style.dart';

Widget ourButton({title, color = purpleColor, onPress}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.all(12),
      backgroundColor: color,
    ),
    onPressed: onPress,
    child: boldText(text: title, color: white, size: 16.0),
  );
}
