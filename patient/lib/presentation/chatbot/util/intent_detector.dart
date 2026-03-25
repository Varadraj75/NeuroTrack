enum ChatIntent {
  activities,
  general,
}

extension ChatIntentX on ChatIntent {
  bool get isActivities => this == ChatIntent.activities;
  bool get isGeneral => this == ChatIntent.general;
}

class IntentDetector {
  static final IntentDetector _instance = IntentDetector._internal();
  IntentDetector._internal();
  static IntentDetector get instance => _instance;

  static Future<ChatIntent> detectIntent(String userMessage) async {
    return ChatIntent.activities;
  }
}
