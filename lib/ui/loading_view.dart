import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:movie_app/model/loading_status.dart';
import 'package:meta/meta.dart';
class LoadingView extends StatefulWidget{

  LoadingView(
      @required this.loadingStatus,
      @required this.loadingContent,
      @required this.errorContent,
      @required this.successContent,
      );

  final LoadingStatus loadingStatus;
  final Widget loadingContent;
  final Widget errorContent;
  final Widget successContent;

  @override
  LoadingViewState createState() => LoadingViewState();
}

class LoadingViewState extends State<LoadingView> with SingleTickerProviderStateMixin{
  AnimationController _loadingController;
  AnimationController _errorController;
  AnimationController _successController;

  bool get loadingContentVisible => _loadingController.value == 1.0;
  bool get errorContentVisible => _errorController.value == 1.0;
  bool get successContentVisible => _successController.value == 1.0;

  Queue<ValueGetter<TickerFuture>> _animationStack = Queue();

  @override
  void initState(){
    super.initState();
    _loadingController = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );
    _errorController = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );
    _successController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    switch(widget.loadingStatus){
      case LoadingStatus.idle:
      case LoadingStatus.loading:
        _animationStack.add(_loadingController.forward);
        break;
      case LoadingStatus.error:
        _animationStack.add(_errorController.forward);
        break;
      case LoadingStatus.success:
        _animationStack.add(_successController.forward);
        break;
    }

    _playAnimations();
  }

  @override
  void dispose(){
    _loadingController.dispose();
    _errorController.dispose();
    _successController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(LoadingView oldView){
    super.didUpdateWidget(oldView);

    if(oldView.loadingStatus != widget.loadingStatus){
      ValueGetter<TickerFuture> reverseAnimation;

      switch(oldView.loadingStatus){
        case LoadingStatus.idle:
        case LoadingStatus.loading:
          reverseAnimation = _loadingController.reverse;
          break;
        case LoadingStatus.error:
          reverseAnimation = _errorController.reverse;
          break;
        case LoadingStatus.success:
          reverseAnimation = _successController.reverse;
          break;
      }
    }

    _playAnimations();
  }



  void _playAnimations() async{
    await _animationStack.first();
    _animationStack.removeFirst();
    if(_animationStack.isNotEmpty){
      _playAnimations();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.center,
      children: [

      ],
    );
  }

}

class _TransitionAnimation extends StatelessWidget{

  _TransitionAnimation({
    this.key,
    this.controller,
    this.child,
    this.isVisible
  }):_opacity = Tween(begin: 0.0, end:1.0).animate(
    CurvedAnimation(
        parent: controller,
        curve: const Interval(0.000,0.650,curve: Curves.ease),
    ),
  ),_yTranslation = Tween(begin: 40.0,end:1.0).animate(
      CurvedAnimation(
          parent: controller,
          curve: const Interval(0.000,0.650,curve: Curves.ease),
      )
  );

  final Key key;
  final AnimationController controller;
  final Widget child;
  final bool isVisible;

  final Animation<double> _opacity;
  final Animation<double> _yTranslation;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
      animation: controller,
      builder: (_,__){
        return _opacity.value == 0.0
            ?const SizedBox.shrink()
            :IgnorePointer(
                key:key,
                ignoring: !isVisible,
                child: Transform(
                    transform: Matrix4.translationValues(0.0, _yTranslation.value, 0.0),
                    child: Opacity(opacity: _opacity.value,child: child,),
                ),
        );
      },
    );
  }

}