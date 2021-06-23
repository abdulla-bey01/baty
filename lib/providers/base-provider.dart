import 'package:flutter/foundation.dart';

abstract class BaseProvider<T> with ChangeNotifier {
  void updateRequestStatus(T state, {bool notify = false});
}
