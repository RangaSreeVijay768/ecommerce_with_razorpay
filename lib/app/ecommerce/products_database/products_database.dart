import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ProductsDatabase{
  int id;
  String imagePath;
  String name;
  String category;
  double price;
  int ratings;
  String description;

  ProductsDatabase({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.category,
    required this.price,
    required this.ratings,
    required this.description
});


  static final availableProducts = [
    ProductsDatabase(
      id: 1,
      imagePath: 'images/product1.png',
      name: 'Roller Rabbit',
      category: 'Vado Odelle Dress',
      price: 236.00,
      ratings: 350,
      description: 'Get a little lift from these Sam Edelman'
          ' sandals featuring ruched straps and leather lace-up ties,'
          ' while a braided jute sole makes a fresh statement for summer.'
    ),
    ProductsDatabase(
      id: 2,
        imagePath: 'images/product2.png',
        name: 'Endless Rose',
        category: 'Bubble elastic T-shirt',
        price: 500.00,
        ratings: 132,
        description: 'Get a little lift from these Sam Edelman'
            ' sandals featuring ruched straps and leather lace-up ties,'
            ' while a braided jute sole makes a fresh statement for summer.'
    ),
    ProductsDatabase(
      id: 3,
        imagePath: 'images/product3.png',
        name: 'ThreadBear Tees',
        category: 'Vado Odelle Dress',
        price: 198.00,
        ratings: 234,
        description: 'Get a little lift from these Sam Edelman'
            ' sandals featuring ruched straps and leather lace-up ties,'
            ' while a braided jute sole makes a fresh statement for summer.'
    ),
    ProductsDatabase(
      id: 4,
        imagePath: 'images/product4.png',
        name: 'Inkwell Apparel',
        category: 'Vado Odelle Dress',
        price: 543.00,
        ratings: 765,
        description: 'Get a little lift from these Sam Edelman'
            ' sandals featuring ruched straps and leather lace-up ties,'
            ' while a braided jute sole makes a fresh statement for summer.'
    ),
    ProductsDatabase(
      id: 5,
        imagePath: 'images/products1.png',
        name: 'Designs by Tee',
        category: 'Vado Odelle Dress',
        price: 435.00,
        ratings: 127,
        description: 'Get a little lift from these Sam Edelman'
            ' sandals featuring ruched straps and leather lace-up ties,'
            ' while a braided jute sole makes a fresh statement for summer.'
    ),
    ProductsDatabase(
      id: 6,
        imagePath: 'images/products2.png',
        name: 'Cotton Cartel',
        category: 'Vado Odelle Dress',
        price: 287.00,
        ratings: 65,
        description: 'Get a little lift from these Sam Edelman'
            ' sandals featuring ruched straps and leather lace-up ties,'
            ' while a braided jute sole makes a fresh statement for summer.'
    ),
    ProductsDatabase(
      id: 7,
        imagePath: 'images/products3.png',
        name: 'T-Shirt Tycoon',
        category: 'Vado Odelle Dress',
        price: 298.00,
        ratings: 86,
        description: 'Get a little lift from these Sam Edelman'
            ' sandals featuring ruched straps and leather lace-up ties,'
            ' while a braided jute sole makes a fresh statement for summer.'
    ),
    ProductsDatabase(
      id: 8,
        imagePath: 'images/products4.png',
        name: 'Threaded Thoughts',
        category: 'Vado Odelle Dress',
        price: 435.00,
        ratings: 234,
        description: 'Get a little lift from these Sam Edelman'
            ' sandals featuring ruched straps and leather lace-up ties,'
            ' while a braided jute sole makes a fresh statement for summer.'
    ),
    ProductsDatabase(
      id: 9,
        imagePath: 'images/products5.png',
        name: 'Graphic Attire',
        category: 'Vado Odelle Dress',
        price: 768.00,
        ratings: 165,
        description: 'Get a little lift from these Sam Edelman'
            ' sandals featuring ruched straps and leather lace-up ties,'
            ' while a braided jute sole makes a fresh statement for summer.'
    ),
    ProductsDatabase(
      id: 10,
        imagePath: 'images/products6.png',
        name: 'Inked Apparel Co',
        category: 'Vado Odelle Dress',
        price: 877.00,
        ratings: 382,
        description: 'Get a little lift from these Sam Edelman'
            ' sandals featuring ruched straps and leather lace-up ties,'
            ' while a braided jute sole makes a fresh statement for summer.'
    ),
  ];


  static List<ProductsDatabase> cartItems = [];
  static Future<void> addToCart(ProductsDatabase product) async {
    cartItems.clear();
    cartItems.add(product);
    await saveCartItems();
  }
  static Future<void> removeFromCart(ProductsDatabase product) async {
    cartItems.remove(product);
    await saveCartItems();
  }
  static Future<void> clearCart() async {
    cartItems.clear();
    await saveCartItems();
  }
  static Future<void> loadCartItems() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? cartItemsString = prefs.getString('cartItems');
      if (cartItemsString != null) {
        List<dynamic> cartItemsJson = json.decode(cartItemsString);
        cartItems = cartItemsJson.map((item) => ProductsDatabase.fromJson(item)).toList();
      }
    } catch (e) {
      print('Error loading cart items: $e');
      cartItems = [];
    }
  }
  static Future<void> saveCartItems() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<Map<String, dynamic>> cartItemsJson = cartItems.map((item) => item.toJson()).toList();
      prefs.setString('cartItems', json.encode(cartItemsJson));
    } catch (e) {
      print('Error saving cart items: $e');
    }
  }




  static List<ProductsDatabase> likedItems = [];

  static Future<void> likeProduct(ProductsDatabase product) async {
    likedItems.add(product);
    await saveLikedProducts();
  }

  static Future<void> removeLikedProduct(ProductsDatabase product) async {
    likedItems.remove(product);
    await saveLikedProducts();
  }

  static Future<void> loadLikedProducts() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? likeItemsString = prefs.getString('likedItems');
      if (likeItemsString != null) {
        List<dynamic> likeItemsJson = json.decode(likeItemsString); // Change to List<dynamic>
        likedItems = likeItemsJson.map((item) => ProductsDatabase.fromJson(item)).toList();
      }
    } catch (e) {
      print('Error loading liked items: $e');
      likedItems = [];
    }
  }

  static Future<void> saveLikedProducts() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<Map<String, dynamic>> likeItemsJson = likedItems.map((item) => item.toJson()).toList();
      prefs.setString('likedItems', json.encode(likeItemsJson));
    } catch (e) {
      print('Error saving liked items: $e');
    }
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'imagePath': imagePath,
    'name': name,
    'category': category,
    'price': price,
    'ratings': ratings,
    'description': description,
  };

  factory ProductsDatabase.fromJson(Map<String, dynamic> json) {
    return ProductsDatabase(
      id: json['id'],
      imagePath: json['imagePath'],
      name: json['name'],
      category: json['category'],
      price: json['price'],
      ratings: json['ratings'],
      description: json['description'],
    );
  }


  // static final List<Map<String, dynamic>> products = [
  //   {
  //     'imagePath': 'images/product1.png',
  //     'name': 'Roller Rabbit',
  //     'category': 'Vado Odelle Dress',
  //     'price': '\$198.00',
  //     'description': 'Get a little lift from these Sam Edelman'
  //         ' sandals featuring ruched straps and leather lace-up ties,'
  //         ' while a braided jute sole makes a fresh statement for summer.'
  //   },
  //   {
  //     'imagePath': 'images/product2.png',
  //     'name': 'Roller Rabbit',
  //     'category': 'Vado Odelle Dress',
  //     'price': '\$198.00',
  //     'description': 'Get a little lift from these Sam Edelman'
  //         ' sandals featuring ruched straps and leather lace-up ties,'
  //         ' while a braided jute sole makes a fresh statement for summer.'
  //   },
  //   {
  //     'imagePath': 'images/product3.png',
  //     'name': 'Roller Rabbit',
  //     'category': 'Vado Odelle Dress',
  //     'price': '\$198.00',
  //     'description': 'Get a little lift from these Sam Edelman'
  //         ' sandals featuring ruched straps and leather lace-up ties,'
  //         ' while a braided jute sole makes a fresh statement for summer.'
  //   },
  //   {
  //     'imagePath': 'images/product4.png',
  //     'name': 'Roller Rabbit',
  //     'category': 'Vado Odelle Dress',
  //     'price': '\$198.00',
  //     'description': 'Get a little lift from these Sam Edelman'
  //         ' sandals featuring ruched straps and leather lace-up ties,'
  //         ' while a braided jute sole makes a fresh statement for summer.'
  //   },
  //   {
  //     'imagePath': 'images/handbag.png',
  //     'name': 'Roller Rabbit',
  //     'category': 'Vado Odelle Dress',
  //     'price': '\$198.00',
  //     'description': 'Get a little lift from these Sam Edelman'
  //         ' sandals featuring ruched straps and leather lace-up ties,'
  //         ' while a braided jute sole makes a fresh statement for summer.'
  //   },
  //   {
  //     'imagePath': 'images/handbag.png',
  //     'name': 'Roller Rabbit',
  //     'category': 'Vado Odelle Dress',
  //     'price': '\$198.00',
  //     'description': 'Get a little lift from these Sam Edelman'
  //         ' sandals featuring ruched straps and leather lace-up ties,'
  //         ' while a braided jute sole makes a fresh statement for summer.'
  //   },
  //   {
  //     'imagePath': 'images/handbag.png',
  //     'name': 'Roller Rabbit',
  //     'category': 'Vado Odelle Dress',
  //     'price': '\$198.00',
  //     'description': 'Get a little lift from these Sam Edelman'
  //         ' sandals featuring ruched straps and leather lace-up ties,'
  //         ' while a braided jute sole makes a fresh statement for summer.'
  //   },
  //   {
  //     'imagePath': 'images/handbag.png',
  //     'name': 'Roller Rabbit',
  //     'category': 'Vado Odelle Dress',
  //     'price': '\$198.00',
  //     'description': 'Get a little lift from these Sam Edelman'
  //         ' sandals featuring ruched straps and leather lace-up ties,'
  //         ' while a braided jute sole makes a fresh statement for summer.'
  //   },
  //   {
  //     'imagePath': 'images/handbag.png',
  //     'name': 'Roller Rabbit',
  //     'category': 'Vado Odelle Dress',
  //     'price': '\$198.00',
  //     'description': 'Get a little lift from these Sam Edelman'
  //         ' sandals featuring ruched straps and leather lace-up ties,'
  //         ' while a braided jute sole makes a fresh statement for summer.'
  //   },
  //   {
  //     'imagePath': 'images/handbag.png',
  //     'name': 'Roller Rabbit',
  //     'category': 'Vado Odelle Dress',
  //     'price': '\$198.00',
  //     'description': 'Get a little lift from these Sam Edelman'
  //         ' sandals featuring ruched straps and leather lace-up ties,'
  //         ' while a braided jute sole makes a fresh statement for summer.'
  //   },
  //   {
  //     'imagePath': 'images/handbag.png',
  //     'name': 'Roller Rabbit',
  //     'category': 'Vado Odelle Dress',
  //     'price': '\$198.00',
  //     'description': 'Get a little lift from these Sam Edelman'
  //         ' sandals featuring ruched straps and leather lace-up ties,'
  //         ' while a braided jute sole makes a fresh statement for summer.'
  //   },
  //   {
  //     'imagePath': 'images/handbag.png',
  //     'name': 'Roller Rabbit',
  //     'category': 'Vado Odelle Dress',
  //     'price': '\$198.00',
  //     'description': 'Get a little lift from these Sam Edelman'
  //         ' sandals featuring ruched straps and leather lace-up ties,'
  //         ' while a braided jute sole makes a fresh statement for summer.'
  //   },
  //   {
  //     'imagePath': 'images/handbag.png',
  //     'name': 'Roller Rabbit',
  //     'category': 'Vado Odelle Dress',
  //     'price': '\$198.00',
  //     'description': 'Get a little lift from these Sam Edelman'
  //         ' sandals featuring ruched straps and leather lace-up ties,'
  //         ' while a braided jute sole makes a fresh statement for summer.'
  //   },
  //   {
  //     'imagePath': 'images/handbag.png',
  //     'name': 'Roller Rabbit',
  //     'category': 'Vado Odelle Dress',
  //     'price': '\$198.00',
  //     'description': 'Get a little lift from these Sam Edelman'
  //         ' sandals featuring ruched straps and leather lace-up ties,'
  //         ' while a braided jute sole makes a fresh statement for summer.'
  //   },
  //   {
  //     'imagePath': 'images/handbag.png',
  //     'name': 'Roller Rabbit',
  //     'category': 'Vado Odelle Dress',
  //     'price': '\$198.00',
  //     'description': 'Get a little lift from these Sam Edelman'
  //         ' sandals featuring ruched straps and leather lace-up ties,'
  //         ' while a braided jute sole makes a fresh statement for summer.'
  //   },
  // ];
}
