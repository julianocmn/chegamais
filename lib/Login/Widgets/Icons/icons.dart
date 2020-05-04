import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget iconBox() {
    return new SvgPicture.asset(
      'assets/packing.svg',
      height: 150,
    );
  }

  Widget iconGoogle() {
    return SvgPicture.asset(
      'assets/google.svg',
      height: 30,
    );
  }

  Widget iconFacebook() {
    return SvgPicture.asset(
      'assets/facebook.svg',
      height: 30,
    );
  }

  Widget iconUser() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 7, 0, 7),
      child: SvgPicture.asset(
        'assets/user.svg',
        height: 10,
      ),
    );
  }

  Widget iconPrevious() {
    return SvgPicture.asset(
      'assets/previous.svg',
      height: 30,
    );
  }

  Widget iconLocked() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 7, 0, 7),
      child: SvgPicture.asset(
        'assets/locked.svg',
        height: 10,
      ),
    );
  }