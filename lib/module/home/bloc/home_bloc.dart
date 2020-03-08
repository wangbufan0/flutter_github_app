import 'package:bloc/bloc.dart';

///
/// author：wangbufan
/// time: 2020/2/20
/// email: wangbufan00@gmail.com
///


enum HomeEvent{
  increase,
  decrease
}

class HomeBloc extends Bloc<HomeEvent,int>{

  @override
  // TODO: implement initialState
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(HomeEvent event) async*{
    switch(event){
      case HomeEvent.increase:
        yield state+1;
        break;
      case HomeEvent.decrease:
        yield state-1;
        break;
    }
  }

}


