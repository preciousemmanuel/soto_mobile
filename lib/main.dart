import 'package:soto_ecommerce/buyer/buyer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) {
        return MaterialApp(
          title: 'Soto Ecommerce',
          debugShowCheckedModeBanner: false,
          navigatorKey: NavKey.appNavigatorKey,
          theme: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            fontFamily: 'Poppins',
            useMaterial3: true,
          ),
          home: const DashboardNav(),
        );
      },
    );
  }
}
