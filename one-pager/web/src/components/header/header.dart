import 'package:web/web.dart';
import '../../../store.dart';

HTMLDivElement createHeader() {
  AppState state = AppState.instance; // Access the singleton instance

  HTMLDivElement header = document.createElement('header') as HTMLDivElement
    ..className = 'header';
  HTMLDivElement nav = document.createElement('nav') as HTMLDivElement
    ..className = 'nav-tabs';

  // Prepare to store all tab buttons for easy access
  List<HTMLButtonElement> buttons = [];

  for (var tab in state.tabs) {
    HTMLButtonElement button =
        document.createElement('button') as HTMLButtonElement
          ..text = tab.name
          ..className = 'tab-button'
          ..id = 'tab-button-${tab.id}'; // Use a unique ID for each button

    // Store the button in the list
    buttons.add(button);

    button.onClick.listen((_) {
      state.activateTab(tab
          .id); // This internally calls setState, renderTabs, and renderContent
      updateActiveClass(
          buttons, state.activeTab ?? 0); // Update active class for all buttons
    });

    nav.appendChild(button);
  }

  header.appendChild(nav);
  return header;
}

// Function to update the active class on buttons
void updateActiveClass(List<HTMLButtonElement> buttons, int activeTabId) {
  for (var button in buttons) {
    if (button.id == 'tab-button-$activeTabId') {
      button.classList.add('tab-button-active');
    } else {
      button.classList.remove('tab-button-active');
    }
  }
}
