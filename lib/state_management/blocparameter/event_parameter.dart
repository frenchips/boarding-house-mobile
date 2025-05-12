import 'package:ada_kost/model/parameterRequest/parameter_request.dart';

class ParameterEvent{}

class LoadingInitialData extends ParameterEvent{}

class LoadingMoreData extends ParameterEvent{}

class FetchParameterLoaded extends ParameterEvent{
  final ParameterSearchRequest request;

  FetchParameterLoaded(this.request);
}

class FetchParameterData extends ParameterEvent{
  final ParameterSearchRequest request;
  FetchParameterData(this.request);
}










