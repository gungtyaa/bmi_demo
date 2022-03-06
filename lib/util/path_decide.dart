import 'package:flutter/foundation.dart';

String isWeb(String path) {
  if (kIsWeb) {
    return '$path';
  } else {
    return 'assets/$path';
  }
}
