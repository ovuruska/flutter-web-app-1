import 'package:flutter/material.dart';

typedef StreamListener<T> = void Function(T value);

class StreamListenableBuilder<T> extends StreamBuilder<T> {

  final StreamListener<T>? listener;

  const StreamListenableBuilder({
    Key? key,
    T? initialData,
    required Stream<T>? stream,
    required this.listener,
    required AsyncWidgetBuilder<T> builder,
  }) : super(key: key, initialData: initialData, stream: stream, builder: builder);

  @override
  AsyncSnapshot<T> afterData(AsyncSnapshot<T> current, T data) {
    listener!(data);
    return super.afterData(current, data);
  }
}