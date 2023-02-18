class ListModel<T> {
  List<T> items;

  ListModel({this.items = const []});

  update(T item) {
    var index = items.indexWhere((element) => element == item);
    if (index == -1) {
      items.add(item);
    } else {
      items[index] = item;
    }
    return this;
  }

  setItems(List<T> items) {
    this.items = items;
    return this;
  }

  addItem(T item) {
    items = List.from(items)..add(item);
    return this;
  }

  removeItem(T item) {
    items = List.from(items)..remove(item);
    return this;
  }

  removeItemAtIndex(int index) {
    items = List.from(items)..removeAt(index);
    return this;
  }

  clearItems() {
    items = [];
    return this;
  }
}
