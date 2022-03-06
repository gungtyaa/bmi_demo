import 'package:bmi_calculator/domain/bmi_helper.dart';
import 'package:bmi_calculator/page/information.dart';
import 'package:bmi_calculator/page/result.dart';
import 'package:bmi_calculator/util/path_decide.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  num weight = 0;
  num height = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF2DA),
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Color(0xFF8E9776),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Information();
                }),
              );
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: _formKey,
              child: Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                  isWeb('weight.jpeg'),
                                ),
                                radius: 75,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Your Weight '),
                          Text(
                            '(kg)',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            child: TextFormField(
                              validator: (isWeightData) {
                                if (isWeightData == null ||
                                    isWeightData.isEmpty) {
                                  return 'Please insert your weight!';
                                }
                                return null;
                              },
                              onChanged: (weightValue) {
                                setState(() {
                                  weight = num.parse(weightValue);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                  isWeb('height.png'),
                                ),
                                radius: 75,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Your Height '),
                          Text(
                            '(m)',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            child: TextFormField(
                              validator: (isHeightData) {
                                if (isHeightData == null ||
                                    isHeightData.isEmpty) {
                                  return 'Please insert your height!';
                                }
                                return null;
                              },
                              onChanged: (heightValue) {
                                setState(() {
                                  height = num.parse(heightValue);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  BMIHelper bmiHelper =
                      BMIHelper(weight: weight, height: height);

                  String scoreBMI = bmiHelper.calculateBMIScore();
                  String descBMI = bmiHelper.decideDescriptionBasedOnBMIScore();

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Result(
                      scoreBMI: scoreBMI,
                      descBMI: descBMI,
                    );
                  }));
                }
              },
              child: Text('Calculate your BMI'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(double.infinity, 50),
                primary: Color(0xFF4B513F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
