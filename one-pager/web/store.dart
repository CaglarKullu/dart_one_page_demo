import 'package:web/web.dart';

import 'src/components/about/about.dart';
import 'src/components/contact/contact.dart';
import 'src/components/homepage/homepage.dart';
import 'src/components/menu/menu.dart';

// Tab class
class Tab {
  int id;
  String name;
  bool active;
  Function content;

  Tab(this.id, this.name, this.active, this.content);
}

// AppState class as singleton
class AppState {
  int? activeTab;
  List<Tab> tabs;
  static AppState? _instance;

  AppState._internal(this.activeTab, this.tabs);

  static AppState get instance {
    _instance ??= AppState._internal(0, [
      Tab(0, 'Home', true, createHomepage),
      Tab(1, 'About', false, createAbout),
      Tab(2, 'Contact', false, createContact),
      Tab(3, 'Menu', false, createMenu)
    ]);
    return _instance!;
  }

  // setState function
  void setState(Map<String, dynamic> newState) {
    newState.forEach((key, value) {
      if (key == 'activeTab' && value != null) {
        activeTab = value;
        for (var tab in tabs) {
          tab.active = (tab.id == activeTab);
        }
      }
    });
  }

  // activateTab function
  void activateTab(int newTabId) {
    setState({'activeTab': newTabId});
    renderTabs();
    renderContent();
  }

  // renderTabs function
  void renderTabs() {
    final activeTab = AppState.instance.activeTab;
    NodeList tabButtons = document.querySelectorAll('.tab-button');
    // wrapper for querySelectorAll
    for (var i = 0; i < tabButtons.length; i++) {
      var tabButton = tabButtons.item(i) as Element;
      if (int.parse(tabButton.id) == activeTab) {
        tabButton.classList.add('active');
      } else {
        tabButton.classList.remove('active');
      }
    }
  }

  // renderContent function
  void renderContent() {
    // Get mainConten. Create if not yet created
    HTMLDivElement mainContent = document.querySelector('#main-content')
            as HTMLDivElement? ??
        document.createElement('div') as HTMLDivElement
      ..id = 'main-content'
      ..classList.add('main-content');
    final app = document.querySelector('#output') as HTMLDivElement;
    // Append mainContent if not yet appended
    if (mainContent.parentElement == null) {
      app.appendChild(mainContent);
    }

    final activeTab = AppState.instance.activeTab ?? 0; // Get active tab
    mainContent.innerHTML = ''; // Clear existing content
    mainContent.append(tabs[activeTab].content()); // Update with new content
  }
}
