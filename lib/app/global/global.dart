import "package:flutter/material.dart";

const Color primaryColor = Color(0xFF1EA1D9);

Widget text({
  required String string,
  bool isTitle = false,
  bool isSubTitle = false,
}) =>
    Text(
      isTitle || isSubTitle ? string.toUpperCase() : string,
      textAlign: isTitle || isSubTitle ? TextAlign.center : null,
      style: TextStyle(
        fontSize: isTitle ? 21 : (isSubTitle ? 19 : 16),
        fontWeight: isTitle || isSubTitle ? FontWeight.w800 : FontWeight.w500,
        letterSpacing: isTitle || isSubTitle ? 2 : 0,
      ),
    );
