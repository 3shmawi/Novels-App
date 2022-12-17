abstract class LocalDatabaseState {}

class LocalDatabaseInitial extends LocalDatabaseState {}

//insert
class InsertToBookedLocalDatabaseLoadingState extends LocalDatabaseState {}

class InsertToBookedLocalDatabaseSuccessState extends LocalDatabaseState {}

class InsertToBookedLocalDatabaseErrorState extends LocalDatabaseState {}

//update
class UpdateBookedLocalDatabaseLoadingState extends LocalDatabaseState {}

class UpdateBookedLocalDatabaseSuccessState extends LocalDatabaseState {}

class UpdateBookedLocalDatabaseErrorState extends LocalDatabaseState {}

//delete
class DeleteFromBookedLocalDatabaseLoadingState extends LocalDatabaseState {}

class DeleteFromBookedLocalDatabaseSuccessState extends LocalDatabaseState {}

class DeleteFromBookedLocalDatabaseErrorState extends LocalDatabaseState {}

//get
class GetAllDataFromBookedLocalDatabaseLoadingState extends LocalDatabaseState {
}

class GetAllDataFromBookedLocalDatabaseSuccessState extends LocalDatabaseState {
}

class GetAllDataFromBookedLocalDatabaseErrorState extends LocalDatabaseState {}

//change icon
class ChangeBookedState extends LocalDatabaseState {}

//delete all
class DeleteLocalDatabaseState extends LocalDatabaseState {}
