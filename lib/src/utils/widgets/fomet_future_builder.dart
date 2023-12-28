import 'package:flutter/material.dart';
import 'package:fomet_app/src/utils/widgets/loading_error_widget.dart';

class FometFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final EdgeInsets padding;
  final Widget Function(T) onSuccess;
  final Widget? errorWidget;
  final Widget? loadingWidget;
  const FometFutureBuilder({
    required this.future,
    required this.onSuccess,
    this.errorWidget,
    this.loadingWidget,
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
            return errorWidget ?? const LoadingErrorWidget();
          }

          return loadingWidget ??
              const Center(
                child: CircularProgressIndicator(),
              );
        },
      ),
    );
  }
}
