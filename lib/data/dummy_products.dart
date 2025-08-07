import '../models/product_model.dart';

final List<ProductModel> dummyProducts = [
  ProductModel(
    id: '2',
    categoryId : '2',
    imageUrl: 'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_144941045/fee_786_587_png',
    categoryName: 'Bilgisayar',
    productName: 'Laptop',
    price: 15000.0,
    currency: '\₺',
    shortDescription: 'Yüksek performanslı bilgisayar',
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
    imageUrl: 'https://cdn.dsmcdn.com/mnresize/420/620/ty1631/prod/QC/20250125/09/ed5bedf1-1b23-3716-804b-774342833ef5/1_org.jpg',
    categoryName: 'Telefon',
    productName: 'Telefon',
    price: 7000.0,
    currency: '\₺',
    shortDescription: 'Kolay taşınabilir tablet',
    discountPercentage: 35.0,
    
    
  ),
];