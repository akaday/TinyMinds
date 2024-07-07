class ItemModel {
  final String value;
  final String name;
  final String img;
  bool accepting;

  ItemModel({
    required this.name,
    required this.value,
    required this.img,
    this.accepting = false,
  });
}