abstract class FeedItem {
  String author;
  int likes;
  FeedItem(this.author, this.likes);
  // เมธอดนามธรรม - คลาสลูกทุกตัว "ต้อง" นำไปเขียนเนื้อหา
  void renderWidget();
}

// 2. คลาสลูก (ตัวอย่างที่ทำไว้ให้แล้ว)
class TextPost extends FeedItem {
  String textContent;
  TextPost(String author, int likes, this.textContent) : super(author, likes);
  @override
  void renderWidget() {
    print("📝 โพสต์ข้อความ โดย $author");
    print("   \"$textContent\"");
    print("   ❤️ $likes ถูกใจ\n");
  }
}

// 3. ความท้าทาย: เขียนคลาส ImagePost ให้สมบูรณ์
class ImagePost extends FeedItem {
  String imageUrl;
  ImagePost(String author, int likes, this.imageUrl) : super(author, likes);

  // TODO 2: Override renderWidget()
  @override
  void renderWidget() {
    print("📷 โพสต์รูปภาพ โดย $author");
    print("   รูปภาพ: $imageUrl");
    print("   ❤️ $likes ถูกใจ\n");
  }

  void main() {
    // ลิสต์ที่เก็บอ็อบเจกต์ของคลาสแม่ (FeedItem)
    List<FeedItem> myAppFeed = [
      TextPost("Student123", 45, "อ่านหนังสือสอบ OOP ที่ห้องสมุด ม.นเรศวร!"),
      TextPost("Ajarn", 120, "อย่าลืมส่งงานออกแบบหน้าจอ Flutter นะครับ"),

      // TODO 3: นำเครื่องหมายคอมเมนต์บรรทัดล่างออก เมื่อสร้าง ImagePost เสร็จแล้ว
      // ImagePost("MaMui_Cycling", 200, "https://example.com/morning_ride.jpg"),
    ];
    print("=== กำลังสร้างฟีดแอปพลิเคชัน ===\n");

    // POLYMORPHISM IN ACTION:
    for (var item in myAppFeed) {
      item.renderWidget();
    }
  }
}
