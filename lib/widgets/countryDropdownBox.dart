import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryDropdownBox extends StatelessWidget {
  const CountryDropdownBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset("assets/icons/maps-and-flags.svg"),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: DropdownButton(
            isExpanded: true,
            underline: SizedBox(),
            icon: SvgPicture.asset("assets/icons/dropdown.svg"),
            value: "India",
            items: [
              "India",
              "America",
              "South Africa",
              "Japan",
              "South Korea",
              "Brazil",
              "Australia",
            ]
                .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ),
                )
                .toList(),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
