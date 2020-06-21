import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myjobs/bloc/jobs_bloc.dart';
import 'package:myjobs/bloc/repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Repository repository = new Repository();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<JobsBloc>(
          create: (context)=>JobsBloc(repository: repository)..add(AppStarted()),
        )
      ],
      child: 
        MaterialApp(
          title: 'Jobs Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home:BlocBuilder<JobsBloc,JobsState>(
            builder: (context,state){
              return Home();
            },
          )
        )
    );

  }
}


class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
  
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Jobs"),),
      body: BlocBuilder<JobsBloc,JobsState>(
        builder: (context,state){
          if(state is Loading){
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is LoadJobs){
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: state.jobs.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(state.jobs[index].title,style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(state.jobs[index].company??""),
                );
              });
          }
        },
      ),
    );
  }
}