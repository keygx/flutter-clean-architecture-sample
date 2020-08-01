import 'package:flutter_clean_architecture/presentaion/responsive/orientation_layout.dart';
import 'package:flutter_clean_architecture/presentaion/responsive/screen_type_layout.dart';
import 'package:flutter/material.dart';

import 'home_page_mobile.dart';
import 'home_page_tablet.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: (context) => HomeMobilePortrait(),
        landscape: (context) => HomeMobileLandscape(),
      ),
      tablet: OrientationLayout(
        portrait: (context) => HomeTabletPortrait(),
        landscape: (context) => HomeTabletLandscape(),
      ),
    );
  }
}
