

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../blocs/available_slots_bloc.dart';
import '../blocs/available_slots_state.dart';
import '../widgets/available_slots.dart';

class AvailableSlotsView extends StatefulWidget {
  const AvailableSlotsView({Key? key}) : super(key: key);

  @override
  _AvailableSlotsViewState createState() => _AvailableSlotsViewState();
}

class _AvailableSlotsViewState extends State<AvailableSlotsView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailableSlotsBloc,AvailableSlotsState>(
      bloc:sl<AvailableSlotsBloc>(),
      builder: (context, state) {
       if(state is AvailableSlotsStateInitial){
         return Container();
        }else if(state is AvailableSlotsStateLoading){
          return Center(child: CircularProgressIndicator());
        }else if(state is AvailableSlotsStateLoaded){
         return AvailableSlots(
            slots: state.slots,
          );
        }else{
    return Container();
    }
       }
    );
  }
}