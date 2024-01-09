# fomet_ui

The `fomet_ui` package is a component library used by the FometApp application. The default font is [Mukta](https://fonts.google.com/specimen/Mukta), which is also used by all `Text` and `RichText` widgets outside of this package. The components exported by this package are the following:

 1. [FometBottomNavigationBar](https://github.com/albertodev01/fomet_app/blob/main/packages/fomet_ui/lib/src/bottom_navigation_bar/bottom_navigation_bar.dart)
 2. [FometButton](https://github.com/albertodev01/fomet_app/blob/main/packages/fomet_ui/lib/src/button/fomet_button.dart)
 3. [FometCard](https://github.com/albertodev01/fomet_app/blob/main/packages/fomet_ui/lib/src/card/fomet_card.dart)
 4. [FometSideNavigationBar](https://github.com/albertodev01/fomet_app/blob/main/packages/fomet_ui/lib/src/side_navigation_bar/side_navigation_bar.dart)

The `lib/src/common` folder exports a series of constant values for dimensions, colors and text styles. Rather than hard-coding font families and sizes for example, use the `FometTypography` class. It defines a series of reusable text styles that are easier to maintain and test:

```dart
// Bad
Text(
  'hello',
  style: const TextStyle(
    fontFamily: 'Mukta',
    fontWeight: FontWeight.w400,
    color: FometColors.primaryText,
  ),
),

// Good
Text(
  'hello',
  style: FometTypography.regular,
),
```

The same also applies for `FometColors` and `FometDimensions` classes.