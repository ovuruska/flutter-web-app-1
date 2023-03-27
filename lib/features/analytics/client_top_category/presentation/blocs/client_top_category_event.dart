import 'package:equatable/equatable.dart';

class ClientTopCategoryEvent extends Equatable {
  const ClientTopCategoryEvent();

  @override
  List<Object> get props => [];
}

class GetClientTopCategoryDistributionEvent extends ClientTopCategoryEvent {
  final int id;

  const GetClientTopCategoryDistributionEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
