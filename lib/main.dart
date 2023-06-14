import 'package:flutter/material.dart';
import 'package:movas/config/config.dart';
import 'package:pokedex/movas/providers/providers.dart';
import 'package:pokedex/view/pokedex_list_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  moveAss(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: RouteName.main,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case RouteName.main:
              return MaterialPageRoute(
                builder: (_) => PokeDexPage(),
              );
            case RouteName.detail:
              return MaterialPageRoute(
                builder: (_) => Container(),
              );
            default:
              return MaterialPageRoute(
                builder: (_) => PokeDexPage(),
              );
          }
        },
      ),
    );
  }
}


class RouteName {
  static const String main = '/boot';
  static const String detail = '/login';
}