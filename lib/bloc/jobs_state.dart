part of 'jobs_bloc.dart';

@immutable
abstract class JobsState {}

class JobsInitial extends JobsState {}


class Loading extends JobsState {}
class LoadJobs extends JobsState{
  List<JobsModel> jobs;
  LoadJobs({this.jobs});
}