
import 'package:easy_localization/easy_localization.dart';

extension AssetsExtension on String {
  String get toPng => 'assets/images/$this.png';
  String get toLottie => 'assets/lotties/$this.json';
  String get toSVG => 'assets/lotties/svg/$this.svg';
}

extension StringLocalization on String {
  String get translate => this.tr();
}