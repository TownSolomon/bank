import 'package:envied/envied.dart';

/// dart run build_runner build

part 'secret.g.dart';

@Envied(path: '.env')
abstract class Secret {
  @EnviedField(varName: 'SIGNATURE_TOKEN', defaultValue: "", obfuscate: true)
  // static final signatureToken = "";
  static final signatureToken = _Secret.signatureToken;

  @EnviedField(varName: 'BASE_URL', defaultValue: "", obfuscate: true)
  // static final baseUrl = "";
  static final baseUrl = _Secret.baseUrl;
}