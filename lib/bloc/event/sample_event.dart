import 'package:ada_kost/screen/users/model/create_user.dart';

class SampleBlocEvent{}

class IncrementCounterEvent extends SampleBlocEvent{
  final int count;
  IncrementCounterEvent(this.count);
}

class DecrementCounterEvent extends SampleBlocEvent{
  final int count;
  DecrementCounterEvent(this.count);
}

class CreateUser extends SampleBlocEvent{
  final CreateUserModel model;
  CreateUser(this.model);
}

// class CreateLoading extends SampleBlocEvent{}
