import 'package:soto_ecommerce/buyer/buyer.dart';
import 'package:soto_ecommerce/common/common.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebviewScreen extends StatefulWidget {
  const CustomWebviewScreen({
    super.key,
    required this.arg,
  });

  final WebViewArg arg;

  @override
  State<CustomWebviewScreen> createState() => _CustomWebviewScreenState();
}

class _CustomWebviewScreenState extends State<CustomWebviewScreen> {
  bool isLoading = true;

  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture();
  }

  Future<void> _initializeControllerFuture() async {
    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(
      const PlatformWebViewControllerCreationParams(),
    );

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (_) async {
          isLoading = true;
        },
        onPageFinished: (finish) {
          setState(() {
            isLoading = false;
          });
        },
      ))
      ..loadRequest(Uri.parse(widget.arg.webURL));

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Sizer.height(60)),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Sizer.width(16),
          ),
          color: AppColors.bgFF,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  context.read<OrderVM>().clearCart();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RoutePath.dashboardNavScreen,
                    (route) => false,
                    arguments: DashArg(index: 1),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(Sizer.radius(4)),
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    size: Sizer.radius(30),
                  ),
                ),
              ),
              const YBox(10),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: _controller,
          ),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : const Stack(),
        ],
      ),
    );
  }
}
