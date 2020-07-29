import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class HttpClientPage extends StatefulWidget {
  HttpClientPage({Key key}) : super(key: key);

  @override
  _HttpClientPageState createState() => new _HttpClientPageState();
}

class _HttpClientPageState extends State<HttpClientPage> {
  var _ipAddress = 'Unknown';

  _getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    var httpClient = new HttpClient();

    String result;
    try {
      // var _post = await httpClient.postUrl(Uri.parse(url));
      // _post.add(utf8.encode('{"data":"1024"}'));
      // var response = await _post.close();
      var _get = await httpClient.getUrl(Uri.parse(url));
      var response = await _get.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        result = data['origin'];
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _ipAddress = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 32.0);

    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Your current IP address is:'),
            new Text('$_ipAddress.'),
            spacer,
            new RaisedButton(
              onPressed: _getIPAddress,
              child: new Text('Get IP address'),
            ),
          ],
        ),
      ),
    );
  }
}