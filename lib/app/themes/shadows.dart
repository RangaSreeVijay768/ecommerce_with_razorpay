import 'package:flutter/cupertino.dart';


abstract class shadows {
  static const bs_primary = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.2),
    offset: Offset(
      5.0,
      5.0,
    ),
    blurRadius: 10.0,
    spreadRadius: 2.0,
  );
  static const bs_grey = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.25),
    offset: Offset(
      0.0,
      4.0,
    ),
    blurRadius: 4.0,
    spreadRadius: 0.0,
  );
  static const bs_cart = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.10),
    offset: Offset(
      0.0,
      11.0,
    ),
    blurRadius: 24.0,
    spreadRadius: 0.0,
  );

// box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);

}
