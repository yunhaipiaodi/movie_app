import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_app/redux/app/app_state.dart';
import 'package:movie_app/redux/store.dart';
import 'package:movie_app/ui/movie_app_bar.dart';
import 'package:movie_app/ui/movie_bottom_bar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  Store store = createStore();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
with SingleTickerProviderStateMixin{

  TabController _controller;
  int _selectedTab = 0;

  @override
  void initState(){
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    //背景
    final backgroundImage = Image.asset("assets/images/background_image.jpg",fit:BoxFit.fill);

    //创建内容区组件
    Widget _buildTabContent(){
      return Positioned.fill(
        child: TabBarView(
            children: [
              Text("页面1",style: TextStyle(color: Colors.white),),
              Text("页面2",style: TextStyle(color: Colors.white),),
              Text("页面3",style: TextStyle(color: Colors.white),),
            ],
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
        ),
      );
    }

   //change tab
    void _tabSelected(int newIndex){
      setState(() {
        _selectedTab = newIndex;
        _controller.index = newIndex;
      });
    }


    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final content = Scaffold(
      appBar:PreferredSize(
        child: MovieAppBar(),
        preferredSize: const Size.fromHeight(kToolbarHeight),
      ),
      body:Stack(
        children: <Widget>[
          _buildTabContent(),
          _BottomTabs(
            _selectedTab,
            _tabSelected,
          ),
        ],
      ),

    );

    return StoreProvider<AppState>(
      store: widget.store,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          backgroundImage,
          content,
        ],
      )
    );
  }
}

class _BottomTabs extends StatelessWidget{
  _BottomTabs(this._selectTab,this._onTap);

  final int _selectTab;
  final ValueChanged<int> _onTap;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
      child: MovieBottomTab(
        _selectTab,
        _onTap,
        [
          BottomNavigationBarItem(
            title:Text("在影院"),
            icon: const Icon(Icons.theaters),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            title:Text("上映时间"),
            icon: const Icon(Icons.schedule),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            title:Text("即将到来"),
            icon: const Icon(Icons.whatshot),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
      alignment: Alignment.bottomCenter,
    );
  }

}

