import 'package:flutter/material.dart';
import 'package:social_mobil_app/feature/_product/_model/sidebars/sidebar_tabbar_items.dart';

class MenuItemModel {
  MenuItemModel({
    this.id,
    this.title = "",
    required this.riveIcon,
  });

  UniqueKey? id = UniqueKey();
  String title;
  TabItem riveIcon;

  static List<MenuItemModel> menuItems = [
    MenuItemModel(
      title: "Home",
      riveIcon: TabItem(stateMachine: "HOME_interactivity", artboard: "HOME"),
    ),
    MenuItemModel(
      title: "Search",
      riveIcon:
          TabItem(stateMachine: "SEARCH_Interactivity", artboard: "SEARCH"),
    ),
    MenuItemModel(
      title: "Favorites",
      riveIcon:
          TabItem(stateMachine: "STAR_Interactivity", artboard: "LIKE/STAR"),
    ),
    MenuItemModel(
      title: "Help",
      riveIcon: TabItem(stateMachine: "CHAT_Interactivity", artboard: "CHAT"),
    ),
     MenuItemModel(
      title: "History",
      riveIcon: TabItem(stateMachine: "TIMER_Interactivity", artboard: "TIMER"),
    ),
    MenuItemModel(
      title: "Notification",
      riveIcon: TabItem(stateMachine: "BELL_Interactivity", artboard: "BELL"),
    ),
  ];

  

  
}