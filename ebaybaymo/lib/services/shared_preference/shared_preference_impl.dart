import 'package:ebaybaymo/services/shared_preference/shared_preference_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceServiceImpl implements SharedPreferenceService {
  static const String sessionIdKey = 'sessionId';

  @override
  Future<void> saveSessionId(String sessionId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(sessionIdKey, sessionId);
  }

  @override
  Future<String?> getSessionId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(sessionIdKey);
  }

  @override
  Future<void> removeSessionId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(sessionIdKey);
  }
}
