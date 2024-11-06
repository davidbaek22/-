import 'dart:io';

class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> products;
  int cartTotal = 0;

  ShoppingMall(this.products);

  void showProducts() {
    for (var product in products) {
      print('${product.name} / ${product.price}원');
    }
  }

  void addToCart() {
    print('장바구니에 담을 상품 이름을 입력하세요:');
    String? productName = stdin.readLineSync();

    print('상품 개수를 입력하세요:');
    String? quantityInput = stdin.readLineSync();

    try {
      int quantity = int.parse(quantityInput!);
      var product = products.firstWhere((p) => p.name == productName, orElse: () => Product('', 0));

      if (product.name == '') {
        print('입력값이 올바르지 않아요!');
      } else if (quantity <= 0) {
        print('0개보다 많은 개수의 상품만 담을 수 있어요!');
      } else {
        cartTotal += product.price * quantity;
        print('장바구니에 상품이 담겼어요!');
      }
    } catch (e) {
      print('입력값이 올바르지 않아요!');
    }
  }

  void showTotal() {
    print('장바구니에 ${cartTotal}원 어치를 담으셨네요!');
  }
}

void main() {
  List<Product> initialProducts = [
    Product('셔츠', 45000),
    Product('원피스', 30000),
    Product('반팔티', 35000),
    Product('반바지', 38000),
    Product('양말', 5000),
  ];

  ShoppingMall mall = ShoppingMall(initialProducts);
  bool isRunning = true;

  print('쇼핑몰에 오신 것을 환영합니다!');
  while (isRunning) {
    print('\n원하는 기능의 번호를 입력해 주세요:');
    print('1. 상품 목록 보기');
    print('2. 장바구니에 상품 담기');
    print('3. 장바구니 총 가격 보기');
    print('4. 쇼핑몰 종료');

    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        mall.showProducts();
        break;
      case '2':
        mall.addToCart();
        break;
      case '3':
        mall.showTotal();
        break;
      case '4':
        print('이용해 주셔서 감사합니다 ~ 안녕히 가세요!');
        isRunning = false;
        break;
      default:
        print('지원하지 않는 기능입니다! 다시 시도해 주세요..');
    }
  }
}
