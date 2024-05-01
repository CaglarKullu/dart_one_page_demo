import 'package:web/web.dart';

HTMLDivElement createHomepage() {
  final homepage = document.createElement('div') as HTMLDivElement;
  homepage.className = 'homepage';
  homepage.style.backgroundImage = 'url(../../../../../assets/restaurant.jpg)';
  final heading = document.createElement('h1');
  heading.textContent = 'Welcome to Our Restaurant';
  homepage.appendChild(heading);
  return homepage;
}
