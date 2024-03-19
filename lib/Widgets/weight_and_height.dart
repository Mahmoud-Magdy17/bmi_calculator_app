import 'package:bmi_calculator/assets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeightAndHeight extends StatefulWidget {
  final String heightOrWeight;
  final int count;

  final void Function() decrement;

  final void Function() increment;

  WeightAndHeight({
    super.key,
    required this.heightOrWeight,
    required this.count,
    required this.decrement,
    required this.increment,
  });

  @override
  State<WeightAndHeight> createState() => _WeightAndHeightState();
}

class _WeightAndHeightState extends State<WeightAndHeight> {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: lightRed,
      ),
      width: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.heightOrWeight,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xffEAF4D3),
            ),
          ),

          // style: TextStyle(fontSize: 20, color: lightWhite)),
          Text(
            "${widget.count}",
            style: TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.w700,
              color: Color(0xffEAF4D3),
            ),
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: widget.increment,
                child: CircleAvatar(
                  minRadius: 28,
                  child: Icon(
                    Icons.add,
                    size: 32,
                  ),
                ),
              ),
              GestureDetector(
                onTap: widget.decrement,
                child: CircleAvatar(
                  minRadius: 28,
                  child: Icon(
                    Icons.horizontal_rule,
                    size: 32,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
