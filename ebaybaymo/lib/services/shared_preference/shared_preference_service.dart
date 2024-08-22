abstract interface class SharedPreferenceService {
  Future<void> saveSessionId(String sessionId);
  Future<String?> getSessionId();
  Future<void> removeSessionId();
}
