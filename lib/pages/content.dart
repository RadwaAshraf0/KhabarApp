import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContentPage extends StatefulWidget {
  final String articleUrl;

  ContentPage({required this.articleUrl});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  @override
void initState() {
  super.initState();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        top: false, 
        child: WebViewWidget(
          controller: WebViewController()
            ..setNavigationDelegate(
              NavigationDelegate(
                onPageStarted: (String url) {
                  print("Page started loading: $url");
                },
                onPageFinished: (String url) {
                  print("Page finished loading: $url");
                },
              ),
            )
            ..setBackgroundColor(const Color(0x00000000))
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..loadRequest(Uri.parse(widget.articleUrl)),
        ),
      ),
    );
  }
}
