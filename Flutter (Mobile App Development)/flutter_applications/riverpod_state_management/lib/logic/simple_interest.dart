import 'package:flutter_riverpod/flutter_riverpod.dart';

final simpleInteresHaitProvider = Provider<SimpleInterestHai>((ref) => SimpleInterestHai());


class SimpleInterestHai {
 

  double calc(int p, int t, int r) {
    return (p*t*r)/100;
  }
}
