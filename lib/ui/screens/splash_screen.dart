import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../presentation/presentation.dart';
import '../providers/splash_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final splashState = ref.watch(splashProvider);

    splashState.when(
      data: (isLoggedIn) {
        Future.microtask(() {
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushReplacementNamed(
              context,
              isLoggedIn ? '/home' : '/startup',
            );
          });
        });
        return const SizedBox();
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );

    return Scaffold(
      body: Center(
        child: RotationTransition(
          turns: _animationController,
          child: Image.asset(Assets.logo, width: 150, height: 150),
        ),
      ),
    );
  }
}
