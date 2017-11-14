///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library DeviceStatusSet_DeviceStatusSet_pbjson;

const StatusInfo$json = const {
  '1': 'StatusInfo',
  '2': const [
    const {'1': 'sub_device_id', '3': 1, '4': 1, '5': 9, '10': 'subDeviceId'},
    const {'1': 'online', '3': 2, '4': 1, '5': 13, '10': 'online'},
    const {'1': 'time_stamp', '3': 3, '4': 1, '5': 13, '10': 'timeStamp'},
    const {'1': 'cmdid', '3': 4, '4': 1, '5': 5, '10': 'cmdid'},
    const {'1': 'arg_int32', '3': 5, '4': 3, '5': 5, '10': 'argInt32'},
    const {'1': 'arg_string', '3': 6, '4': 3, '5': 9, '10': 'argString'},
    const {'1': 'arg_bytes', '3': 7, '4': 1, '5': 12, '10': 'argBytes'},
    const {'1': 'last_time', '3': 8, '4': 1, '5': 3, '10': 'lastTime'},
  ],
};

const RpcRequest$json = const {
  '1': 'RpcRequest',
  '2': const [
    const {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'device_seckey', '3': 2, '4': 1, '5': 9, '10': 'deviceSeckey'},
    const {'1': 'status', '3': 11, '4': 3, '5': 11, '6': '.DeviceStatusSet.StatusInfo', '10': 'status'},
  ],
};

const RpcResponse$json = const {
  '1': 'RpcResponse',
};

