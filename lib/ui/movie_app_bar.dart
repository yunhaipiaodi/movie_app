import 'package:flutter/material.dart';
class MovieAppBar extends StatefulWidget{
  @override
  _MovieAppBarState createState() => _MovieAppBarState();
}

class _MovieAppBarState extends State<MovieAppBar>{
  bool _isSearching = false;

  //生成返回按钮
  Widget _backButton(){
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){

        }
    );
  }

  //生成搜索输入框
  Widget _searchInputField(){
    return TextField(
      autofocus: true,
      decoration: const InputDecoration(
        hintText: "输入电影名称...",
        border: InputBorder.none,
      ),
    );
  }

  //生成Appbar的title
  Widget _title(){

    final title = Column(
      children: <Widget>[
        Text(
            "我的电影院",
            style: TextStyle(fontSize: 18.0,color: Colors.white),
        ),
        Text(
          "西虹市首富",
          style: TextStyle(fontSize: 12.0,color: Colors.white),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
    return Row(
      children: <Widget>[
        Image.asset('assets/images/logo.png',width: 28.0,height: 28.0,),
        const SizedBox(width: 8.0,),
        title,
      ],
    );
  }

  //生成action列表
  List<Widget> _buildActions(){
    return [
      IconButton(
        icon:Icon(
            Icons.place,
            color: Colors.white,
            size: 24.0,
        ),
        onPressed: null,
      ),
      IconButton(
        icon:Icon(
          Icons.search,
          color: Colors.white,
          size: 24.0,
        ),
        onPressed: null,
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      leading: _isSearching?_backButton():null,
      title: _isSearching?_searchInputField():_title(),
      actions: _buildActions(),
    );
  }

}