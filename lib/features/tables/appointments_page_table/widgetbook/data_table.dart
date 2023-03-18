import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart'
    show WidgetbookUseCase;

import '../presentation/widgets/infinite_scrollable_table.dart';

Future<List<int>> fetchPageInfinite(int pageKey) async {
  return List.generate(20, (index) => index + pageKey);
}

Future<List<int>> fetchPage(int pageKey) async {
  if (pageKey >= 100) {
    return List.generate(5, (index) => index + pageKey);
  }
  return fetchPageInfinite(pageKey);
}

Widget itemBuilder<int>(BuildContext context, int item, int index) {
  return Container(
    child: Text(item.toString()),
  );
}

@WidgetbookUseCase(
    name: 'Empty infinite scrollable data table', type: InfiniteScrollableTable)
Widget infiniteScrollableTableUseCase(BuildContext context) {
  Future<List<int>> fetchPage(int pageKey) async {
    return <int>[];
  }

  Widget itemBuilder(BuildContext context, int item, int index) {
    return Container();
  }

  return InfiniteScrollableTable<int>(
    fetchPage: fetchPage,
    itemBuilder: itemBuilder,
  );
}

@WidgetbookUseCase(
    name: 'Multiple pages infinite scrollable data table',
    type: InfiniteScrollableTable)
Widget infiniteScrollableTableUseCaseMultiplePages(BuildContext context) {


  return InfiniteScrollableTable<int>(
    fetchPage: fetchPage,
    itemBuilder: itemBuilder,
  );
}


@WidgetbookUseCase(
    name: 'Multiple pages infinite scrollable data table',
    type: InfiniteScrollableTable)
Widget infiniteScrollableTableUseCaseInfinitePages(BuildContext context) {

  return InfiniteScrollableTable<int>(
    fetchPage: fetchPageInfinite,
    itemBuilder: itemBuilder,
  );
}
