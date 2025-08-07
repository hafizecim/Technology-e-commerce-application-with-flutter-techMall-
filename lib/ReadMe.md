# E-Ticaret Flutter Uygulaması

Bu proje, Flutter kullanılarak geliştirilen bir e-ticaret uygulamasıdır. 
Uygulama, teknolojik ürünlerin satışını yapmak amacıyla tasarlanmıştır.

## 📂 Proje Klasör Yapısı

'''
/lib
├── main.dart # Uygulamanın giriş noktası
├── core # Uygulama genelinde kullanılacak temel yapılar
├── data # Dummy / örnek veri
├── models # Tüm veri modelleri
├── services # API veya veri işlemleri için servis sınıfları
├── views # Feature bazlı ekranlar (Home, Login, Cart, Profile vb.)
└── widgets # Proje özel widget ve componentler

'''

### **Klasör Açıklamaları**

#### `core/`
- Proje genelinde tekrar kullanılabilecek yapılar burada yer alır.
- Örnekler: BaseView, BaseViewModel, componentler (button, card), sabitler (colors, constants), extensions ve network manager.

#### **base/**
- Tüm sayfa ve view-model’ler için **temel template** sağlar  
- Örnek: `base_view.dart`, `base_view_model.dart`

#### **components/**
- Tek başına çalışabilen **atomic widget’lar**  
- Örnek: `normal_button.dart`, `product_card.dart`

#### **constants/**
- Proje boyunca değişmeyecek sabit değerler  
- Örnek: `application_constants.dart`, `colors.dart`

#### **extensions/**
- Var olan sınıflara **extra fonksiyon** eklemek  
- Örnek: `time_extension.dart`

#### **init/**
- Uygulama açıldığında **başlatma işlemleri**  
- Örnek: `locale_manager.dart`, `state_manager.dart`, `theme_manager.dart`

#### **network/**
- API ve veri iletişimi için **merkezi yönetim**  
- Örnek: `network_manager.dart`

#### `data/`
- Dummy veri veya test verileri burada tutulur.
- Dummy veya test verilerini içerir  
- Örnek dosyalar:  
  - `dummy_products.dart`  
  - `dummy_categories.dart`  
  - `dummy_users.dart`  
- Amaç: UI ve sayfa akışı testlerini API olmadan yapabilmek

#### `models/`
- Tüm veri modelleri (Product, User, Category, Cart, Order) burada tanımlanır.
- JSON parse ve model mapping işlemleri bu katmanda yapılır.
- Tüm veri modelleri ve JSON parse işlemleri  
- Örnek dosyalar:  
  - `product_model.dart`  
  - `user_model.dart`  
  - `category_model.dart`  
  - `cart_model.dart`  
  - `order_model.dart` 

#### `services/`
- API ve veri işlemlerini yönetir, **UI ve veri katmanı arasındaki köprü**  
- Örnek dosyalar:  
  - `auth_service.dart`  
  - `product_service.dart`  
  - `cart_service.dart`  
  - `favorite_service.dart` 

#### `views/`
- Feature bazlı ekranlar ve MVVM view-model’leri  
- Örnek klasörler: 
- Her klasör kendi içinde:  
- `*_view.dart` → UI  
- `*_view_model.dart` → state ve logic 

#### `widgets/`
- Tekrar kullanılabilir **atomic design widget’lar**  
- **Atomlar:** Küçük, tek başına çalışabilir widget’lar (Text, Button)  
- **Moleküller:** Atomların birleşimi (EmailField)  
- **Organizmalar:** Moleküllerin birleşimi (LoginForm)  
- **View:** Organizmalar sayfada birleşir (LoginView)  
- Örnek dosyalar: `email_field.dart`, `search_bar.dart`, `slider_widget.dart`

---

## 🛠️ Kullanılan Paketler (Örnek)

- `flutter_product_card` → Ürün kartlarını göstermek için
- `carousel_slider` → Slider / carousel için
- `comment_tree` → Mesaj ve yorum yapıları için
- `super_cupertino_navigation_bar` → Arama çubuğu
- `animated_text_kit` → Animasyonlu metinler (Favoriler sayfasında kullanılacak)
- `badges` → 
---

## 🚀 Proje Hedefi

- Kullanıcı giriş/çıkış kontrolü
- Ürün listeleme, kategori filtreleme, favori ve sepet yönetimi
- Mesaj ve bildirim sistemi
- Atomic design prensibi ile tekrar kullanılabilir widget’lar
- MVVM mimarisi ile temiz kod yapısı 
- MySQL (phpMyAdmin) + REST API entegrasyonu

---

