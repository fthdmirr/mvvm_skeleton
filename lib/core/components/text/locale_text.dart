import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

import '../../extensions/string_extensions.dart';


class LocalText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const LocalText({Key? key,required this.text, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text.translate,
      style: style,
    );
  }
}