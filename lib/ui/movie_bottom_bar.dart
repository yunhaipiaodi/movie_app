import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MovieBottomTab extends StatelessWidget{

  MovieBottomTab(@required this._currentIndex,@required this._onTap,@required this._items);

  final int _currentIndex;     //当前tab索引
  final ValueChanged<int> _onTap;
  final List<BottomNavigationBarItem> _items;   //tabs 数组


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoTabBar(
      backgroundColor: Colors.black54,
      inactiveColor: Colors.white54,
      activeColor: Colors.white,
      iconSize: 24.0,
      currentIndex: _currentIndex,
      items: _items,
      onTap: _onTap,
    );
  }

}