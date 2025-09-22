import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String routeName = "/product_detail";

  final String name = "Fresh Juice";
  final String price = "\$2.50";
  final String imagePath = "assets/freshjuice.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        actions: [
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: Image.asset(imagePath, height: 220, fit: BoxFit.cover),
            ),
            const SizedBox(height: 12),

            // Product Name
            Text(
              name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),

            // Rating (static placeholder)
            Row(
              children: const [
                Icon(Icons.star, color: Colors.orange, size: 18),
                Icon(Icons.star, color: Colors.orange, size: 18),
                Icon(Icons.star, color: Colors.orange, size: 18),
                Icon(Icons.star_half, color: Colors.orange, size: 18),
                Icon(Icons.star_border, color: Colors.orange, size: 18),
                SizedBox(width: 6),
                Text("(4.6)"),
              ],
            ),
            const SizedBox(height: 10),

            // Price
            Text(
              "\$$price",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 14),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Add To Cart",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Buy Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Description
            const Text(
              "Descriptions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "This is a tasty and refreshing product. "
              "It’s made from natural ingredients and carefully packaged to maintain freshness. "
              "Perfect for your daily needs!",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 20),

            // Related Products (just placeholder here)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Related Products",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text("See All", style: TextStyle(color: Colors.blue)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.asset("assets/banner.png", height: 80),
                      const SizedBox(height: 5),
                      const Text("Sample 1"),
                      const Text("\$2.50"),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.asset("assets/banner.png", height: 80),
                      const SizedBox(height: 5),
                      const Text("Sample 2"),
                      const Text("\$3.00"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
