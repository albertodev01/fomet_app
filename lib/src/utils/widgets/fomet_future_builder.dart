import 'package:flutter/material.dart';
import 'package:fomet_app/src/utils/widgets/loading_error_widget.dart';

/// A custom [FutureBuilder] widget that has default error and loading widgets.
class FometFutureBuilder<T> extends StatelessWidget {
  /// The future that has to be awaited.
  final Future<T> future;

  /// Optional padding around the builder.
  final EdgeInsets padding;

  /// This callback is called when the future executes with success **and** the
  /// returned value is not null.
  final Widget Function(T) onSuccess;

  /// The widget returned when the future completes with an error.
  final Widget? errorWidget;

  /// The widget returned while the future is not yet completed.
  final Widget? loadingWidget;

  /// Creates a [FometFutureBuilder] widget.
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
          // Success (with data)
          if (snapshot.hasData) {
            return onSuccess(snapshot.requireData);
          }

          // Error widget
          if (snapshot.hasError) {
            return errorWidget ?? const LoadingErrorWidget();
          }

          // Default loading indicator
          return loadingWidget ??
              const Center(
                child: CircularProgressIndicator(),
              );
        },
      ),
    );
  }
}
