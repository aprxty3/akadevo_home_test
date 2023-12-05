import 'core/env.dart';

void main() => Development();

class Development extends Env {
  @override
  final String appName = 'Akadevo Test';
  @override
  final String baseUrl = 'https://jsonplaceholder.typicode.com'; //dev
  @override
  EnvType environmentType = EnvType.development;

  @override
  final String dbName = '';
}
