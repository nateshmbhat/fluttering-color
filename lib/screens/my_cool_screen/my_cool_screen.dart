import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttering/screens/my_cool_screen/bloc/bloc.dart';
import 'package:fluttering/screens/my_cool_screen/bloc/event.dart';
import 'package:fluttering/screens/my_cool_screen/bloc/state.dart';

class MyCoolScreen extends StatefulWidget {
  @override
  _MyCoolScreenState createState() => _MyCoolScreenState();
}

class _MyCoolScreenState extends State<MyCoolScreen> {

  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    MyCoolScreenBloc bloc = BlocProvider.of<MyCoolScreenBloc>(context);

    return BlocBuilder(
      bloc: bloc,
      builder: (context, MyCoolState state) {
        return AnimatedContainer(
          color: getColor(state),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: OutlineButton(
                          child: Text("Red"),
                          textColor: Colors.red,
                          splashColor: Colors.redAccent,
                          color: Colors.red,
                          onPressed: () {
                            bloc.add(RedButtonPressedEvent());
                          },
                        )),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: OutlineButton(
                          child: Text("Green"),
                          textColor: Colors.green,
                          splashColor: Colors.green,
                          color: Colors.green,
                          onPressed: () {
                            bloc.add(GreenButtonPressedEvent());
                          },
                        ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(30),
                child: TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(), labelText: 'Color'),
                  onChanged: (str) {
                    bloc.add(ColorTextChangedEvent(str));
                  },
                ),
              ),

              state is WaitingState
                  ? CircularProgressIndicator()
                  : RaisedButton(
                      child: Text("click me "),
                      onPressed: () {
                        bloc.add(MakeApiCallEvent());
                      },
                    )
//              Container(
//                margin: EdgeInsets.only(top: 20),
//                child: IconButton(icon: Icon(Icons.cloud_download),),
//              )
            ],
          ),
          duration: Duration(seconds: 1),
        );
      },
    );
  }

  Color getColor(MyCoolState state) {
    if (state is RedColorState) return Colors.red;
    if (state is GreenColorState) return Colors.green;
    if (state is OtherColorState) {
      switch (state.color) {
        case 'yellow':
          return Colors.yellow;
        case 'white':
          return Colors.white;
        case 'orange':
          return Colors.orange;
        case 'grey':
        case 'gray':
          return Colors.grey;
        case 'purple':
          return Colors.purple;
        case 'black':
          return Colors.black;
        case 'pink':
          return Colors.pink;
        case 'brown':
          return Colors.brown;
        case 'indigo':
          return Colors.indigo;
        default:
          return Colors.blue;
      }
    }
    return Colors.blue;
  }
}
