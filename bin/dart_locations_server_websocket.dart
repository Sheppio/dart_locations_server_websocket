import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'location_report.dart';
import 'mime.dart' as mime;

final HOST = "127.0.0.1";
final PORT = 8080;
final LOG_REQUESTS = true;

void main(List<String> arguments) {
  print('Hello world!');
  WebSocketHandler webSocketHandler = WebSocketHandler();
  //HttpRequestHandler httpRequestHandler = HttpRequestHandler();

  HttpServer.bind(HOST, PORT).then((HttpServer server) {
    server
        .transform(WebSocketTransformer())
        .listen((webSocket) => webSocketHandler.wsHandler(webSocket));

    // StreamController sc = StreamController();
    // sc.stream.transform(WebSocketTransformer()).listen((WebSocket ws) {
    //   webSocketHandler.wsHandler(ws);
  });

  //   server.listen((HttpRequest request) {
  //     if (request.uri.path == '/Chat') {
  //       sc.add(request);
  //       // } else if (request.uri.path.startsWith('/chat')) {
  //       //   httpRequestHandler.requestHandler(request);
  //     } else {
  //       NotFoundHandler().onRequest(request.response);
  //     }
  //   });
  // });

  print('${DateTime.now().toString()} - Serving Chat on $HOST:$PORT.');
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
    }
    for (var ws in connections) {
      ws.add("ECHO: $receivedMessage");
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

  processMessage(WebSocket ws, String receivedMessage) {
    try {
      String sendMessage = '';
      String? userName;
      userName = getUserName(ws);
      if (LOG_REQUESTS) {
        log('${DateTime.now().toString()} - Received message on connection'
            ' ${ws.hashCode}: $receivedMessage');
      }
      if (userName != null) {
        sendMessage = '${timeStamp()} $userName >> $receivedMessage';
      } else if (receivedMessage.startsWith("userName=")) {
        userName = receivedMessage.substring(9);
        if (users[userName] != null) {
          sendMessage = 'Note : $userName already exists in this chat room. '
              'Previous connection was deleted.\n';
          if (LOG_REQUESTS) {
            log('${DateTime.now().toString()} - Duplicated name, closed previous '
                'connection ${users[userName].hashCode} (active connections : ${users.length})');
          }
          users[userName]
              ?.add(preFormat('$userName has joind using another connection!'));
          users[userName]?.close(); //  close the previous connection
        }
        users[userName] = ws;
        sendMessage = '$sendMessage${timeStamp()} * $userName joined.';
      }
      sendAll(sendMessage);
    } on Exception catch (err) {
      print('${DateTime.now().toString()} - Exception - ${err.toString()}');
    }
  }

  processClosed2(WebSocket ws) {
    try {
      connections.remove(ws);
      log("${ws.hashCode} disconnected (${ws.closeReason}).");
      log("${DateTime.now().toString()} - There are currently ${connections.length} active connection(s)");
      // String? userName = getUserName(ws);
      // if (userName != null) {
      //   String sendMessage = '${timeStamp()} * $userName left.';
      //   users.remove(userName);
      //   sendAll(sendMessage);
      //   if (LOG_REQUESTS) {
      //     log('${DateTime.now().toString()} - Closed connection '
      //         '${ws.hashCode} with ${ws.closeCode} for ${ws.closeReason}'
      //         '(active connections : ${users.length})');
      //   }
      // }
    } on Exception catch (err) {
      print('${DateTime.now().toString()} Exception - ${err.toString()}');
    }
  }

  processClosed(WebSocket ws) {
    try {
      String? userName = getUserName(ws);
      if (userName != null) {
        String sendMessage = '${timeStamp()} * $userName left.';
        users.remove(userName);
        sendAll(sendMessage);
        if (LOG_REQUESTS) {
          log('${DateTime.now().toString()} - Closed connection '
              '${ws.hashCode} with ${ws.closeCode} for ${ws.closeReason}'
              '(active connections : ${users.length})');
        }
      }
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

  void sendAll(String sendMessage) {
    users.forEach((key, value) {
      value.add(preFormat(sendMessage));
    });
  }
}

String timeStamp() => DateTime.now().toString().substring(11, 16);

String preFormat(String s) {
  StringBuffer b = StringBuffer();
  String c;
  bool nbsp = false;
  for (int i = 0; i < s.length; i++) {
    c = s[i];
    if (c != ' ') nbsp = false;
    if (c == '&') {
      b.write('&amp;');
    } else if (c == '"') {
      b.write('&quot;');
    } else if (c == "'") {
      b.write('&#39;');
    } else if (c == '<') {
      b.write('&lt;');
    } else if (c == '>') {
      b.write('&gt;');
    } else if (c == '\n') {
      b.write('<br>');
    } else if (c == ' ') {
      if (!nbsp) {
        b.write(' ');
        nbsp = true;
      } else {
        b.write('&nbsp;');
      }
    } else {
      b.write(c);
    }
  }
  return b.toString();
}

// adapt this function to your logger
void log(String s) {
  print(s);
}

// handle HTTP requests
// class HttpRequestHandler {
//   void requestHandler(HttpRequest request) {
//     HttpResponse response = request.response;
//     try {
//       String fileName = request.uri.path;
//       if (fileName == '/chat') {
//         if (request.headers['user-agent']?[0]?.contains('Dart')) {
//           fileName = 'WebSocketChatClient.html';
//         }
//         else { fileName = 'WebSocketChat.html';
//         }
//         FileHandler().sendFile(request, response, fileName);
//       }
//       else if (fileName.startsWith('/chat/')){
//         fileName = request.uri.path.replaceFirst('/chat/', '');
//         FileHandler().sendFile(request, response, fileName);
//       }
//       else { NotFoundHandler().onRequest(response);
//       }
//     }
//     on Exception catch (err) {
//       print('Http request handler error : $err.toString()');
//     }
//   }
// }

// class FileHandler {
//   void sendFile(HttpRequest request, HttpResponse response, String fileName) {
//     try {
//       if (LOG_REQUESTS) {
//         log('${DateTime.now().toString()} - Requested file name : $fileName');
//       }
//       File file = File(fileName);
//       if (file.existsSync()) {
//         String mimeType = mime.mime(fileName);
//         if (mimeType == null) mimeType = 'text/plain; charset=UTF-8';
//         response.headers.set('Content-Type', mimeType);
//         RandomAccessFile openedFile = file.openSync();
//         response.contentLength = openedFile.lengthSync();
//         openedFile.closeSync();
//         // Pipe the file content into the response.
//         file.openRead().pipe(response);
//       } else {
//         if (LOG_REQUESTS) {
//           log('${DateTime.now().toString()} - File not found: $fileName');
//         }
//         NotFoundHandler().onRequest(response);
//       }
//     } on Exception catch (err) {
//       print('${DateTime.now().toString()} - File handler error : $err.toString()');
//     }
//   }
// }

class NotFoundHandler {
  static final String notFoundPageHtml = '''
<html><head>
<title>404 Not Found</title>
</head><body>
<h1>Not Found</h1>
<p>The requested URL or File was not found on this server.</p>
</body></html>''';

  void onRequest(HttpResponse response) {
    response.statusCode = HttpStatus.NOT_FOUND;
    response.headers.set('Content-Type', 'text/html; charset=UTF-8');
    response.write(notFoundPageHtml);
    response.close();
  }
}
