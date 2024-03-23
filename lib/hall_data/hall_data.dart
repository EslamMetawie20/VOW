class Hotel {
  int id;
  final String name;
  final List<String> imagePaths;
  final String address;
  final int stars;
  final double rating;
  final String description;
  final double price;
  bool isSaved=false;

  Hotel({
    required this.id,
    required this.name,
    required this.imagePaths,
    required this.address,
    required this.stars,
    required this.rating,
    required this.description,
    required this.price,
    required this.isSaved,
  });

  // Convert Hotel object to a Map for database operations
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imagePaths': imagePaths.join(','), // Convert list to comma-separated string
      'address': address,
      'stars': stars,
      'rating': rating,
      'description': description,
      'price': price,
      'isSaved': isSaved ? 1 : 0,
    };
  }

  // Create a Hotel object from a Map retrieved from the database
  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
      id: map['id'],
      name: map['name'],
      imagePaths: (map['imagePaths'] as String).split(','), // Convert comma-separated string to list
      address: map['address'],
      stars: map['stars'],
      rating: map['rating'],
      description: map['description'],
      price: map['price'],
      isSaved: map['isSaved'] == 1,
    );
  }
}
List<Hotel> getHotels() {
  List<Hotel> hotels = [
    Hotel(
      name: "فندق السماء",
      imagePaths: [
        "lib/hallphoto/hall1 (1).jpeg",
        "lib/hallphoto/hall1 (2).jpeg",
        // Add more image paths as needed
      ],
      address: "123 شارع السماء، المدينة",
      stars: 5,
      rating: 4.5,
      description: "فندق فاخر في قلب المدينة",
      price: 200, id: 1,
      isSaved: false,
    ),
    Hotel(
      name: "فندق السماء",
      imagePaths: [
        "lib/hallphoto/hall1 (1).jpeg",
        "lib/hallphoto/hall1 (2).jpeg",
        "lib/hallphoto/hall1 (3).jpeg",
        "lib/hallphoto/hall1 (1).jpeg",
        "lib/hallphoto/hall1 (2).jpeg",
        "lib/hallphoto/hall1 (3).jpeg",
        "lib/hallphoto/hall1 (1).jpeg",
        "lib/hallphoto/hall1 (2).jpeg",
        "lib/hallphoto/hall1 (3).jpeg",

      ],
      address: "123 شارع السماء، المدينة",
      stars: 5,
      rating: 4.5,
      description: "فندق فاخر في قلب المدينة",
      price: 250,id: 2,
      isSaved: false,
    ),
    Hotel(
      name: "فندق السماء",
      imagePaths: [
        "lib/hallphoto/hall1 (1).jpeg",
        "lib/hallphoto/hall1 (2).jpeg",
        "lib/hallphoto/hall1 (3).jpeg",
        "lib/hallphoto/hall1 (1).jpeg",
        "lib/hallphoto/hall1 (2).jpeg",
        "lib/hallphoto/hall1 (3).jpeg",
        "lib/hallphoto/hall1 (1).jpeg",
        "lib/hallphoto/hall1 (2).jpeg",
        "lib/hallphoto/hall1 (3).jpeg",

      ],
      address: "123 شارع السماء، المدينة",
      stars: 5,
      rating: 4.5,
      description: "فندق فاخر من الاخر",
      price: 250,id: 3,
      isSaved: false,
    ),
    Hotel(
      name: "فندق السماء",
      imagePaths: [
        "lib/hallphoto/hall1 (1).jpeg",
        "lib/hallphoto/hall1 (2).jpeg",
        // Add more image paths as needed
      ],
      address: "123 شارع السماء، المدينة",
      stars: 5,
      rating: 4.5,
      description: "فندق فاخر في قلب المدينة",
      price: 200,id: 4,
      isSaved: false,
    ),
    Hotel(
      name: "فندق السماء",
      imagePaths: [
        "lib/hallphoto/hall1 (1).jpeg",
        "lib/hallphoto/hall1 (2).jpeg",
        "lib/hallphoto/hall1 (3).jpeg",
        "lib/hallphoto/hall1 (1).jpeg",
        "lib/hallphoto/hall1 (2).jpeg",
        "lib/hallphoto/hall1 (3).jpeg",
        "lib/hallphoto/hall1 (1).jpeg",
        "lib/hallphoto/hall1 (2).jpeg",
        "lib/hallphoto/hall1 (3).jpeg",

      ],
      address: "123 شارع السماء، المدينة",
      stars: 5,
      rating: 4.5,
      description: "فندق فاخر في قلب المدينة",
      price: 250,id: 5,
      isSaved: false,
    ),
    Hotel(
      name: "فندق السماء",
      imagePaths: [
        "lib/hallphoto/hall1 (1).jpeg",
        "lib/hallphoto/hall1 (2).jpeg",
        "lib/hallphoto/hall1 (3).jpeg",
        "lib/hallphoto/hall1 (1).jpeg",
        "lib/hallphoto/hall1 (2).jpeg",
        "lib/hallphoto/hall1 (3).jpeg",
        "lib/hallphoto/hall1 (1).jpeg",
        "lib/hallphoto/hall1 (2).jpeg",
        "lib/hallphoto/hall1 (3).jpeg",

      ],
      address: "123 شارع السماء، المدينة",
      stars: 5,
      rating: 4.5,
      description: "فندق فاخر في قلب المدينة",
      price: 250,id: 6,
      isSaved: false,
    ),
    Hotel(
      name: "فندق السماء",
      imagePaths: [
        "lib/hallphoto/hall1 (1).jpeg",
        "lib/hallphoto/hall1 (2).jpeg",
        // Add more image paths as needed
      ],
      address: "123 شارع السماء، المدينة",
      stars: 5,
      rating: 4.5,
      description: "فندق فاخر في قلب المدينة",
      price: 200,id: 7,
      isSaved: false,
    ),
    Hotel(
      name: "فندق السماء",
      imagePaths: [
        "lib/hallphoto/hall1 (1).jpeg",
        "lib/hallphoto/hall1 (2).jpeg",
        "lib/hallphoto/hall1 (3).jpeg",
        "lib/hallphoto/hall1 (1).jpeg",
        "lib/hallphoto/hall1 (2).jpeg",
        "lib/hallphoto/hall1 (3).jpeg",
        "lib/hallphoto/hall1 (1).jpeg",
        "lib/hallphoto/hall1 (2).jpeg",
        "lib/hallphoto/hall1 (3).jpeg",

      ],
      address: "123 شارع السماء، المدينة",
      stars: 5,
      rating: 4.5,
      description: "فندق فاخر في قلب المدينة",
      price: 250,id: 8,
      isSaved: false,
    ),
    Hotel(
      name: "فندق السماء",
      imagePaths: [
        "lib/hallphoto/hall1 (1).jpeg",
        "lib/hallphoto/hall1 (2).jpeg",
        "lib/hallphoto/hall1 (3).jpeg",
        "lib/hallphoto/hall1 (1).jpeg",
        "lib/hallphoto/hall1 (2).jpeg",
        "lib/hallphoto/hall1 (3).jpeg",
        "lib/hallphoto/hall1 (1).jpeg",
        "lib/hallphoto/hall1 (2).jpeg",
        "lib/hallphoto/hall1 (3).jpeg",

      ],
      address: "123 شارع السماء، المدينة",
      stars: 5,
      rating: 4.5,
      description: "فندق فاخر في قلب المدينة",
      price: 250,id: 9,
      isSaved: false,
    ),
    // Add more Hotel instances with descriptions and prices
  ];

  return hotels;
}
