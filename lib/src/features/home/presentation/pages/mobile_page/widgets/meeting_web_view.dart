import 'package:academy/src/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MeetingWebView extends StatefulWidget {
  const MeetingWebView({super.key});

  @override
  State<MeetingWebView> createState() => _MeetingWebViewState();
}

class _MeetingWebViewState extends State<MeetingWebView> {
  late WebViewController controller;
  var loadingPercentage = 0;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse('https://46.209.222.131:8082/'),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          loadingPercentage < 100
              ? CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
            value: loadingPercentage / 100.0,
          )
              : const SizedBox(width: AppSize.s0, height: AppSize.s0,)
        ],
      ),
    );
  }
}
