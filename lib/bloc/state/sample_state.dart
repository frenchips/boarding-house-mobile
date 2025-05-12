class SampleBlocState{}

class SampleBlocInitial extends SampleBlocState{}

class IncrementCounterState extends SampleBlocState{
  final int count;
  IncrementCounterState(this.count);
}

class DecrementCounterState extends SampleBlocState{
  final int count;
  DecrementCounterState(this.count);
}

class CreateSuccess extends SampleBlocState{
  final String id;
  CreateSuccess(this.id);
}

class CreateLoading extends SampleBlocState{}

class SampleErrorState extends SampleBlocState{}