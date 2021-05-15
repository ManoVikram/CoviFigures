import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business_logic/blocs/covidCasesIndiaBloc/covid_cases_india_bloc.dart';

class CountryDropdownBox extends StatefulWidget {
  const CountryDropdownBox({
    Key key,
  }) : super(key: key);

  @override
  _CountryDropdownBoxState createState() => _CountryDropdownBoxState();
}

class _CountryDropdownBoxState extends State<CountryDropdownBox> {
  String state = "All";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CovidCasesIndiaBloc>(context).add(
      FetchCovidCasesDataEvent(
        state: state,
      ),
    );

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
            value: state,
            items: [
              "All",
              "Andaman and Nicobar Islands",
              "Andhra Pradesh",
              "Arunachal Pradesh",
              "Assam",
              "Bihar",
              "Chandigarh",
              "Chhattisgarh",
              "Dadra and Nagar Haveli and Daman and Diu",
              "Delhi",
              "Goa",
              "Gujarat",
              "Haryana",
              "Himachal Pradesh",
              "Jammu and Kashmir",
              "Jharkhand",
              "Karnataka",
              "Kerala",
              "Ladakh",
              "Lakshadweep",
              "Madhya Pradesh",
              "Maharashtra",
              "Manipur",
              "Meghalaya",
              "Mizoram",
              "Nagaland",
              "Odisha",
              "Puducherry",
              "Punjab",
              "Rajasthan",
              "Sikkim",
              "Tamil Nadu",
              "Telangana",
              "Tripura",
              "Uttar Pradesh",
              "Uttarakhand",
              "West Bengal",
            ]
                .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ),
                )
                .toList(),
            onChanged: (value) {
              print(value);
              setState(() {
                state = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
