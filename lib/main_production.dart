import 'package:dog_app/app/app.dart';
import 'package:dog_app/bootstrap.dart';
import 'package:dog_app/product/environment/environment_variables.dart';

class ProductionEnvironmentVariables implements EnvironmentVariables {
  @override
  String get baseUrl => 'https://dog.ceo/api/';
}

void main() {
  bootstrap(() => const App(), ProductionEnvironmentVariables());
}
