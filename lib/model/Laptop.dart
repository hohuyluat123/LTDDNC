class Laptop {
  final int productId;
  final String brand;
  final String diskType;
  final String capacity;
  final String color;
  final String cpu;
  final String gpu;
  final String ram;
  final bool isDelete;
  final String name;
  final int price;
  final int seller;
  final int sellNumber;
  final String dateAdded;
  final String image;
  final String description;

  Laptop({
    required this.productId,
    required this.brand,
    required this.capacity,
    required this.color,
    required this.isDelete,
    required this.name,
    required this.price,
    required this.cpu,
    required this.gpu,
    required this.ram,
    required this.diskType,
    required this.seller,
    required this.sellNumber,
    required this.dateAdded,
    required this.image,
    required this.description,
  });

  factory Laptop.fromJson(Map<String, dynamic> json) {
    return Laptop(
      productId: json['productId'] as int,
      brand: json['brand'] as String,
      diskType: json['diskType'] as String,
      capacity: json['capacity'] as String,
      cpu: json['CPU'] as String,
      gpu: json['GPU'] as String,
      ram: json['RAM'] as String,
      color: json['color'] as String,
      isDelete: json['isDelete'] as bool,
      name: json['name'] as String,
      price: json['price'] as int,
      seller: json['seller'] as int,
      sellNumber: json['sellNumber'] as int,
      dateAdded: json['dateAdded'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
    );
  }

  static List<Laptop> parseLaptops(List<dynamic> responseBody) {
    try {
      List<Laptop> listLaptop = (responseBody)
          .map((dynamic item) => Laptop.fromJson(item))
          .toList();
      return listLaptop;
    } catch (e) {
      print(e);
      return [];
    }
  }
}