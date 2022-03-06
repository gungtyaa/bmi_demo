import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String scoreBMI;
  final String descBMI;

  Result({required this.scoreBMI, required this.descBMI});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF2DA),
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Color(0xFF8E9776),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hasil Anda',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Expanded(
              child: Container(
                color: Color(0xFFd5dbb3),
                padding: EdgeInsets.all(50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$descBMI',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40,
                          color: Color(0xFF4a503d),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '$scoreBMI',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 70),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Angka BMI Normal',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '18,5 - 25 BMI',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
