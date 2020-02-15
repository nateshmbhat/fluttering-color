abstract class MyCoolEvent{}

class RedButtonPressedEvent extends MyCoolEvent{}

class GreenButtonPressedEvent extends MyCoolEvent{}

class ColorTextChangedEvent extends MyCoolEvent{
  final String color ;
  ColorTextChangedEvent(this.color);
}

class MakeApiCallEvent extends MyCoolEvent{

}
