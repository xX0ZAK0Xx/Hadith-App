import 'package:flutter/material.dart';

TextStyle appStyle(Color c, FontWeight fw, double s) =>
    TextStyle(color: c, fontWeight: fw, fontSize: s);

TextStyle appStyleInter(Color c, FontWeight fw, double s,) =>
    TextStyle(color: c, fontWeight: fw, fontSize: s, fontFamily: 'Inter');

TextStyle appStylePoppins(Color c, FontWeight fw, double s,) =>
    TextStyle(color: c, fontWeight: fw, fontSize: s, fontFamily: 'Poppins');

TextStyle appStyleLato(Color c, FontWeight fw, double s,) =>
    TextStyle(color: c, fontWeight: fw, fontSize: s, fontFamily: 'Lato');

Color bgColor() => const Color(0xffF4F4F4);
Color appGreen() => const Color(0xff1AA483);
Color appGrey() => const Color(0xff5D646F);

