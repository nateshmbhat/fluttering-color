import 'dart:ui';

class MyCoolState{}

class RedColorState extends MyCoolState{}

class GreenColorState extends MyCoolState{}

class OtherColorState extends MyCoolState{
  final String color ;
  OtherColorState(this.color);
}

class WaitingState extends MyCoolState{}
