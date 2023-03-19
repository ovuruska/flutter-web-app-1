import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/use_case.dart';
import '../../../../../models/Branch.dart';


class SetBranchParams extends Equatable {
  final Branch branch;

  const SetBranchParams({required this.branch});

  @override
  List<Object> get props => [branch];
}

class SetBranchUseCase extends UseCase<Branch, SetBranchParams> {


  SetBranchUseCase();

  @override
  List<Object> get props => [];

  @override
  Future<Either<Failure, Branch>> call(SetBranchParams params) {
    return Future.value(Right(params.branch));
  }
}