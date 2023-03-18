

import 'package:equatable/equatable.dart';

class BranchIdAndName extends Equatable{
  final int id;
  final String name;

  BranchIdAndName({
    required this.id,
    required this.name,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];

  toString() => name;

}