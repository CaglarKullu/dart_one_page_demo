import 'package:web/web.dart';

HTMLDivElement createHeader() {
  final homepage = document.createElement('div') as HTMLDivElement;
  homepage.className = 'header';
  return homepage;
}
