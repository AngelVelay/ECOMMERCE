// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:esmanagement/data/models/entities/socket_menssage/socket.model.dart';

// class NotificationsUtils {
//   void sendNotificationSingle(SocketModelMessage model) async {
//     await AwesomeNotifications().createNotification(
//         content: NotificationContent(
//             id: 1,
//             channelKey: 'single',
//             title: model.title,
//             body: model.message,
//             payload: model.toJson()));
//   }

//   void sendNotificationPicture(SocketModelMessage model) async {
//     await AwesomeNotifications().createNotification(
//         content: NotificationContent(
//       id: 2,
//       channelKey: 'picture',
//       title: model.title,
//       body: model.message,
//       payload: model.toJson(),
//       bigPicture: model.picture,
//       notificationLayout: NotificationLayout.BigPicture,
//     ));
//   }
// }
