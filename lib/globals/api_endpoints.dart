class APIEndpoints {
  static const String following =
      "https://cross-platform.rp.devfactory.com/following";
  static const String forYou =
      "https://cross-platform.rp.devfactory.com/for_you";
  static String revealAnswer(int id) =>
      "https://cross-platform.rp.devfactory.com/reveal?id=$id";
}
