import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:soto_ecommerce/buyer/screens/splash/splash_screen.dart';
import 'package:soto_ecommerce/common/common.dart';

// Listen to background messages
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  printty('Handling a background message ${message.messageId}');
  FirebasePushNotificationService.firebaseMessagingBackgroundHandler(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitService().init(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: allProviders,
      child: ScreenUtilInit(
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
            onGenerateRoute: AppRouter.onGenerateRoute,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
