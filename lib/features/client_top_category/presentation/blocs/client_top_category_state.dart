

import 'package:equatable/equatable.dart';

class ClientTopCategoryState extends Equatable {
  const ClientTopCategoryState();

  @override
  List<Object> get props => [];
}

class ClientTopCategoryInitial extends ClientTopCategoryState {}

class ClientTopCategoryLoading extends ClientTopCategoryState {}

class ClientTopCategoryLoaded extends ClientTopCategoryState {
  final Map<String, double> data;

  const ClientTopCategoryLoaded({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}
