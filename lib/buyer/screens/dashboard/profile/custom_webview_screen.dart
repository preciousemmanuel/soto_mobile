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
      appBar: AppBar(
          // title: Text(widget.arg.appBarText),
          // centerTitle: true,
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
