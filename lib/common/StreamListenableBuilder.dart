import 'package:flutter/material.dart';

typedef StreamListener<T> = void Function(T value);

class StreamListenableBuilder<T> extends StreamBuilder<T> {

  static Null Function(dynamic value) emptyListener = (dynamic value) {};

  late StreamListener<T>? listener;

  StreamListenableBuilder({
    Key? key,
    T? initialData,
    required Stream<T>? stream,
    this.listener ,
    required AsyncWidgetBuilder<T> builder,
  }) : super(key: key, initialData: initialData, stream: stream, builder: builder){
    listener ??= emptyListener;
  }

  @override
  AsyncSnapshot<T> afterData(AsyncSnapshot<T> current, T data) {
    if(listener != null)
      listener!(data);
    return super.afterData(current, data);
  }
}