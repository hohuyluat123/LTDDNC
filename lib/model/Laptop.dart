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
  final int status;
  final String image;

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
    required this.status,
    required this.image,
  });

  factory Laptop.fromJson(Map<String, dynamic> json) {
    print(json);
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
      status: json['status'] as int,
      image: json['image'] as String,
    );
  }
}