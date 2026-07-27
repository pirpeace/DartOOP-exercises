mixin CloudLogger {
  void logToCloud(String message) {
    // ในแอปจริง โค้ดส่วนนี้จะส่งข้อมูลไปยังระบบฐานข้อมูล เช่น Firebase
    print("☁️ [Cloud Log]: $message");
  }
}

// 2. คลาสแบบเจเนอริกส์ (THE GENERIC CLASS)
// <T> ย่อมาจาก "Type" ทำให้คลาสนี้สามารถเก็บข้อมูลชนิดใดก็ได้ (String, int, ฯลฯ)
// สังเกตการใช้ 'with CloudLogger' เพื่อนำฟังก์ชันจากมิกซ์อินมาใช้งาน!
class AppDataCache<T> with CloudLogger {
  T?
  cachedData; // T? หมายความว่าตัวแปรนี้อาจเก็บข้อมูลชนิด T หรือเป็น null ก็ได้

  void saveData(T newData) {
    cachedData = newData;
    logToCloud("บันทึกข้อมูลแล้ว: $cachedData");
  }

  void clearData() {
    cachedData = null;
    logToCloud("ล้างข้อมูลในแคชแล้ว");
  }
}

void main() {
  print("=== กำลังแคชข้อมูลแบบสตริง (User Token) ===\n");
  // เราระบุ <String> เพื่อบอกให้คอมไพเลอร์ทราบว่า T ในที่นี้คือ String
  AppDataCache<String> tokenCache = AppDataCache<String>();

  tokenCache.saveData("ABC-123");

  tokenCache.clearData();

  print("\n=== กำลังแคชข้อมูลแบบตัวเลข (High Score) ===\n");
  AppDataCache<int> scoreCache = AppDataCache<int>();

  scoreCache.saveData(9999);
}
