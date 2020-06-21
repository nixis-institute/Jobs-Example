import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myjobs/bloc/jobsModel.dart';
import 'package:myjobs/bloc/repository.dart';
part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  Repository repository;
  JobsBloc({this.repository});
  @override
  JobsState get initialState => JobsInitial();

  @override
  Stream<JobsState> mapEventToState(
    JobsEvent event,
  ) async* {
  
    if(event is AppStarted)
    {
      yield Loading();
      var jobs = await repository.fetchAllJobs();
      yield LoadJobs(jobs:jobs);
    }
  
  }
}
