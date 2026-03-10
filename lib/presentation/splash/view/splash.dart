import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strawberryhrm/animation/bounce_animation/bounce_animation_builder.dart';
import 'package:strawberryhrm/presentation/authentication/bloc/authentication_bloc.dart';
import 'package:strawberryhrm/presentation/onboarding/bloc/onboarding_bloc.dart';
import 'package:strawberryhrm/presentation/splash/bloc/splash_bloc.dart';

typedef SplashScreenFactory = SplashScreen Function();

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => const SplashScreen());
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _hasNavigated = false;

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthenticationBloc>().state.data;

    return BlocListener<OnboardingBloc, OnboardingState>(
      listener: (context, onboardingState) {
        // Wait for minimum 2 seconds and onboarding to finish loading
        if (!_hasNavigated && (onboardingState.status == NetworkStatus.success || onboardingState.status == NetworkStatus.failure)) {
          _hasNavigated = true;
          Future.delayed(const Duration(seconds: 2), () {
            if (!mounted) return;
            final navigator = instance<GlobalKey<NavigatorState>>().currentState!;
            if (user?.user != null) {
              navigator.pushNamedAndRemoveUntil(Routes.bottomNavigation, (_) => false);
            } else {
              if (onboardingState.selectedCompany == null) {
                navigator.pushReplacementNamed(Routes.onboarding);
              } else {
                navigator.pushReplacementNamed(Routes.login);
              }
            }
          });
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                BounceAnimationBuilder(
                  builder: (_, __) {
                    return Center(
                      child: InteractiveViewer(
                        scaleEnabled: false,
                        boundaryMargin: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Image.asset(
                          key: const ValueKey('SPLASH_LOGO'),
                          "assets/images/app_icon.png",
                          scale: 3,
                        ),
                      ),
                    );
                  },
                )
              ],
            )),
      ),
    );
  }
}
