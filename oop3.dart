abstract class PaymentProcessor {
  bool pay(double amount);
  String getReceipt();
}

// 2. การสร้างคลาสจากอินเทอร์เฟซ (มีให้เป็นตัวอย่าง)
// การใช้ 'implements' หมายความว่า Dart จะบังคับให้เราเขียน "ทุกเมธอด" ที่อยู่ในอินเทอร์เฟซ
class PromptPayProcessor implements PaymentProcessor {
  String phoneNumber;

  PromptPayProcessor(this.phoneNumber);
  @override
  bool pay(double amount) {
    print("📱 กำลังสร้างคิวอาร์โค้ดพร้อมเพย์สำหรับ $phoneNumber...");
    print("💸 ได้รับเงินจำนวน ฿$amount ผ่านคิวอาร์โค้ดเรียบร้อยแล้ว");
    return true;
  }

  @override
  String getReceipt() {
    return "ใบเสร็จ: โอนเงินผ่านพร้อมเพย์";
  }
}

// 3. ความท้าทาย: สร้างคลาส CoinSlotProcessor ให้สมบูรณ์
class CoinSlotProcessor implements PaymentProcessor {
  double coinsInserted;
  CoinSlotProcessor(this.coinsInserted);
  @override
  bool pay(double amount) {
    if (coinsInserted >= amount) {
      print("🪙 รับชำระเงินด้วยเหรียญจำนวน ฿$amount");
      return true;
    } else {
      print("❌ หยอดเหรียญไม่พอ");
      return false;
    }
  }

  @override
  String getReceipt() {
    return "ใบเสร็จ: ชำระเงินผ่านช่องหยอดเหรียญ";
  }
}

void main() {
  double laundryFee = 40.0;

  print("=== ผู้ใช้เลือกชำระผ่านพร้อมเพย์ ===\n");
  // สังเกตว่าชนิดตัวแปรคือ Interface (PaymentProcessor) ไม่ใช่ชื่อคลาสตรงๆ !
  PaymentProcessor method1 = PromptPayProcessor("081-234-5678");
  method1.pay(laundryFee);
  print(method1.getReceipt());
  print("\n=== ผู้ใช้เลือกหยอดเหรียญ ===\n");
  PaymentProcessor method2 = CoinSlotProcessor(50.0);
  method2.pay(laundryFee);
  print(method2.getReceipt());
}
