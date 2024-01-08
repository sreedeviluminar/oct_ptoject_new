import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main(){
  runApp(MaterialApp(home: WebVieEx(),));
}
class WebVieEx extends StatefulWidget {
  const WebVieEx({super.key});

  @override
  State<WebVieEx> createState() => _WebVieExState();
}

class _WebVieExState extends State<WebVieEx> {
  late WebViewController webViewController;
  
  @override
  void initState() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse('https://fluttergems.dev/'));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("WebView"),
          elevation: 6,
        ),
      body: Column(
        children: [
          Expanded(child: Image.network("https://images.unsplash.com/photo-1696313062527-12ef05c1593b?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")),
          Expanded(child: WebViewWidget(controller: webViewController)),
        ],
      ),
    );
  }
}
