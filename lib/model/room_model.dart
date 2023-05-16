class DataRoom {
  String nameRoom;
  String imgRoom;
  String deviceRoom;
  DataRoom(
      {required this.nameRoom,
      required this.imgRoom,
      required this.deviceRoom});
}

List<DataRoom> dataRoomList = [
  DataRoom(
      nameRoom: 'Living Room',
      imgRoom: 'assets/Images/livingroom.png',
      deviceRoom: '5 Device'
  ),
  DataRoom(
      nameRoom: 'Bath Room',
      imgRoom: 'assets/Images/bath.png',
      deviceRoom: '3 Device'
  ),
  DataRoom(
      nameRoom: 'Bed Room',
      imgRoom: 'assets/Images/bedroom.png',
      deviceRoom: '7 Device'
  ),
  DataRoom(
      nameRoom: 'Meeting Room',
      imgRoom: 'assets/Images/meetingroom.png',
      deviceRoom: '5 Device'
  ),
  DataRoom(
      nameRoom: 'Kitchen Room',
      imgRoom: 'assets/Images/kitchenroom.png',
      deviceRoom: '10 Device'
  ),
];
