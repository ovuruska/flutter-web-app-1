import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';


class InfiniteScrollableTable<T extends Object> extends StatefulWidget {
  final Future<List<T>> Function(int) fetchPage;
  final int pageSize;
  final Widget Function(BuildContext, T, int) itemBuilder;

  const InfiniteScrollableTable(
      {Key? key, required this.fetchPage, this.pageSize = 20, required this.itemBuilder})
      : super(key: key);

  @override
  _InfiniteScrollableTableState<T> createState() => _InfiniteScrollableTableState<T>();
}

class _InfiniteScrollableTableState<T extends Object> extends State<InfiniteScrollableTable<T>> {

  final PagingController<int, T>
      _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      int pageIndex = pageKey ~/ widget.pageSize;
      List<T> newItems = await widget.fetchPage(pageIndex) as List<T>;
      final isLastPage = newItems.length < widget.pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) =>
      // Don't worry about displaying progress or error indicators on screen; the
      // package takes care of that. If you want to customize them, use the
      // [PagedChildBuilderDelegate] properties.
      PagedListView<int, T>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<T>(
          itemBuilder: (BuildContext context, T item,int index) => widget.itemBuilder(context, item, index)
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
