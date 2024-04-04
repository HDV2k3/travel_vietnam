import 'package:chandoiqua/utilities/extensions/widget_ref_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widgets/base/base_screen.dart';
import 'onboarding_state.dart';
import 'onboarding_view_model.dart';

class OnboardingScreen extends BaseScreen {
  const OnboardingScreen({super.key});

  @override
  BaseScreenState createState() => _OnboardingState();
}

class _OnboardingState extends BaseScreenState<OnboardingScreen,
    OnboardingViewModel, OnboardingState> {
  @override
  Color? get backgroundColor => ref.colors.background;

  @override
  Widget buildBody(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/IMG_7985.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        SafeArea(
          child: Column(
            children: [
              Flexible(
                flex: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 40.0,
                  ),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Welcome Back!\n',
                            style: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text:
                                '\nThe application provides tourist destinations in Vietnam',
                            style: TextStyle(
                              fontSize: 20,
                              // height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Flexible(
              //   flex: 1,
              //   child: Align(
              //     alignment: Alignment.bottomRight,
              //     child: Row(
              //       children: [
              //         Expanded(
              //           child: GestureDetector(
              //             onTap: () {
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) => SignInScreen(),
              //                 ),
              //               );
              //             },
              //             child: Container(
              //               padding: const EdgeInsets.all(30.0),
              //               decoration: const BoxDecoration(
              //                 color: Colors.transparent,
              //                 borderRadius: BorderRadius.only(
              //                   topLeft: Radius.circular(50),
              //                 ),
              //               ),
              //               child: const Text(
              //                 'Sign in',
              //                 textAlign: TextAlign.center,
              //                 style: TextStyle(
              //                   fontSize: 20.0,
              //                   fontWeight: FontWeight.bold,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Expanded(
              //           child: GestureDetector(
              //             onTap: () {
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) => SignUpScreen(),
              //                 ),
              //               );
              //             },
              //             child: Container(
              //               padding: const EdgeInsets.all(30.0),
              //               decoration: const BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.only(
              //                   topLeft: Radius.circular(50),
              //                 ),
              //               ),
              //               child: const Text(
              //                 'Sign up',
              //                 textAlign: TextAlign.center,
              //                 style: TextStyle(
              //                     fontSize: 20.0,
              //                     fontWeight: FontWeight.bold,
              //                     color: Color(0xFF416FDF)),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return null;
  }

  @override
  AsyncValue<OnboardingState> get state =>
      ref.watch(onboardingViewModelProvider);

  @override
  OnboardingViewModel get viewModel =>
      ref.read(onboardingViewModelProvider.notifier);
}
