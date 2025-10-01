class BookModel {
  final int id;
  final String name;
  final String image;
  final int price;

  BookModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });
}

List<BookModel> books = [
  BookModel(
    id: 1,
    name: "The Republic",
    image: "assets/images/bookCart.png",
    price: 285,
  ),
  BookModel(
    id: 2,
    name: "The Republic",
    image: "assets/images/bookCart.png",
    price: 285,
  ),
  BookModel(
    id: 3,
    name: "The Republic",
    image: "assets/images/bookCart.png",
    price: 285,
  ),
  BookModel(
    id: 4,
    name: "The Republic",
    image: "assets/images/bookCart.png",
    price: 285,
  ),
];
