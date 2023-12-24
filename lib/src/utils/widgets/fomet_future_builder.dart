import 'package:flutter/material.dart';
import 'package:fomet_app/src/utils/widgets/loading_error_widget.dart';

class FometFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final EdgeInsets padding;
  final Widget Function(T) onSuccess;
  const FometFutureBuilder({
    required this.future,
    required this.onSuccess,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: FutureBuilder<T>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return onSuccess(snapshot.requireData);
          }

          if (snapshot.hasError) {
            return const LoadingErrorWidget();
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
