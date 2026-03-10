import 'dart:async';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_club_api/meta_club_api.dart';
import 'package:strawberryhrm/presentation/splash/bloc/splash_state.dart';
import 'package:user_repository/user_repository.dart';

class SplashBloc extends Cubit<SplashState> {
  final Company? selectedCompany;
  StreamSubscription? _onboardingSubscription;

  SplashBloc({required this.selectedCompany, LoginData? data}) : super(SplashState()) {
    initSplash(data);
  }

  void initSplash(LoginData? data) {
    // Show splash for minimum 2 seconds for better UX
    Future.delayed(const Duration(seconds: 2), () async {
      final navigator = instance<GlobalKey<NavigatorState>>().currentState!;
      if (data?.user != null) {
        navigator.pushNamedAndRemoveUntil(Routes.bottomNavigation, (_) => false);
      } else {
        if (selectedCompany == null) {
          navigator.pushReplacementNamed(Routes.onboarding);
        } else {
          navigator.pushReplacementNamed(Routes.login);
        }
      }
    });
  }

  @override
  Future<void> close() {
    _onboardingSubscription?.cancel();
    return super.close();
  }
}
