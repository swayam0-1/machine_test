class HomeModel {
  final int status;
  final HomeData data;

  HomeModel({required this.status, required this.data});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      status: json['status'],
      data: HomeData.fromJson(json['data']),
    );
  }
}

class HomeData {
  final List<Banner> bannerOne;
  final List<Category> category;
  final List<Product> products;
  final List<Banner> bannerTwo;
  final List<NewArrival> newArrivals;
  final List<Banner> bannerThree;
  final List<CategoryListing> categoriesListing;
  final List<Brand> topBrands;
  final List<BrandListing> brandListing;
  final List<TopSellingProduct> topSellingProducts;
  final List<FeaturedLaptop> featuredLaptop;
  final List<UpcomingLaptop> upcomingLaptops;
  final List<UnboxedDeal> unboxedDeals;
  final List<MyBrowsingHistory> myBrowsingHistory;

  HomeData({
    required this.bannerOne,
    required this.category,
    required this.products,
    required this.bannerTwo,
    required this.newArrivals,
    required this.bannerThree,
    required this.categoriesListing,
    required this.topBrands,
    required this.brandListing,
    required this.topSellingProducts,
    required this.featuredLaptop,
    required this.upcomingLaptops,
    required this.unboxedDeals,
    required this.myBrowsingHistory,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
      bannerOne: (json['banner_one'] as List).map((i) => Banner.fromJson(i)).toList(),
      category: (json['category'] as List).map((i) => Category.fromJson(i)).toList(),
      products: (json['products'] as List).map((i) => Product.fromJson(i)).toList(),
      bannerTwo: (json['banner_two'] as List).map((i) => Banner.fromJson(i)).toList(),
      newArrivals: (json['new_arrivals'] as List).map((i) => NewArrival.fromJson(i)).toList(),
      bannerThree: (json['banner_three'] as List).map((i) => Banner.fromJson(i)).toList(),
      categoriesListing: (json['categories_listing'] as List).map((i) => CategoryListing.fromJson(i)).toList(),
      topBrands: (json['top_brands'] as List).map((i) => Brand.fromJson(i)).toList(),
      brandListing: (json['brand_listing'] as List).map((i) => BrandListing.fromJson(i)).toList(),
      topSellingProducts: (json['top_selling_products'] as List).map((i) => TopSellingProduct.fromJson(i)).toList(),
      featuredLaptop: (json['featured_laptop'] as List).map((i) => FeaturedLaptop.fromJson(i)).toList(),
      upcomingLaptops: (json['upcoming_laptops'] as List).map((i) => UpcomingLaptop.fromJson(i)).toList(),
      unboxedDeals: (json['unboxed_deals'] as List).map((i) => UnboxedDeal.fromJson(i)).toList(),
      myBrowsingHistory: (json['my_browsing_history'] as List).map((i) => MyBrowsingHistory.fromJson(i)).toList(),
    );
  }
}

class Banner {
  final String banner;

  Banner({required this.banner});

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      banner: json['banner'],
    );
  }
}

class Category {
  final String label;
  final String icon;

  Category({required this.label, required this.icon});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      label: json['label'],
      icon: json['icon'],
    );
  }
}

class Product {
  final String icon;
  final String offer;
  final String label;
  final String subLabel;

  Product({required this.icon, required this.offer, required this.label, required this.subLabel});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      icon: json['icon'],
      offer: json['offer'],
      label: json['label'],
      subLabel: json['SubLabel'],
    );
  }
}

class NewArrival {
  final String icon;
  final String offer;
  final String brandIcon;
  final String label;

  NewArrival({required this.icon, required this.offer, required this.brandIcon, required this.label});

  factory NewArrival.fromJson(Map<String, dynamic> json) {
    return NewArrival(
      icon: json['icon'],
      offer: json['offer'],
      brandIcon: json['brandIcon'],
      label: json['label'],
    );
  }
}

class CategoryListing {
  final String icon;
  final String offer;
  final String label;

  CategoryListing({required this.icon, required this.offer, required this.label});

  factory CategoryListing.fromJson(Map<String, dynamic> json) {
    return CategoryListing(
      icon: json['icon'],
      offer: json['offer'],
      label: json['label'],
    );
  }
}

class Brand {
  final String icon;

  Brand({required this.icon});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      icon: json['icon'],
    );
  }
}

class BrandListing {
  final String icon;
  final String offer;
  final String brandIcon;
  final String label;

  BrandListing({required this.icon, required this.offer, required this.brandIcon, required this.label});

  factory BrandListing.fromJson(Map<String, dynamic> json) {
    return BrandListing(
      icon: json['icon'],
      offer: json['offer'],
      brandIcon: json['brandIcon'],
      label: json['label'],
    );
  }
}

class TopSellingProduct {
  final String icon;
  final String label;

  TopSellingProduct({required this.icon, required this.label});

  factory TopSellingProduct.fromJson(Map<String, dynamic> json) {
    return TopSellingProduct(
      icon: json['icon'],
      label: json['label'],
    );
  }
}

class FeaturedLaptop {
  final String icon;
  final String brandIcon;
  final String label;
  final String price;

  FeaturedLaptop({required this.icon, required this.brandIcon, required this.label, required this.price});

  factory FeaturedLaptop.fromJson(Map<String, dynamic> json) {
    return FeaturedLaptop(
      icon: json['icon'],
      brandIcon: json['brandIcon'],
      label: json['label'],
      price: json['price'],
    );
  }
}

class UpcomingLaptop {
  final String icon;

  UpcomingLaptop({required this.icon});

  factory UpcomingLaptop.fromJson(Map<String, dynamic> json) {
    return UpcomingLaptop(
      icon: json['icon'],
    );
  }
}

class UnboxedDeal {
  final String icon;
  final String offer;
  final String label;

  UnboxedDeal({required this.icon, required this.offer, required this.label});

  factory UnboxedDeal.fromJson(Map<String, dynamic> json) {
    return UnboxedDeal(
      icon: json['icon'],
      offer: json['offer'],
      label: json['label'],
    );
  }
}

class MyBrowsingHistory {
  final String icon;
  final String offer;
  final String brandIcon;
  final String label;

  MyBrowsingHistory({required this.icon, required this.offer, required this.brandIcon, required this.label});

  factory MyBrowsingHistory.fromJson(Map<String, dynamic> json) {
    return MyBrowsingHistory(
      icon: json['icon'],
      offer: json['offer'],
      brandIcon: json['brandIcon'],
      label: json['label'],
    );
  }
}
