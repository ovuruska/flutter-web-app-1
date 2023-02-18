
import 'dart:typed_data';

import 'package:pdf/widgets.dart' as pw;

class PrintViewModel{
  pw.Document document = pw.Document();
  Uint8List content = Uint8List(0);

  setContent(Uint8List uint8list){
    content = uint8list;
    return this;
  }


  setDocument(pw.Document document){
    this.document = document;
    return this;
  }
}