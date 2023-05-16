class Device {
  String deviceName;
  String Board;
  Device({required this.deviceName, required this.Board});
}

List<Device> deviceList = [
  Device(deviceName: 'LED', Board: '1'),
  Device(deviceName: 'TV', Board: '2'),
  Device(deviceName: 'Lamp', Board: '1'),
  Device(deviceName: 'Motor', Board: '3'),
  Device(deviceName: 'LED2', Board: '1'),
  Device(deviceName: 'Television', Board: '1'),
];
