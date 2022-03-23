import 'dart:developer' as developer;
import 'package:flutter/material.dart';

class Logger extends StatefulWidget {
  const Logger({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _LoggerState createState() => _LoggerState();
}

class _LoggerState extends State<Logger> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    debugPrint('Event: Init state');
    developer.log('Event: Init state', name: 'TAG');
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Event: Build child');
    developer.log('Event: Build child', name: 'TAG');
    return widget.child;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    debugPrint('Event: $state');
    developer.log('Event: $state', name: 'TAG');
  }

  @override
  void dispose() {
    debugPrint('Event: Dispose widget');
    developer.log('Event: Dispose widget', name: 'TAG');
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }
}
