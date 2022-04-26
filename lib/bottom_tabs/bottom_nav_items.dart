import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabItem{
  String? title;
  bool? selected;
  Icon? icon;
  TabItem({this.title, this.icon, this.selected});
  TabItem.fromMap(Map<String, dynamic> json) : this(icon: json['icon'], title: json['title'], selected: json['selected']);
}
List<TabItem> tabItems = [
  TabItem(icon: Icon(Icons.music_video_rounded) , title: 'Получение'),
  TabItem(icon: Icon(Icons.star_outline_rounded), title: 'Настройки'),
  TabItem(icon: Icon(Icons.list), title: 'О программе'),];