<div align="center">
<img src="https://raw.githubusercontent.com/albertodev01/fomet_app/main/assets/svg/logo.svg?token=GHSAT0AAAAAABY5OZRAFHQOYS6HHEY7OU5MZL2BAFA" height="72" width="72 alt="FometApp logo" />
</div>
<div align="center">Official application of the Fomet SpA company.</div>
<div align="center">
    <a href="https://github.com/albertodev01/fomet_app/actions"><img src="https://github.com/albertodev01/fomet_app/workflows/equations_ci/badge.svg" alt="CI status" /></a>
    <a href="https://github.com/albertodev01/fomet_app/stargazers"><img src="https://img.shields.io/github/stars/fomet_app/equations.svg?style=flat&logo=github&colorB=blue&label=stars" alt="Stars count on GitHub" /></a>
</div>

---

The FometApp application is built using Flutter so that it can run on Android, iOS, web, Windows, macOS and Linux. We use [FVM](https://fvm.app/docs/getting_started/installation) to make sure that all developers use the same Flutter version when working on the project . Once you have `fvm` installed (check the guide on the official website), run this command from the project root:

```bash
fvm use
```

It will install on your machine the Flutter version that is used by this project (unless you already have it). After installing FVM, you will **always** have to use it when working on the project. For example:

- use `fvm flutter pub get` instead of `flutter pub get`
- use `fvm flutter doctor` instead of `flutter doctor`
- use `fvm flutter test` instead of `flutter test`
- use `fvm flutter run` instead of `flutter run`

If you don't use `fvm`, your local Flutter tool will be used and it might not be compatible with this project. This is to make sure that all developers work on the same version. If you don't like to work with the command line, you can configure Android Studio or VS Code to use the Flutter version provided by FVM rather than your global one. In addition, here are some Wiki pages that you might want to read:

1. [Project overview](https://github.com/albertodev01/fomet_app/wiki/Project-overview), to learn how the repository is structured and how packages are arranged.

2. [Code quality and testing](https://github.com/albertodev01/fomet_app/wiki/Code-quality), to know how we do our best to keep the code quality high and which testing strategies we adopt in the project.

3. [Localization](https://github.com/albertodev01/fomet_app/wiki/Localization), to know how we avoid hard-coding strings and support multiple locales.

Whenever you merge your branch into `main`, a Flutter web build of the FometApp application is generated and deployed to [GitHub Pages](https://albertodev01.github.io/fomet_app/). In this way, you can always see the status of the latest stable build by running it on your web browser.
