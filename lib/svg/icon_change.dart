import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconChange extends StatelessWidget {
  const IconChange({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      """
<svg width="16" height="14" viewBox="0 0 16 14" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path fill-rule="evenodd" clip-rule="evenodd"
        d="M5 0C3.34315 0 2 1.34315 2 3V4H4V3C4 2.44772 4.44772 2 5 2H11C11.5523 2 12 2.44772 12 3V5H10L13 8L16 5L14 5V3C14 1.34315 12.6569 0 11 0H5ZM4 9H6L3 6L0 9H2V11C2 12.6569 3.34315 14 5 14H11C12.6569 14 14 12.6569 14 11V10H12V11C12 11.5523 11.5523 12 11 12H5C4.44772 12 4 11.5523 4 11V9Z"
        fill="#3456D0" />
</svg>
  """,
      semanticsLabel: 'Changement',
      key: const Key('iconChange'),
    );
  }
}
