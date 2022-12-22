abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class SendNotificationSuccessState extends NotificationState {}

class SendNotificationErrorState extends NotificationState {}

class SetNotificationLoadingState extends NotificationState {}

class SetNotificationSuccessState extends NotificationState {}

class SetNotificationErrorState extends NotificationState {}

class GetIndexSuccessState extends NotificationState {}

