class ApiPath {
  static const String port99 = ':9999';
  static const String port98 = ':9998';
  static const String baseUrl = 'https://cuongnh2k.space';
  static const String signIn = "$port99/auth/login";
  static const String singUp = "$port99/account";
  static const String activeAcount = "$port99/account/active";
  static const String updateAcount = "$port99/account";
  static const String searchAcoutByEmail = "$port99/account/extract";
  static const String register = "$port99/account";
  static const String getNewPass = "$port99/account/get-new-password";
  static const String refestToken = "$port99/auth/refresh-token";
  static const String checkToken = "$port99/auth/check";
  static const String activeDevice = "$port99/device/active";
  static const String getListDevice = "$port99/device";
  static const String logOut = "$port99/device";
  static const String upLoadFile = "$port99/file";
  static const String deleteFile = "$port99/file/delete";
  static const String downLoad = "$port99/file/";
  static const String getListChanel = "$port98/channel";
  static const String createChanel = "$port98/channel/";
  static const String updateChanel = "$port98/channel/";
  static const String deletaChanel = "$port98/channel/";
  static const String getListMesageChanel = "$port98/channel/";
  static const String getListmenberChanel = "$port98/channel/member/";
  static const String addMemberChanel = "$port98/channel/member/";
  static const String updateNickNameMember = "$port98/channel/member/";
  static const String createMesage = "$port98/}/message";
  static const String updateMesage = "$port98/message";
  static const String deleteMesage = "$port98/message/";
}
