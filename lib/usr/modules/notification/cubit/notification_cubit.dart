import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/services/fcm_notification.dart';
import '../../../../models/notification.dart';
import '../../../../services/firestore_services.dart';
import '../../../../utilities/firebase/collection_path.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  final FirestoreServices _service = FirestoreServices.instance;

  void setNotification({required NotificationModel notification}) {
    emit(SetNotificationLoadingState());
    _service
        .setData(
            path: FirebaseCollectionPath.setNotification(
              notification.to,
              notification.id,
            ),
            data: notification.toMap())
        .then((value) {
      emit(SetNotificationSuccessState());
    }).catchError((error) {
      emit(SetNotificationErrorState());
    });
  }

  void sendNotification(
      {required String title, required String body, required String token}) {
    DioHelper.postFCMNotification(
      token: token,
      body: body,
      title: title,
    ).then((value) {
      emit(SendNotificationSuccessState());
    }).catchError((error) {
      emit(SendNotificationErrorState());
    });
  }

}
