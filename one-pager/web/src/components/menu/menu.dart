import 'dart:convert';
import 'package:web/web.dart';

/* I could have used [Item] and [Category] as classes to give more structured code, I could give 
as json as in JS project. https://github.com/CaglarKullu/restaurant_page/blob/main/src/components/Menu/Menu.js */

class Item {
  final String name;
  final String description;
  final String price;

  Item({required this.name, required this.description, required this.price});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      description: json['description'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
    };
  }
}

class Category {
  final String category;
  final List<Item> items;

  Category({required this.category, required this.items});

  factory Category.fromJson(Map<String, dynamic> json) {
    var itemsFromJson = json['items'] as List;
    List<Item> itemList = itemsFromJson.map((i) => Item.fromJson(i)).toList();
    return Category(
      category: json['category'],
      items: itemList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}

HTMLDivElement createMenu() {
  final jsonString = '''
    [
      {
        "category": "Starters",
        "items": [
          {"name": "Bruschetta", "description": "Grilled bread garlic, tomatoes, olive oil.", "price": "\$8"},
          {"name": "Stuffed Mushrooms", "description": "Mushrooms filled with herbs cream cheese.", "price": "\$10"}
        ]
      },
      {
        "category": "Main Courses",
        "items": [
          {"name": "Margherita Pizza", "description": "Tomato sauce, mozzarella, and fresh basil.", "price": "\$14"},
          {"name": "Lasagna", "description": "Layers of pasta, ragu, bechamel, and cheese.", "price": "\$18"}
        ]
      }
    ]
  ''';
  final decoded = jsonDecode(jsonString) as List;
  List<Category> categories = decoded.map((c) => Category.fromJson(c)).toList();

  final menu = document.createElement('div') as HTMLDivElement;
  menu.className = 'menu';

  for (var category in categories) {
    final section = document.createElement('section') as HTMLDivElement;
    section.className = 'menu-category';

    final title = document.createElement('h2') as HTMLHeadingElement;
    title.text = category.category;
    title.className = 'category-title';
    section.appendChild(title);

    final itemsList = document.createElement('ul') as HTMLUListElement;
    itemsList.className = 'items-list';

    for (var item in category.items) {
      final listItem = document.createElement('li') as HTMLLIElement;
      listItem.className = 'menu-item';

      final itemName = document.createElement('h3') as HTMLHeadingElement
        ..text = item.name;
      final itemDescription = document.createElement('p')
          as HTMLParagraphElement
        ..text = item.description;
      final itemPrice = document.createElement('p') as HTMLParagraphElement
        ..text = item.price;

      listItem
        ..appendChild(itemName)
        ..appendChild(itemDescription)
        ..appendChild(itemPrice);
      itemsList.appendChild(listItem);
    }

    section.appendChild(itemsList);
    menu.appendChild(section);
  }

  return menu;
}
