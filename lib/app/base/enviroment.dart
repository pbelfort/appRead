const basePort = '3333';
const baseDevUrl = 'URL_FORNECIDA:$basePort';

class AppEnviroment {
  static String get baseUrl {
    return baseDevUrl;
  }
}
