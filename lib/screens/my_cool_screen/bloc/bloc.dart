
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttering/screens/my_cool_screen/bloc/event.dart';
import 'package:fluttering/screens/my_cool_screen/bloc/state.dart';

class MyCoolScreenBloc extends Bloc<MyCoolEvent,MyCoolState>{
  @override
  MyCoolState get initialState => GreenColorState();

  @override
  Stream<MyCoolState> mapEventToState(MyCoolEvent event) async* {

    if(event is RedButtonPressedEvent){
      yield RedColorState() ;
    }

    if(event is GreenButtonPressedEvent){
      yield GreenColorState() ;
    }

    if(event is ColorTextChangedEvent && event.color.isNotEmpty){
      yield OtherColorState(event.color) ;
    }

    if(event is MakeApiCallEvent){
      yield WaitingState() ;
      await Future.delayed(Duration(seconds: 2)) ;
      yield OtherColorState('pink') ;
    }

    yield state ;
  }

}
