import 'package:apna_mart_seller/const/const.dart';
import 'package:apna_mart_seller/views/widgets/text_style.dart';

Widget productDropdown() {
  return DropdownButtonHideUnderline(
          child: DropdownButton<String>(
    hint: normalText(text: "Choose category", color: fontGrey),
    value: null,
    isExpanded: true,
    items: const [],
    onChanged: (value) {},
  ))
      .box
      .white
      .padding(const EdgeInsets.symmetric(horizontal: 10))
      .roundedSM
      .make();
}
