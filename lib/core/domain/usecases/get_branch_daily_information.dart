
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_daily_information.dart';
import 'package:scrubbers_employee_application/core/domain/repositories/branch_repository.dart';

class GetBranchDailyInformationParams extends Equatable {
  final int id;
  final DateTime date;

  GetBranchDailyInformationParams({
    required this.id,
    required this.date,
  });

  @override
  List<Object> get props => [id, date];

}


class GetBranchDailyInformationUseCase {
  final BranchRepository repository;

  GetBranchDailyInformationUseCase(this.repository);

  Future<BranchDailyInformationEntity?> call(
      GetBranchDailyInformationParams params) async {
    var response =  await repository.getDailyInformation(params.id, params.date);
    if(response.isLeft()){
      return null;
    }else{
      return response.getOrElse(() => BranchDailyInformationEntity());
    }
  }
}