import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import 'base_screen_mixin.dart';

abstract class BaseScreen extends ConsumerStatefulWidget {
  const BaseScreen({super.key});
}

abstract class BaseScreenState<Screen extends BaseScreen, ViewModel, State>
    extends ConsumerState<Screen> with BaseScreenMixin {
  final logger = Logger();

  ViewModel get viewModel;

  AsyncValue<State> get state;

  @override
  @Deprecated(
    'Override `onInitState()` instead of `initState()`',
  )
  void initState() {
    super.initState();
    onInitState();
  }

  @override
  @Deprecated(
    'Override `onDispose()` instead of `dispose()`',
  )
  void dispose() {
    onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => buildScreen(context);

  @mustCallSuper
  void onInitState() {
    logger.d('Init State: $runtimeType');
  }

  @mustCallSuper
  void onDispose() {
    logger.d('Dispose: $runtimeType');
  }
}
