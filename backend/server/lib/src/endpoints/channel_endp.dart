// 1. OBAVEZNO: Serverpod Core
import 'package:serverpod/serverpod.dart' as pod;

// 2. OBAVEZNO: Auth modul (Bez ovoga ne vidi .userId)
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

// 3. Tvoji modeli
import '../generated/protocol.dart';

class ChannelEndpoint extends pod.Endpoint {
  // KREIRANJE KANALA
  Future<Channel> createChannel(
    pod.Session session,
    String name,
    List<int> otherUserIds,
  ) async {
    // Ovde eksplicitno kažemo: Ovo je AuthenticationInfo
    pod.AuthenticationInfo? authInfo = await session.authenticated;
    var myId = authInfo?.userId;

    if (myId == null) throw Exception('Niste ulogovani.');

    // VALIDACIJA
    if (otherUserIds.isEmpty) {
      throw Exception('Morate dodati bar jednu osobu u sobu!');
    }

    // TRANSAKCIJA
    return await session.db.transaction((transaction) async {
      // 1. Napravi sobu
      var newChannel = Channel(name: name, type: 'group');
      var savedChannel = await Channel.db.insertRow(
        session,
        newChannel,
        transaction: transaction,
      );

      // 2. Ti si ADMIN
      await ChannelMember.db.insertRow(
        session,
        ChannelMember(
          userId: myId,
          channelId: savedChannel.id!,
          role: 'admin',
          joinedAt: DateTime.now(),
        ),
        transaction: transaction,
      );

      // 3. Ostali su MEMBERI
      for (var userId in otherUserIds) {
        await ChannelMember.db.insertRow(
          session,
          ChannelMember(
            userId: userId,
            channelId: savedChannel.id!,
            role: 'member',
            joinedAt: DateTime.now(),
          ),
          transaction: transaction,
        );
      }

      return savedChannel;
    });
  }

  // NAPUSTI SOBU
  Future<void> leaveChannel(pod.Session session, int channelId) async {
    pod.AuthenticationInfo? authInfo = await session.authenticated;
    var myId = authInfo?.userId;

    if (myId != null) {
      await ChannelMember.db.deleteWhere(
        session,
        where: (t) => t.channelId.equals(channelId) & t.userId.equals(myId),
      );
    }
  }
}
