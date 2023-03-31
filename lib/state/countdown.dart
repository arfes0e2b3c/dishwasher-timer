import 'package:flutter_riverpod/flutter_riverpod.dart';

final countdownProvider = StateNotifierProvider<CountdownNotifier, Duration>(
    (ref) => CountdownNotifier());

class CountdownNotifier extends StateNotifier<Duration> {
  CountdownNotifier()
      : super(
          target.difference(DateTime.now()),
        );
  static final now = DateTime.now();
  static final target = DateTime(now.year, now.month, now.day + 1, 1, 0);

  void calculate() {
    final diff = target.difference(DateTime.now());
    state = diff;
  }
}
