abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class SendNotificationSuccessState extends NotificationState {}

class SendNotificationErrorState extends NotificationState {}
class ListenState extends NotificationState {}
