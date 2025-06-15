import 'package:bloc/bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_courses/bloc/font/font_event.dart';
import 'package:online_courses/bloc/font/font_state.dart';
import 'package:online_courses/services/font_services.dart';

class FontBloc extends Bloc<FontEvent, FontState> {
  final GetStorage _storage = GetStorage();

  FontBloc()
    : super(
        FontState(
          fontFamily: FontServices.currentFontFamily,
          fontScale: FontServices.currentFontScale,
        ),
      ) {
    on<UpdateFontScale>(_onUpdateFontScale);
    on<UpdateFontFamily>(_onUpdateFontFamily);
  }
  void _onUpdateFontScale(
    UpdateFontScale event,
    Emitter<FontState> emit,
  ) async {
    await FontServices.setFontScale(event.scale);
    emit(state.copyWith(fontScale: event.scale));
  }

  void _onUpdateFontFamily(
    UpdateFontFamily event,
    Emitter<FontState> emit,
  ) async {
    await FontServices.setFontFamily(event.family);
    emit(state.copyWith(fontFamily: event.family));
  }
}
