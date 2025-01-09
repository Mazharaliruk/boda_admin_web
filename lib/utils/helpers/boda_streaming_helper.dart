import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class BodaStreamingHelper {
  final WebSocketChannel channel;

  BodaStreamingHelper(String url)
      : channel = WebSocketChannel.connect(Uri.parse(url));

  Stream<Map<String, dynamic>> get stream {
    return channel.stream.map((message) {
      return jsonDecode(message) as Map<String, dynamic>;
    });
  }

  void sendMessage(Map<String, dynamic> message) {
    channel.sink.add(jsonEncode(message));
  }

  void close() {
    channel.sink.close();
  }
}
