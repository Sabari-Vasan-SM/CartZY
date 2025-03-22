import 'package:flutter/material.dart';

void main() {
  runApp(const CartZYApp());
}

class CartZYApp extends StatelessWidget {
  const CartZYApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CartZY',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

// Dummy Product List with Categories
final List<Map<String, dynamic>> products = [
  {
    "name": "Acer Laptop",
    "price": "₹50,999",
    "desc": "Powerful laptop with 16GB RAM",
    "imageUrl": "https://m.media-amazon.com/images/I/61fDHkQ6MqL._AC_UY327_FMwebp_QL65_.jpg",
    "category": "Electronics",
    
  },
    {
    "name": "MSI Thin 15",
    "price": "₹49,999",
    "desc": "MSI Thin 15 Intel Core i5 12th Gen 13420H - (8 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 2050/144 Hz) Thin 15 B13UCX-1808IN Gaming Laptop  (15.6 Inch, Cosmos Grey, 1.86 Kg)",
    "imageUrl": "https://rukminim2.flixcart.com/image/312/312/xif0q/computer/t/r/u/-original-imah3acvkdhmxkzq.jpeg?q=70",
    "category": "Electronics",
  },
  {
    "name": "CMF 1",
    "price": "₹16,999",
    "desc": "Feature-rich smartphone with 5G",
    "imageUrl": "https://m.media-amazon.com/images/I/71wj5W+olHL._AC_UY327_FMwebp_QL65_.jpg",
    "category": "Electronics",
  },
  {
    "name": "Nothing Buds",
    "price": "₹5,999",
    "desc": "Noise-cancelling wireless headphones",
    "imageUrl": "https://m.media-amazon.com/images/I/41Fkv2h7i1L._AC_UY327_FMwebp_QL65_.jpg",
    "category": "Accessories",
  },
    {
    "name": "Apple iPhone 16",
    "price": "₹74,999",
    "desc": "Apple iPhone 16 (Black, 128 GB)",
    "imageUrl": "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/8/w/5/-original-imah4jyfwr3bfjbg.jpeg?q=70",
    "category": "Electronics",
  },
  {
    "name": "SAMSUNG Galaxy S25 Ultra",
    "price": "₹1,45,999",
    "desc": "SAMSUNG Galaxy S25 Ultra 5G (Titanium Silverblue, 512 GB)  (12 GB RAM)",
    "imageUrl": "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/1/x/3/-original-imah8pdnxdwzazyy.jpeg?q=70",
    "category": "Electronics",
  },
  {
    "name": "POCO X7 Pro 5G",
    "price": "₹22,999",
    "desc": "POCO X7 Pro 5G (Yellow, 256 GB)  (12 GB RAM)",
    "imageUrl": "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/o/q/y/-original-imah8affczqnzp6s.jpeg?q=70",
    "category": "Electronics",
  },
  {
    "name": "OnePlus Nord Buds",
    "price": "₹1,999",
    "desc": "OnePlus Nord Buds 2r in Ear Earbuds with Dual Mic & AI Crystal Clear Call Bluetooth  (Deep Grey, True Wireless)",
    "imageUrl": "https://rukminim2.flixcart.com/image/612/612/xif0q/headphone/w/t/q/-original-imagr4t8zuq2wzhe.jpeg?q=70",
    "category": "Accessories",
  },
 {
    "name": "boAt Airdopes 131 Pro",
    "price": "₹1,399",
    "desc": "boAt Airdopes 131 Pro Buds w/ In Ear Detection, 4 Mics ENx Tech & 40 HRS Playback Bluetooth  (Active Black, True Wireless)",
    "imageUrl": "https://rukminim2.flixcart.com/image/612/612/xif0q/headphone/k/0/b/-original-imah4vcukjkyfgyq.jpeg?q=70",
    "category": "Accessories",
  },
 {
    "name": "Noise Crew",
    "price": "₹1,299",
    "desc": "Noise Crew 1.38 Round Display with Bluetooth Calling, Metallic finish, IP68 Rating Smartwatch  (Grey Strap, Regular)",
    "imageUrl": "https://rukminim2.flixcart.com/image/612/612/xif0q/smartwatch/w/b/q/-original-imah6s6phr7pjzpy.jpeg?q=70",
    "category": "Accessories",
  },
];

// Dummy User Data
final Map<String, String> dummyUser = {
  "email": "user@gmail.com",
  "password": "user",
};

// Login Page
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (emailController.text == dummyUser["email"] &&
                    passwordController.text == dummyUser["password"]) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileSetupPage(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid email or password'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

// Profile Setup Page
class ProfileSetupPage extends StatefulWidget {
  const ProfileSetupPage({super.key});

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Setup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _pincodeController,
                decoration: const InputDecoration(labelText: 'Pincode'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your pincode';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save profile and navigate to HomePage
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          userProfile: {
                            "name": _nameController.text,
                            "phone": _phoneController.text,
                            "address": _addressController.text,
                            "pincode": _pincodeController.text,
                          },
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Save Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Home Page
class HomePage extends StatefulWidget {
  final Map<String, String> userProfile;

  const HomePage({super.key, required this.userProfile});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> cart = [];
  List<Map<String, dynamic>> orders = [];
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> filteredProducts = [];
  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
    _searchController.addListener(_filterProducts);
  }

  void _filterProducts() {
    setState(() {
      filteredProducts = products
          .where((product) =>
              product["name"]!
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()) &&
              (selectedCategory == "All" ||
                  product["category"] == selectedCategory))
          .toList();
    });
  }

  void addToCart(Map<String, dynamic> product, int quantity) {
    setState(() {
      cart.add({"product": product, "quantity": quantity});
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product["name"]} added to cart'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
      ),
    );
  }

  void placeOrder(List<Map<String, dynamic>> cartItems, double totalPrice) {
    setState(() {
      orders.add({
        "items": cartItems,
        "totalPrice": totalPrice,
        "date": DateTime.now(),
      });
      cart.clear();
    });
  }

  void buyNow(Map<String, dynamic> product, int quantity) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BuyNowPage(
          product: product,
          quantity: quantity,
          placeOrder: placeOrder,
          userProfile: widget.userProfile,
          updateProfile: (updatedProfile) {
            setState(() {
              widget.userProfile.update("name", (value) => updatedProfile["name"]!);
              widget.userProfile.update("phone", (value) => updatedProfile["phone"]!);
              widget.userProfile.update("address", (value) => updatedProfile["address"]!);
              widget.userProfile.update("pincode", (value) => updatedProfile["pincode"]!);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartZY'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartItems: cart),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(
                    userProfile: widget.userProfile,
                    updateProfile: (updatedProfile) {
                      setState(() {
                        widget.userProfile.update("name", (value) => updatedProfile["name"]!);
                        widget.userProfile.update("phone", (value) => updatedProfile["phone"]!);
                        widget.userProfile.update("address", (value) => updatedProfile["address"]!);
                        widget.userProfile.update("pincode", (value) => updatedProfile["pincode"]!);
                      });
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search products...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                "All",
                "Electronics",
                "Accessories",
              ].map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: FilterChip(
                    label: Text(category),
                    selected: selectedCategory == category,
                    onSelected: (value) {
                      setState(() {
                        selectedCategory = category;
                        _filterProducts();
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.75,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: filteredProducts[index],
                  addToCart: addToCart,
                  buyNow: buyNow,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Orders'),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderHistoryPage(orders: orders),
              ),
            );
          }
        },
      ),
    );
  }
}

// Product Card Widget
class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final Function(Map<String, dynamic>, int) addToCart;
  final Function(Map<String, dynamic>, int) buyNow;

  const ProductCard({
    super.key,
    required this.product,
    required this.addToCart,
    required this.buyNow,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsPage(
                product: product,
                addToCart: addToCart,
                buyNow: buyNow,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                child: Image.network(
                  product["imageUrl"]!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product["name"]!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product["price"]!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => addToCart(product, 1),
                          child: const Text("Add to Cart"),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => buyNow(product, 1),
                          child: const Text("Buy Now"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Product Details Page
class ProductDetailsPage extends StatefulWidget {
  final Map<String, dynamic> product;
  final Function(Map<String, dynamic>, int) addToCart;
  final Function(Map<String, dynamic>, int) buyNow;

  const ProductDetailsPage({
    super.key,
    required this.product,
    required this.addToCart,
    required this.buyNow,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product["name"]!)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.product["imageUrl"]!,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.product["name"]!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.product["desc"]!,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              "Price: ${widget.product["price"]!}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text("Quantity: "),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                ),
                Text(quantity.toString()),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                widget.addToCart(widget.product, quantity);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Add to Cart"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                widget.buyNow(widget.product, quantity);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Buy Now"),
            ),
          ],
        ),
      ),
    );
  }
}

// Buy Now Page
class BuyNowPage extends StatefulWidget {
  final Map<String, dynamic> product;
  final int quantity;
  final Function(List<Map<String, dynamic>>, double) placeOrder;
  final Map<String, String> userProfile;
  final Function(Map<String, String>) updateProfile;

  const BuyNowPage({
    super.key,
    required this.product,
    required this.quantity,
    required this.placeOrder,
    required this.userProfile,
    required this.updateProfile,
  });

  @override
  State<BuyNowPage> createState() => _BuyNowPageState();
}

class _BuyNowPageState extends State<BuyNowPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Pre-fill the form with user profile data
    _nameController.text = widget.userProfile["name"]!;
    _phoneController.text = widget.userProfile["phone"]!;
    _addressController.text = widget.userProfile["address"]!;
    _pincodeController.text = widget.userProfile["pincode"]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buy Now")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Product: ${widget.product["name"]}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Price: ${widget.product["price"]}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: "Phone Number"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your phone number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: "Address"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _pincodeController,
                decoration: const InputDecoration(labelText: "Pincode"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your pincode";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Update user profile
                    widget.updateProfile({
                      "name": _nameController.text,
                      "phone": _phoneController.text,
                      "address": _addressController.text,
                      "pincode": _pincodeController.text,
                    });

                    // Place the order
                    widget.placeOrder(
                      [
                        {
                          "product": widget.product,
                          "quantity": widget.quantity,
                        }
                      ],
                      double.parse(widget.product["price"]!.replaceAll(RegExp(r'[^0-9]'), '')),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Order placed successfully!"),
                        duration: Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                      ),
                    );

                    Navigator.popUntil(context, (route) => route.isFirst);
                  }
                },
                child: const Text("Place Order"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Profile Page
class ProfilePage extends StatefulWidget {
  final Map<String, String> userProfile;
  final Function(Map<String, String>) updateProfile;

  const ProfilePage({
    super.key,
    required this.userProfile,
    required this.updateProfile,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Pre-fill the form with user profile data
    _nameController.text = widget.userProfile["name"]!;
    _phoneController.text = widget.userProfile["phone"]!;
    _addressController.text = widget.userProfile["address"]!;
    _pincodeController.text = widget.userProfile["pincode"]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: "Phone Number"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your phone number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: "Address"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _pincodeController,
                decoration: const InputDecoration(labelText: "Pincode"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your pincode";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Update user profile
                    widget.updateProfile({
                      "name": _nameController.text,
                      "phone": _phoneController.text,
                      "address": _addressController.text,
                      "pincode": _pincodeController.text,
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Profile updated successfully!"),
                        duration: Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                      ),
                    );

                    Navigator.pop(context);
                  }
                },
                child: const Text("Save Profile"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Cart Page
class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(int index) {
    setState(() {
      widget.cartItems.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Item removed from cart"),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
      ),
    );
  }

  void removeAllItems() {
    setState(() {
      widget.cartItems.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("All items removed from cart"),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.cartItems.fold(0, (sum, item) =>
        sum +
        double.parse(item["product"]["price"]!.replaceAll(RegExp(r'[^0-9]'), '')) *
            item["quantity"]);
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: widget.cartItems.isEmpty
          ? const Center(child: Text("Your cart is empty"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = widget.cartItems[index];
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Image.network(
                            item["product"]["imageUrl"]!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                          ),
                          title: Text(item["product"]["name"]!),
                          subtitle: Text("${item["product"]["price"]!} x ${item["quantity"]}"),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => removeFromCart(index),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (widget.cartItems.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: removeAllItems,
                          child: const Text("Remove All"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckoutPage(
                                  cartItems: widget.cartItems,
                                  totalPrice: totalPrice,
                                ),
                              ),
                            );
                          },
                          child: const Text("Proceed to Checkout"),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
    );
  }
}

// Checkout Page
class CheckoutPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final double totalPrice;

  const CheckoutPage({super.key, required this.cartItems, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Order Summary", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...cartItems.map((item) => Text("${item["product"]["name"]!} - ${item["product"]["price"]!} x ${item["quantity"]}")),
            const Divider(),
            Text("Total: ₹$totalPrice", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderPage(
                      cartItems: cartItems,
                      totalPrice: totalPrice,
                    ),
                  ),
                );
              },
              child: const Text("Place Order"),
            ),
          ],
        ),
      ),
    );
  }
}

// Order Page
class OrderPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final double totalPrice;

  const OrderPage({super.key, required this.cartItems, required this.totalPrice});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Delivery Address", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: "Phone Number"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your phone number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: "Address"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: "Location"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your location";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _pincodeController,
                decoration: const InputDecoration(labelText: "Pincode"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your pincode";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Order placed successfully!"),
                        duration: Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                      ),
                    );
                    Navigator.popUntil(context, (route) => route.isFirst);
                  }
                },
                child: const Text("Place Order"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Order History Page
class OrderHistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> orders;

  const OrderHistoryPage({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order History")),
      body: orders.isEmpty
          ? const Center(child: Text("No orders found"))
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text("Order #${index + 1}"),
                    subtitle: Text("Total: ₹${order["totalPrice"]}"),
                    trailing: Text(order["date"].toString()),
                  ),
                );
              },
            ),
    );
  }
}