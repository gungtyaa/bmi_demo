import 'dart:math';

class BMIHelper {
  final num weight;
  final num height;
  num? result;

  BMIHelper({
    required this.weight,
    required this.height,
    this.result,
  });

  String calculateBMIScore() {
    this.result = this.weight / pow(this.height, 2);
    return result!.toStringAsFixed(2);
  }

  String decideDescriptionBasedOnBMIScore() {
    if (this.result! >= 30) {
      return 'Obesity';
    } else if (this.result! <= 29.99 && this.result! >= 25) {
      return 'Overweight';
    } else if (this.result! <= 24.99 && this.result! >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
}
