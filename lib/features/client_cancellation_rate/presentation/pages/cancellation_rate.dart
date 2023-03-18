import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/client_cancellation_rate/presentation/widgets/cancellation_rate.dart';

import '../../../../injection.dart';
import '../bloc/cancellation_rate_bloc.dart';
import '../bloc/cancellation_rate_state.dart';

class CancellationRateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CancellationRateBloc, CancellationRateState>(
      bloc: sl<CancellationRateBloc>(),
      builder: (context, state) {
        if (state is CancellationRateInitial) {
          return Container();
        } else if (state is CancellationRateLoadingState) {
          return Container();
        } else if (state is CancellationRateLoaded) {
          return CancellationRate(rate: state.rate);
        }else {
          return Container();
        }
      },
    );
  }
}
