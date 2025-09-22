import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/services/product_service.dart';
import 'package:ecommerce_app/views/product_detail/product_detail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String routeName = "/home";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _productService = ProductService();
  List<Product> productList = [];

  @override
  void initState() {
    // TODO: implement initState
    fetchProductList();
    super.initState();
  }

  Future<void> fetchProductList() async {
    productList = await _productService.fetchProductList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Promo Banner
            Container(
              margin: const EdgeInsets.all(12),
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage("assets/banner.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Categories
            _buildSectionHeader("Shop By Categories"),
            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategory("Vegetables", Icons.local_florist),
                  _buildCategory("Fast Food", Icons.fastfood),
                  _buildCategory("Foods", Icons.restaurant),
                  _buildCategory("Drinks", Icons.local_drink),
                  _buildCategory("Fruits", Icons.local_grocery_store),
                ],
              ),
            ),

            // Special Offers
            _buildSectionHeader("Special Offers"),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return _buildProduct(context, productList[index]);
                },
              ),
            ),

            // New Products
            _buildSectionHeader("New Products"),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return _buildProduct(context, productList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Section Header Widget
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text("See All", style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }

  // Category Item Widget
  Widget _buildCategory(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey.shade200,
            child: Icon(icon, size: 28, color: Colors.red),
          ),
          SizedBox(height: 6),
          Text(title, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  // Product Item Widget
  Widget _buildProduct(BuildContext context, Product product) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailPage().routeName,
          arguments: product, // pass whole product object
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(left: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image (from network)
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.network(
                product.image,
                height: 100,
                width: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 80),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "\$${product.price.toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.green, fontSize: 14),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, size: 14, color: Colors.amber),
                          Text(
                            product.rating.rate.toString(),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.favorite_border,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const Icon(
                        Icons.shopping_cart_outlined,
                        size: 16,
                        color: Colors.red,
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
