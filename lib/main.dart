import 'dart:async';

import 'package:dishwasher_timer/state/countdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const DishwasherTimer()));
}

class DishwasherTimer extends ConsumerWidget {
  const DishwasherTimer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      ref.read(countdownProvider.notifier).calculate();
    });
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends ConsumerWidget {
  const Home({super.key});

  String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return '$hours時間$minutes分$seconds秒';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countdown = ref.watch(countdownProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('1時まであと何分？'),
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      ),
      body: Center(
        child: Text(
          formatDuration(countdown),
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
