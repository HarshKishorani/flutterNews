import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {

  final String blogUrl;
  const ArticleView({super.key, required this.blogUrl});

  @override
  ArticleViewState createState() => ArticleViewState();
}

class ArticleViewState extends State<ArticleView> {

  // final Completer<WebViewController> _completer = Completer<WebViewController>();

  late WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse(widget.blogUrl));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Flutter',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),
            Text('News',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
              ),)
          ],
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height ,
        width: MediaQuery.of(context).size.width ,
        child: WebViewWidget(
          controller: controller,
          // initialUrl: widget.blogUrl,
          // onWebViewCreated: ((WebViewController webViewController){
          //   _completer.complete(webViewController);
          // }),
        ),
      ),
    );
  }
}
