import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';
import 'package:badges/badges.dart' as badges;
import 'package:tech_mall/data/dummy_categories.dart'; // dummyCategories burada olmalı
import 'package:tech_mall/data/dummy_products.dart'; // dummyProducts burada olmalı
import 'package:tech_mall/models/category_model.dart'; // Category modeli
import 'package:tech_mall/models/product_model.dart'; // Product modeli
import 'package:carousel_slider/carousel_slider.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import 'package:flutter_product_card/flutter_product_card.dart';


import '../support/support_view.dart';
import '../favorites/favorites_view.dart';
import '../cart/cart_view.dart';
import '../profile/profile_view.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _selectedCategoryId = '1'; // 'Tümü' varsayılan

  int selected = 0;
  PageController controller = PageController();

// Ürün filtresi
  List<ProductModel> get filteredProducts {
    if (_selectedCategoryId == '1') return dummyProducts;
    return dummyProducts
        .where((product) => product.categoryId == _selectedCategoryId)
        .toList();
  }

// Kategori seçimi
  void _selectCategory(String categoryId) {
    setState(() {
      _selectedCategoryId = categoryId;
    });
  }


   @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            selected = index;
          });
        },
        children: [
          // 0 - Ana Sayfa (mevcut SuperScaffold'lu yapı)
          homeScreen(),

          // 1 - Destek
          // SupportView(),

          // 2 - Favoriler
          //FavoritesView(),

          // 3 - Sepet
          //CartView(),

          // 4 - Profil
          ProfileView(),
        ],
      ),

      bottomNavigationBar: StylishBottomBar(
        backgroundColor: Colors.grey[300],
        elevation: 8.0,
        borderRadius: BorderRadius.circular(5),
        notchStyle: NotchStyle.themeDefault,

        option: AnimatedBarOptions(
          iconSize: 30,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.animated,
          opacity: 0.8,
          inkEffect: true,
          inkColor: Colors.amber,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(Icons.home_outlined),
            title: const Text('Ana Sayfa', style: TextStyle(fontSize: 10),),
            backgroundColor: Colors.purple,
            // showBadge: true,
            selectedIcon: const Icon(Icons.home),
            selectedColor:  Colors.pink,
            unSelectedColor : Colors.grey,
          ),
          BottomBarItem(
            icon: const Icon(Icons.support_agent),
            title: const Text('Destek', style: TextStyle(fontSize: 10),),
            backgroundColor: Colors.purple,
            selectedIcon: const Icon(Icons.support_agent_outlined),
          ),
          BottomBarItem(
            icon: const Icon(Icons.favorite_outline_rounded),
            title: const Text('Favorilerim', style: TextStyle(fontSize: 10),), 
            backgroundColor: Colors.purple,
            selectedIcon: const Icon(Icons.favorite),
          ),
          BottomBarItem(
            icon: const Icon(Icons.shopping_basket_outlined),
            title: const Text('Sepetim', style: TextStyle(fontSize: 10),),
            backgroundColor: Colors.purple,
            selectedIcon: const Icon(Icons.shopping_basket),
          ),
          BottomBarItem(
            icon: const Icon(Icons.account_box_outlined),
            title: const Text('Hesabım', style: TextStyle(fontSize: 10),),
            backgroundColor: Colors.purple,
            selectedIcon: const Icon(Icons.account_box),
          ),
        ],
        fabLocation: StylishBarFabLocation.center,
        hasNotch: true,
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
            controller.jumpToPage(index);
          });
        },
      ),
    );
  }

// Mevcut SuperScaffold'u home ekranı olarak paketle
  Widget homeScreen() {
    return SuperScaffold(
      appBar: appbarSearch(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          categoryButton(),
          const SizedBox(height: 5),
          carousel(),
          const SizedBox(height: 0),
          cardProducts(),
        ],
      ),
    );
  }

  CarouselSlider carousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
      ),
      items:
          [
            'https://i.ytimg.com/vi/yt3hzn0xrls/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLAGfviqC6WHXGMqX2TdtR0SFeYbzw',
            'https://i.ytimg.com/vi/x1hx2eA9WTs/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLDhiiU9EAlx4YCfQQj85l-JBz4tSQ',
            'https://i.ytimg.com/vi/a8hunzlbOUw/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLDpZ7atlu47H9ZCMuozrSvYBb9kVA',
          ].map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
    );
  }

  Widget cardProducts() {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        padding: const EdgeInsets.only(top: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,           // Ekranda 2 kart yanyana
          childAspectRatio: 0.65,      // Kart oranı, yüksekliği ayarlamak için
          crossAxisSpacing: 2,        // Yatay boşluk
          mainAxisSpacing: 2,         // Dikey boşluk

        ),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          final product = filteredProducts[index];
          return ProductCard(
            
            id: product.id,
            imageUrl: product.imageUrl,
            categoryName: product.categoryName,
            productName: product.productName,
            price: product.price,
            currency: product.currency,
            onTap: () {},
            onFavoritePressed: () {},
            shortDescription: product.shortDescription,
            rating: 4.2,
            discountPercentage: product.discountPercentage,
            isAvailable: true,
            cardColor: Colors.white,
            textColor: Colors.black,
            
          
            borderRadius: 12.0,
          );
        },
      ),
    ),
  );
}


  SizedBox categoryButton() {
    return SizedBox(
      height: 30,
      
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dummyCategories.length,
        itemBuilder: (context, index) {
          final category = dummyCategories[index];
          final isSelected = _selectedCategoryId == category.id;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected
                    ? Colors.orange
                    : Colors.grey.shade300,
                foregroundColor: Colors.black,
              ),
              onPressed: () => _selectCategory(category.id),
              child: Text(category.name),
            ),
          );
        },
      ),
    );
  }

  SuperAppBar appbarSearch() {
    return SuperAppBar(
      height: 0,

      title: const Text("Tech Mall"),

      largeTitle: SuperLargeTitle(
        enabled: true,
        largeTitle: "Tech Mall",

        textStyle: TextStyle(
          color: Colors.black45,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),

        actions: [
          badges.Badge(
            badgeContent: Text(
              '3',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            badgeStyle: badges.BadgeStyle(badgeColor: Colors.red),
            position: badges.BadgePosition.topEnd(top: -4, end: -4),
            child: IconButton(
              icon: Icon(Icons.mail_outline, color: Colors.black45, size: 25),
              onPressed: () {},
            ),
          ),
          badges.Badge(
            badgeContent: Text(
              '7',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            badgeStyle: badges.BadgeStyle(badgeColor: Colors.red),
            position: badges.BadgePosition.topEnd(top: -4, end: -4),
            child: IconButton(
              icon: Icon(
                Icons.notifications_active_outlined,
                color: Colors.black45,
                size: 25,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      searchBar: SuperSearchBar(
        cancelTextStyle: const TextStyle(color: Colors.grey),

        enabled: true,
        resultBehavior: SearchBarResultBehavior.visibleOnInput,
        onChanged: (query) {
          print("Arama değişti: $query");
        },
        onSubmitted: (query) {
          print("Arama yapıldı: $query");
        },
        placeholderText: "Ürün, kategori ara...",
      ),
    );
  }
}
