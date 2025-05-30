import 'package:flutter/widgets.dart';

extension WidgetSpacing on int{
  SizedBox get hspace{
    assert(this >=0);
    return SizedBox(width: toDouble());
  }
  SizedBox get vspace{
    assert(this >=0);
    return SizedBox(height: toDouble());
  }
}