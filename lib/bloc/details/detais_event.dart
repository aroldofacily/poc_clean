abstract class DetailEvent {}

class DetailLoadedEvent extends DetailEvent {
  final int id;

  DetailLoadedEvent(this.id);
}
