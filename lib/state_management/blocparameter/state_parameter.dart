
import 'package:ada_kost/model/parameterRequest/parameter_request.dart';
import 'package:ada_kost/model/parameterResponse/parameter_response.dart';

class ParameterState{}

class ParameterInitial extends ParameterState{}

class ParameterLoading extends ParameterState{}

class FetchParameterLoadMore extends ParameterState{}

class FetchParameter extends ParameterState{
  final ParameterSearchResponse resp;

  FetchParameter(this.resp);
}

class SuccessParameterLoadMore extends ParameterState{
  final List<ListData> data;

  SuccessParameterLoadMore(this.data);
}

class FetchParameterSuccess extends ParameterState{
  final List<ListData> data;
  FetchParameterSuccess(this.data);
}

class FetchSuccess extends ParameterState{
  ParameterSearchResponse response;
  FetchSuccess(this.response);
}


class FetchSuccessLoadMore extends ParameterState{
  ParameterSearchResponse response;
  FetchSuccessLoadMore(this.response);
}






class ParameterError extends ParameterState {}