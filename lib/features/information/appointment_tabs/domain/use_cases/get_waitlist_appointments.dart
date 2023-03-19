import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/use_case.dart';
import '../../../../../widgets/cards/root/entity.dart';
import '../repositories/view_appointments_repository.dart';

class GetWaitlistAppointmentsUseCase
    extends UseCase<List<DashboardAppointmentEntity>, NoParams> {
  final ViewAppointmentsRepository repository;

  GetWaitlistAppointmentsUseCase(this.repository);

  @override
  Future<Either<Failure, List<DashboardAppointmentEntity>>> call(
      NoParams params) async {
    return await repository.getWaitlistAppointments();
  }
}
