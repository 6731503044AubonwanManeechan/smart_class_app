class StorageService {

  static final List<Map<String, dynamic>> checkins = [];

  static void saveCheckin(Map<String, dynamic> data) {
    checkins.add(data);
  }

  static List<Map<String, dynamic>> getCheckins() {
    return checkins;
  }

}