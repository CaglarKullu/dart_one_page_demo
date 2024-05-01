import 'package:web/helpers.dart';

import 'src/components/footer/footer.dart';
import 'src/components/header/header.dart';
import 'store.dart';

void main() {
  final app = document.querySelector('#output') as HTMLDivElement;
  AppState state = AppState.instance; // Singleton
  app.innerHTML = ''; // Clear existing content
  app.appendChild(createHeader());
  state.activateTab(state.activeTab!);
  app.appendChild(createFooter());
}
