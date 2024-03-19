import "package:bmi_calculator/Widgets/weight_and_height.dart";
import "package:bmi_calculator/assets/colors.dart";
import "package:bmi_calculator/Widgets/gender.dart";
import "package:bmi_calculator/interfaces/result_page.dart";
import "package:bmi_calculator/models/data_model.dart";
import "package:bmi_calculator/provider/my_app_provider.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:provider/provider.dart";

class HomeInterface extends StatefulWidget {
  static const String routeName = 'home interface';
  const HomeInterface({super.key});

  @override
  State<HomeInterface> createState() => _HomeInterfaceState();
}

class _HomeInterfaceState extends State<HomeInterface> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyAppProvider>(context);
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          provider.isMale = true;
                        },
                        child: Gender(
                          Gicon: Icons.male,
                          Gtype: "Male",
                          Gcolor: provider.isMale ? darkWhite : lightRed,
                        ),
                      ),
                      
                      const Expanded(
                        child: SizedBox(),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          provider.isMale = false;
                        },
                        child: Gender(
                          Gicon: Icons.female,
                          Gtype: "Female",
                          Gcolor: provider.isMale ? lightRed : darkWhite,
                        ),
                      )
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(top: 8, bottom: 8),
                      decoration: BoxDecoration(
                          color: lightRed,
                          borderRadius: BorderRadius.circular(25)),
                      height: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("HEIGHT",
                              style:
                                  TextStyle(fontSize: 20, color: lightWhite)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "${(provider.sliderValue * 100).toInt()}",
                                style: TextStyle(
                                  fontSize: 44,
                                  fontWeight: FontWeight.w700,
                                  color: lightWhite,
                                ),
                              ),
                              Text(
                                "cm",
                                style: TextStyle(color: lightWhite),
                              )
                            ],
                          ),
                          Slider(
                              value: provider.sliderValue,
                              onChanged: (Value) {
                                setState(() {});
                                provider.sliderValue = Value;
                              })
                        ],
                      )),
                  Container(
                    height: 300,
                    child: Row(
                      children: [
                        WeightAndHeight(
                          heightOrWeight: 'WEIGHT',
                          count: provider.weight,
                          decrement: provider.weightDecrement,
                          increment: provider.weightIncrement,
                        ),
                        Expanded(child: SizedBox()),
                        WeightAndHeight(
                          heightOrWeight: "AGE",
                          count: provider.age,
                          increment: provider.ageIncrement,
                          decrement: provider.ageDecrement,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                ResultPage.routeName,
                arguments: Result(
                  height: provider.sliderValue,
                  isMale: provider.isMale,
                  weight: provider.weight.toDouble(),
                  age: provider.age,
                ),
              );
            },
            child: Container(
              child: Text(
                "CALCULATE",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              color: Colors.cyan,
              height: 60,
              alignment: Alignment.center,
            ),
          )
        ],
      ),
    );
  }
}
