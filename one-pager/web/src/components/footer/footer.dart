import 'package:web/web.dart';

HTMLDivElement createFooter() {
  final footer = document.createElement('footer') as HTMLDivElement;
  footer.className = 'footer';
  final footerText = document.createElement('p') as HTMLParagraphElement;
  footerText.textContent = '© 2024 Restaurant Page. All rights reserved.';

  footer.appendChild(footerText);

  return footer;
}
