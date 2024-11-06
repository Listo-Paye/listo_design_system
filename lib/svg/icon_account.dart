import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconAccount extends StatelessWidget {
  const IconAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      """
<svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect width="28" height="28" rx="14" fill="#2E3862"/>
<path d="M17 9.76471C17 11.2354 15.7148 12.5294 14 12.5294C12.2852 12.5294 11 11.2354 11 9.76471C11 8.29405 12.2852 7 14 7C15.7148 7 17 8.29405 17 9.76471Z" stroke="white" stroke-width="2"/>
<path d="M21 22.0001C21 18.3615 17.866 15.4119 14 15.4119C10.134 15.4119 7 18.3615 7 22.0001" stroke="white" stroke-width="2"/>
</svg>
  """,
      semanticsLabel: 'Compte',
      key: const Key('iconAccount'),
    );
  }
}
