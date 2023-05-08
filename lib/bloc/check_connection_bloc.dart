import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:network_check/network.dart';

part 'check_connection_event.dart';
part 'check_connection_state.dart';

@injectable
class CheckConnectionBloc
    extends Bloc<CheckConnectionEvent, CheckConnectionState> {
  final NetworkInfo networkInfo;
  CheckConnectionBloc(this.networkInfo) : super(CheckConnectionInitial()) {
    on<CheckConnectionEvent>((event, emit) async {
      if (event is CheckConEvent) {
        if (await networkInfo.isConnected) {
          emit(CheckConnectionStatus(message: 'connected'));
        } else {
          emit(CheckConnectionStatus(message: 'not connected'));
        }
      }
    });
  }
}
