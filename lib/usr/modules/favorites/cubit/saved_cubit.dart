import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/models/booked.dart';
import 'package:novels/usr/modules/favorites/cubit/saved_state.dart';

import '../../../../services/local_database.dart';

class LocalDatabaseCubit extends Cubit<LocalDatabaseState> {
  LocalDatabaseCubit() : super(LocalDatabaseInitial());

  List<BookedModel> booked = [];

  final NovelDatabase _database = NovelDatabase.instance;

  // inset to database
  void insertToBookedDataBase(BookedModel novelModel) {
    emit(InsertToBookedLocalDatabaseLoadingState());
    _database.insertDataToBookedDataBase(novel: novelModel).then((value) {
      getAllDataFromBookedDataBase();
      emit(InsertToBookedLocalDatabaseSuccessState());
    }).catchError((error) {
      emit(InsertToBookedLocalDatabaseErrorState());
    });
  }

  //update data
  void updateBookedDataBase(BookedModel novelModel) {
    emit(UpdateBookedLocalDatabaseLoadingState());
    _database.updateBookedNovel(novel: novelModel).then((value) {
      getAllDataFromBookedDataBase();
      emit(UpdateBookedLocalDatabaseSuccessState());
    }).catchError((error) {
      emit(UpdateBookedLocalDatabaseErrorState());
    });
  }

  //delete data
  void deleteFromBookedDataBase(int id) {
    emit(DeleteFromBookedLocalDatabaseLoadingState());
    _database.deleteBookedNovel(id: id).then((value) {
      getAllDataFromBookedDataBase();
      emit(DeleteFromBookedLocalDatabaseSuccessState());
    }).catchError((error) {
      emit(DeleteFromBookedLocalDatabaseErrorState());
    });
  }

  //get all data
  void getAllDataFromBookedDataBase() {
    emit(GetAllDataFromBookedLocalDatabaseLoadingState());
    _database.readAllNovelsBookedData().then((value) {
      booked = [];
      booked = value;
      emit(GetAllDataFromBookedLocalDatabaseSuccessState());
    }).catchError((error) {
      emit(GetAllDataFromBookedLocalDatabaseErrorState());
    });
  }

  void bookedButton(BookedModel bookedNovel) {
    int i = 0;
    for (i = 0; i < booked.length; i++) {
      if (booked[i].id.contains(bookedNovel.id)) {
        break;
      }
    }
    if (i == booked.length) {
      insertToBookedDataBase(bookedNovel);
    } else {
      deleteFromBookedDataBase(booked[i].dbId!);
    }
    emit(ChangeBookedState());
  }

  bool isBooked(BookedModel bookedNovel) {
    int i = 0;
    for (i = 0; i < booked.length; i++) {
      if (booked[i].id.contains(bookedNovel.id)) {
        break;
      }
    }
    if (i == booked.length) {
      emit(ChangeBookedState());

      return false;
    } else {
      emit(ChangeBookedState());

      return true;
    }
  }

  void deleteDatabase() {
    for (var element in booked) {
      deleteFromBookedDataBase(element.dbId!);
    }
    emit(DeleteLocalDatabaseState());
  }


  void closeDB(){
    _database.close();
  }
}
