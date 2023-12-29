import 'package:flutter/material.dart';
import 'package:fomet_ui/fomet_ui.dart';

/// Buttons provide an affordance for the user to understand that an action is
/// possible. While [text] is required, the [leadingIcon] widget is optional and
/// is placed on the right side of the container.
///
/// When pressed, the button's background color changes.
class FometButton extends StatefulWidget {
  /// The button's text.
  final String text;

  /// {@macro fometui.card.onTap}
  final VoidCallback onTap;

  /// An optional widget that is displayed on the right side of the button, in
  /// front of [text].
  final Widget? leadingIcon;

  /// Creates a [FometButton] widget.
  const FometButton({
    required this.text,
    required this.onTap,
    this.leadingIcon,
    super.key,
  });

  @override
  State<FometButton> createState() => _FometButtonState();
}

class _FometButtonState extends State<FometButton> {
  /// Determines whether the button is in the pressed state or not.
  final isPressed = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: ValueListenableBuilder<bool>(
        valueListenable: isPressed,
        builder: (context, pressed, child) {
          // Animates the background color when the component is pressed
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(
              horizontal: FometDimensions.space2x,
              vertical: FometDimensions.small,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(FometDimensions.space4x),
              border: Border.all(
                color: FometColors.primary,
              ),
              color: pressed ? FometColors.primaryHovered : null,
            ),
            child: child,
          );
        },
        // The actual button content
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.leadingIcon != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: FometDimensions.space2x,
                ),
                child: widget.leadingIcon,
              ),
            Flexible(
              child: Text(
                widget.text,
                style: FometTypography.regular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}