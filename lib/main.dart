import 'package:flutter/material.dart';

void main() {
  runApp(const RetailApp());
}

class RetailApp extends StatelessWidget {
  const RetailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      bottomNavigationBar: const CustomBottomNav(),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: const Icon(Icons.menu, color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.search, color: Colors.black),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 10),

            // ================= CATEGORY (CENTER) =================
            Center(
              child: SizedBox(
                height: 90,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  children: const [
                    CategoryItem(icon: Icons.grid_view, title: "All"),
                    CategoryItem(icon: Icons.checkroom, title: "Clothes"),
                    CategoryItem(icon: Icons.watch, title: "Watch"),
                    CategoryItem(icon: Icons.directions_run, title: "Shoes"),
                    CategoryItem(icon: Icons.shopping_bag, title: "Bag"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            // ================= BANNER (CENTER) =================
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 155,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://images.tokopedia.net/img/KRMmCm/2023/6/28/2f0d16b4-4ae3-42cb-a79d-4da4e367cc76.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.black.withOpacity(0.35),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Summer Collection",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "New 2024 Trends",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text("Shop now"),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ================= PRODUCT GRID =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final images = [
                    "https://down-id.img.susercontent.com/file/904221eea0f1e97a56bc81d46a3c2b69",
                    "https://cardinal.co.id/cdn/shop/files/CAJAR00450J.06A-Green_1-1.jpg?v=1756811857",
                    "https://p16-oec-sg.ibyteimg.com/tos-alisg-i-aphluv4xwc-sg/2677dc4e852d4f71985f1afea6c5b59a~tplv-aphluv4xwc-resize-webp:800:800.webp?dr=15584&t=555f072d&ps=933b5bde&shp=6ce186a1&shcp=e1be8f53&idc=my&from=1826719393",
                    "https://timekingdom.co.id/cdn/shop/files/e534aaa7-0a07-4b26-9dd5-5f5186756698@2x.jpg?v=1714191537",
                  ];
                  final titles = [
                    "Mantel Wanita",
                    "Jaket cowok",
                    "Sepatu Sneaker",
                    "Jam Tangan",
                  ];
                  final prices = ["\$120", "\$95", "\$80", "\$150"];
                  return ProductCard(
                    image: images[index % images.length],
                    title: titles[index],
                    price: prices[index],
                  );
                },
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// ================= CATEGORY ==================
class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, size: 24, color: Colors.orange),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}

// ================= PRODUCT CARD ==================
class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(18)),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14),
                ),
                const SizedBox(height: 5),
                Text(
                  price,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ================= BOTTOM NAV ==================
class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Fav"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}








}
