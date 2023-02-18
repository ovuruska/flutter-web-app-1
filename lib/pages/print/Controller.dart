import 'dart:typed_data';

import 'package:scrubbers_employee_application/common/Bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'Model.dart';

class PrintViewBloc extends Bloc<PrintViewModel> {
  PrintViewBloc() {
    subject.sink.add(PrintViewModel());
  }

  setContent(Uint8List uint8list){
    subject.sink.add(subject.value.setContent(uint8list));
  }

  setDocument(pw.Document document) {
    subject.sink.add(subject.value.setDocument(document));
  }
}

final printViewBloc = PrintViewBloc();
