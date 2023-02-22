import 'package:flutter/material.dart';

class DogAppointmentsProvider extends StatefulWidget {
  final int petId;
  const DogAppointmentsProvider({Key? key, required this.petId})
      : super(key: key);

  @override
  _DogAppointmentsProviderState createState() =>
      _DogAppointmentsProviderState();
}

class _DogAppointmentsProviderState extends State<DogAppointmentsProvider> {

  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Parent'),),
      body: Center(child: Text('Parent'),),);
  }
}
