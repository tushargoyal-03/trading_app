/*
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  void connect(String token) {
    socket = IO.io(
      'http://157.20.51.180:5678',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .setAuth({'token': token})
          .enableAutoConnect()
          .build(),
    );
    socket.onConnect((_) {
      print("✅ Socket Connected: ${socket.id}");
    });
  }

  void joinRoom(String roomId) {
    socket.emit("joinRoom", roomId);
  }

  void sendMessage(Map<String, dynamic> data) {
    socket.emit("sendMessage", data);
  }

  void onMessage(Function(Map<String, dynamic>) callback) {
    socket.on("receiveMessage", (data) {
      callback(Map<String, dynamic>.from(data));
    });
  }

  // Socket disconnect function
  void dispose() {
    socket.disconnect();
  }
}*/
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  void connect(String token) {
    socket = IO.io(
      'http://157.20.51.180:5678',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .setAuth({'token': token})
          .enableAutoConnect()
          .build(),
    );
    socket.onConnect((_) {
      print("✅ Socket Connected: ${socket.id}");
    });
  }

  void joinRoom(String roomId) {
    socket.emit("joinRoom", roomId);
  }

  /// Normal send
  void sendMessage(Map<String, dynamic> data) {
    socket.emit("sendMessage", data);
  }

  /// Send with acknowledgment callback
  void sendMessageWithAck(
      Map<String, dynamic> data, Function(Map<String, dynamic>?) ackCallback) {
    socket.emitWithAck("sendMessage", data, ack: (ackData) {
      ackCallback(ackData != null ? Map<String, dynamic>.from(ackData) : null);
    });
  }

  void onMessage(Function(Map<String, dynamic>) callback) {
    socket.on("receiveMessage", (data) {
      callback(Map<String, dynamic>.from(data));
    });
  }

  // Disconnect socket
  void dispose() {
    socket.disconnect();
  }
}
