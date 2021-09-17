
import 'package:flutter/material.dart';
import 'package:idea_hub/main.dart';

abstract class HomeState{
  HomeScreenState screenState;

  HomeState(this.screenState);
  Widget getUI(BuildContext context);
}