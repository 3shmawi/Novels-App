import '../models/category.dart';
import '../services/firestore_services.dart';
import '../utilities/firebase/collection_path.dart';

abstract class Controller {
  Stream<List<CategoryModel>> getCategoriesStream();
}

class FireStoreDataBase implements Controller {
  final _service = FirestoreServices.instance;

  @override
  Stream<List<CategoryModel>> getCategoriesStream() =>
      _service.collectionsStream(
        path: FirebaseCollectionPath.category(),
        builder: (data, documentId) => CategoryModel.fromMap(data!, documentId),
      );
}
