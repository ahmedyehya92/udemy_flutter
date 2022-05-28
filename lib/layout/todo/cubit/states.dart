abstract class HomeStates{}

class HomeInitialState extends HomeStates {}
class ChangeNavBarState extends HomeStates {}

class CreateDatabaseState extends HomeStates {}
class GetDatabaseState extends HomeStates {}
class InsertDatabaseState extends HomeStates {}

class HomeNewTaskBottomSheetChangeShownState extends HomeStates {}

class LoadingTasksState extends HomeStates {}

class UpdateTaskToDoneState extends HomeStates{}
class UpdateTaskToArchivedState extends HomeStates{}
class DeleteTaskState extends HomeStates{}

class NoNewTasks extends HomeStates{}