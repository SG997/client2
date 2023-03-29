import 'dart:async';

import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';
import 'package:unimastery_mobile/app/log.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';

class DeepLinkService {
  StreamSubscription? _uniLinkSubscription;
  bool _isInitialLinkHandled = false;

  Future<void> start() async {
    try {
      if (_isInitialLinkHandled == false) {
        await _handleInitialUri();
      }

      _handleUriStream();
    } on PlatformException catch (e) {
      Logger.log("initUniLinks PlatformException = ${e.message}, ${e.details}");
    } on FormatException catch (e) {
      Logger.log("initUniLinks FormatException = ${e.message}, ${e.source}");
    }
  }

  _handleInitialUri() async {
    final initialUri = await getInitialUri();
    await Future.delayed(const Duration(seconds: 1));
    if (initialUri != null) handleUri(initialUri);
    _isInitialLinkHandled = true;
  }

  _handleUriStream() {
    _uniLinkSubscription = uriLinkStream.listen((uri) {
      if (uri != null) handleUri(uri);
    });
  }

  handleLink(String link) {
    final uri = Uri.tryParse(link);
    if (uri != null) handleUri(uri);
  }

  handleUri(Uri uri) {
    Logger.log("handleUri = ${uri.path}, ${uri.pathSegments}");

    final route = RouteName.fromString(uri.pathSegments.first);

    if (route == null) return;

    Navigation.push(route);
  }

  stop() => _uniLinkSubscription?.cancel();
}
