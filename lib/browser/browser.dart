import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Browser extends StatelessWidget {
  const Browser({Key key, this.url, this.title}) : super(key: key);

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels:
              <JavascriptChannel>[_alertJavascriptChannel(context)].toSet(),
//          //        onWebViewCreated:
//          gestureRecognizers:
//          onPageFinished
        //          navigationDelegate:（NavigationRequest request) {
//            if (request.url.startsWith('js://webview')) {
//              print('JS调用了Flutter By navigationDelegate');
//              print('blocking navigation to $request}');
//              return NavigationDecision.prevent;
//            }
//            print('allowing navigation to $request');
//            return NavigationDecision.navigate;
//          },
      ),
    );
  }
}

JavascriptChannel _alertJavascriptChannel(BuildContext context) {
  return JavascriptChannel(
      name: 'Toast',
      onMessageReceived: (JavascriptMessage message) {
        print(message.message);
      });
}


//以下js代码
//<button onclick="callFlutter()">callFlutter</button>
//
//function callFlutter(){
//  Toast.postMessage("JS调用了Flutter");
//}

//<button onclick="callFlutter()">callFlutter</button>
//
//function callFlutter(){
//  /*约定的url协议为：js://webview?arg1=111&arg2=222*/
//  document.location = "js://webview?arg1=111&args2=222";
//}