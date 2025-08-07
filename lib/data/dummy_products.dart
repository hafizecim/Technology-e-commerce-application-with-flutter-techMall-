import '../models/product_model.dart';

final List<ProductModel> dummyProducts = [
  ProductModel(
    id: '2',
    categoryId : '2',
    imageUrl: 'https://www.casper.com.tr/uploads/2025/01/15_op.webp',
    categoryName: 'Bilgisayar',
    productName: 'Laptop',
    price: 15000.0,
    currency: '\₺',
    shortDescription: 'Yüksek performanslı dizüstü bilgisayar',
    discountPercentage: 35.0,
    
  ),
  ProductModel( 
    id: '3',
    categoryId : '3',
    imageUrl: 'https://images.samsung.com/is/image/samsung/assets/tr/tablets/galaxy-tab-s10/buy/S10_Ultra_Color_Selection_Moonstone_Gray_MO_720x480.png?imbypass=true',
    categoryName: 'Tablet',
    productName: 'Tablet',
    price: 7000.0,
    currency: '\₺',
    shortDescription: 'Kolay taşınabilir tablet',
    discountPercentage: 35.0,
    
    
  ),

  ProductModel( 
    categoryId : '4',
    id: '4',
    imageUrl: 'https://bireysel.turktelekom.com.tr/tt-cihazlar/PublishingImages/akilli-telefon/apple/iphone13-blue.webp',
    categoryName: 'Telefon',
    productName: 'Telefon',
    price: 7000.0,
    currency: '\₺',
    shortDescription: 'Kolay taşınabilir tablet',
    discountPercentage: 35.0,
    
    
  ),
];