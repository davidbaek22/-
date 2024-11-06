void main() {
  // 쇼핑몰 객체 생성 및 상품 추가
  ShoppingMall mall = ShoppingMall();
  mall.products.add(Product('Shirt', 20000));
  mall.products.add(Product('Pants', 30000));
  mall.products.add(Product('Shoes', 50000));

  // 상품 목록 출력
  mall.showProducts();

  // 장바구니에 상품 추가 및 총 가격 출력
  mall.addToCart('Shirt');
  mall.addToCart('Shoes');
  mall.showTotal();
}

class ShoppingMall {
  List<Product> products = []; // 판매하는 상품 목록
  int cartTotal = 0; // 장바구니의 총 가격

  // 상품 목록을 출력하는 메서드
  void showProducts() {
    print('Available Products:');
    for (var product in products) {
      print('${product.name} - ${product.price}원');
    }
  }

  // 상품을 장바구니에 담는 메서드
  void addToCart(String productName) {
    for (var product in products) {
      if (product.name == productName) {
        cartTotal += product.price;
        print('${product.name}가 장바구니에 추가되었습니다.');
        return;
      }
    }
    print('$productName 상품을 찾을 수 없습니다.');
  }

  // 장바구니의 총 가격을 출력하는 메서드
  void showTotal() {
    print('장바구니 총 가격: ${cartTotal}원');
  }
}

class Product {
  String name; // 상품 이름
  int price;   // 상품 1개당 가격

  Product(this.name, this.price);
}
