
class BoolModel {
  bool value;
  BoolModel({this.value = true});

  setValue(bool newValue) {
    value = newValue;
    return this;
  }
}