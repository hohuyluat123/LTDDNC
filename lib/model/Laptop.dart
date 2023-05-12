class Laptop {
  int productId;
  String brand;
  String diskType;
  String capacity;
  String color;
  String cpu;
  String gpu;
  String ram;
  bool isDelete;
  String name;
  int price;
  int seller;
  int sellNumber;
  String dateAdded;
  String image;
  String description;

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
      dateAdded: json['dateAdded'].toString() as String,
      image: json['image'] as String,
      description: json['description'] as String,
    );
  }
  String toJson() {
    return '{ "brand": "$brand", "diskType": "$diskType", "capacity": "$capacity", "CPU": "$cpu", "GPU": "$gpu", "RAM": "$ram", "color": "$color", "name": "$name", "price": $price, "sellNumber": $sellNumber,"image": "$image","description": "$description"}';
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