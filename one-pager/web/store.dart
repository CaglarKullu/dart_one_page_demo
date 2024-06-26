import 'package:web/web.dart';

import 'src/components/about/about.dart';
import 'src/components/contact/contact.dart';
import 'src/components/homepage/homepage.dart';
import 'src/components/menu/menu.dart';

/* I could have used tab and app state as classes to give more structured code, I could give 
as json as in JS project. https://github.com/CaglarKullu/restaurant_page/blob/main/src/store.js */

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
      Tab(3, 'Menu', false, createMenu),
    ]);
    return _instance!;
  }

  // setState function
  void setState(Map<String, dynamic> newState) {
    if (newState.containsKey('activeTab')) {
      activeTab = newState['activeTab'];
      for (var tab in tabs) {
        tab.active = (tab.id == activeTab);
      }
    }
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

    /* We need a NodeList wrapper since as per the docs it returns a NodeList.
    Although is not an Array, it is possible to iterate over it with forEach(). 
    It can also be converted to a real Array using Array.from(). 
    However, some older browsers have not implemented NodeList.forEach() nor Array.from(). 
    This can be circumvented by using Array.prototype.forEach()*/

    // for loop instead of forEach for querySelectorAll
    for (var i = 0; i < tabButtons.length; i++) {
      var tabButton = tabButtons.item(i) as HTMLButtonElement;
      if (tabButton.id == activeTab) {
        print(tabButton.id.toString());
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
