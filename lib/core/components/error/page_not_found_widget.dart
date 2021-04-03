import 'package:flutter/material.dart';

import '../../extensions/context_extensions.dart';

class PageNotFoundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'Page Not Found',
        style: context.textTheme.bodyText1,
      ),
    ));
  }
}
