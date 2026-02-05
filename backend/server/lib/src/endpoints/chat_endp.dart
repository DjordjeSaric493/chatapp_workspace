//  POPRAVKA: Dodato  'hide Message' da ne bi mešo serverpodovo sa mojom message.dart klasom
import 'package:serverpod/serverpod.dart' hide Message;
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import '../generated/protocol.dart';

class ChatEndpoint extends Endpoint {
  // Metoda za učitavanje istorije poruka
  Future<List<Message>> getMessageHistory(
    Session session,
    int channelId,
  ) async {
    return await Message.db.find(
      session,
      where: (t) => t.channelId.equals(channelId),
      orderBy: (t) => t.timestamp,
      include: Message.include(
        sender: UserInfo.include(),
      ),
    );
  }

  // Metoda za listu kanala
  Future<List<Channel>> getChannels(Session session) async {
    return await Channel.db.find(session);
  }

  @override
  Future<void> streamOpened(StreamingSession session) async {
    print("Korisnik povezan na WebSocket");
  }

  @override
  Future<void> handleStreamMessage(
    StreamingSession session,
    SerializableModel message,
  ) async {
    print("Stigla poruka na stream: $message");

    if (message is Message) {
      message.timestamp = DateTime.now();

      // 2. POPRAVKA: Ovako se dobija ID u Stream-u (StreamingSession)
      var authInfo = await session.authenticated;
      var userId = authInfo?.userId;

      if (userId != null) {
        message.senderId = userId;
      }

      // Upis u bazu
      var savedMessage = await Message.db.insertRow(session, message);

      // Keširanje (Redis dokaz)
      await session.caches.local.put(
        'last_msg_chan_${message.channelId}',
        savedMessage,
      );

      // Slanje svima
      sendStreamMessage(session, savedMessage);

      session.log("Chat poruka procesuirana: ${savedMessage.content}");
    }
  }
}
