class Room {
  const Room({
    required this.name,
    required this.imageURL,
  });

  final String name;
  final String imageURL;
}

List<Room> _rooms = [
  const Room(
    name: 'Single Bedroom',
    imageURL: 'assets/images/single_bedroom-min.jpg',
  ),
  const Room(
    name: 'Double Bedroom',
    imageURL: 'assets/images/double-bedroom-min.jpg',
  ),
  const Room(
    name: 'Rooms with sea view',
    imageURL: 'assets/images/sea-view-min.jpg',
  ),
  const Room(
    name: 'Rooms near Beach',
    imageURL: 'assets/images/bed-beach-min.jpg',
  ),
  const Room(
    name: 'Rooms near coastal line',
    imageURL: 'assets/images/near-coastal-min.jpg',
  ),
];

List<Room> get rooms{
  return _rooms;
}
