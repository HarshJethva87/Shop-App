import 'package:flutter/material.dart';
import 'package:shop_app/pages/add_to_cart_page.dart';
import 'package:shop_app/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curretPage = 0;

  List<Widget> pages = const [
    ProductList(),
    AddToCartPage(),
  ];

  @override
  void initState() {
    selectedBrandFilter = brandsFilter[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: pages,
        index: curretPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curretPage,
        onTap: (value) {
          setState(() {
            curretPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
        ],
      ),
    );
  }
}
