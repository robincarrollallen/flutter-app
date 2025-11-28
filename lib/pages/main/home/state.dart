import 'package:flutter/foundation.dart';
import '../../../storage/persistent.dart';

class HomeState {
  final showPWA = PersistentRx('showPWA', kIsWeb ? true : false);
}
