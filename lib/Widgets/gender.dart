import 'package:bmi_calculator/assets/colors.dart';
import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  final IconData Gicon;
  final String Gtype;
  final Color Gcolor;
  Gender({required this.Gicon,required this.Gtype, required this.Gcolor,});

  @override
  Widget build(BuildContext context) {
    return Container(
              // margin: EdgeInsets.only(right: 8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Gcolor,
                  borderRadius: BorderRadius.circular(24)),
              width: 140,
              height: 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Gicon,
                    color: lightWhite,
                    size: 80,
                  ),
                  Text(
                    Gtype,
                    style: TextStyle(
                      color: lightWhite.withAlpha(200),
                      fontSize: 30
                    ),
                  ),
                ],
              ),
            )
          ;
  }
}

/*

    



 */