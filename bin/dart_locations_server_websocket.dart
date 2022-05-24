import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'location_report.dart';
import 'mime.dart' as mime;

final HOST = "127.0.0.1";
final PORT = 8080;
final LOG_REQUESTS = true;

void main(List<String> arguments) {
  WebSocketHandler webSocketHandler = WebSocketHandler();

  HttpServer.bind(HOST, PORT).then((HttpServer server) {
    server
        .transform(WebSocketTransformer())
        .listen((webSocket) => webSocketHandler.wsHandler(webSocket));
  });

  print('${DateTime.now().toString()} - Serving on $HOST:$PORT.');
}

// handle WebSocket events
class WebSocketHandler {
  Map<String, WebSocket> users = {}; // Map of current users
  Set<WebSocket> connections = {};
  Map<String, LocationReport> lastKnownLocations = {};

  wsHandler(WebSocket ws) {
    ws.listen((message) {
      processMessage2(ws, message);
    }, onDone: () {
      processClosed2(ws);
    });
    connections.add(ws);
    if (LOG_REQUESTS) {
      log('${DateTime.now().toString()} - New connection ${ws.hashCode} '
          '(active connections : ${connections.length})');
    }
    ws.add("You are now connected, bish, bash, bosh!");
  }

  processMessage2(WebSocket ws, String receivedMessage) {
    log("receivedMessage: $receivedMessage");
    var tokens = receivedMessage.split('#');
    var messageType = tokens[0];
    var message = tokens[1];
    if (messageType == "LOCATION_REPORT") {
      processMessageLocationReport(message);
    } else {
      print("Ignoring unhandled message type --> $receivedMessage");
    }
  }

  processMessageLocationReport(String message) {
    var lr = LocationReport.fromJson(jsonDecode(message));
    lastKnownLocations[lr.id] = lr;
    var allLocationsReport = AllLocationsReport(
        timestamp: DateTime.now(), locations: lastKnownLocations);
    var outgoingMessage = "LASTLOCATIONS#" + jsonEncode(allLocationsReport);
    print("sendingMessage: " + outgoingMessage);
    for (var ws in connections) {
      ws.add(outgoingMessage);
    }
  }

  processClosed2(WebSocket ws) {
    try {
      connections.remove(ws);
      log("${ws.hashCode} disconnected (${ws.closeReason}).");
      log("${DateTime.now().toString()} - There are currently ${connections.length} active connection(s)");
    } on Exception catch (err) {
      print('${DateTime.now().toString()} Exception - ${err.toString()}');
    }
  }

  String? getUserName(WebSocket ws) {
    String? userName;
    users.forEach((key, value) {
      if (value == ws) userName = key;
    });
    return userName;
  }

  String timeStamp() => DateTime.now().toString().substring(11, 16);

  void log(String s) {
    print(s);
  }
}
