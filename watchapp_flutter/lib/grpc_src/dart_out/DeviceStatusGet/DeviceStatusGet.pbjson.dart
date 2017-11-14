///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library DeviceStatusGet_DeviceStatusGet_pbjson;

const QueryInfo$json = const {
  '1': 'QueryInfo',
  '2': const [
    const {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'sub_device_id', '3': 2, '4': 1, '5': 9, '10': 'subDeviceId'},
  ],
};

const StatusInfo$json = const {
  '1': 'StatusInfo',
  '2': const [
    const {'1': 'device_id', '3': 8, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'sub_device_id', '3': 1, '4': 1, '5': 9, '10': 'subDeviceId'},
    const {'1': 'online', '3': 2, '4': 1, '5': 13, '10': 'online'},
    const {'1': 'time_stamp', '3': 3, '4': 1, '5': 13, '10': 'timeStamp'},
    const {'1': 'cmdid', '3': 4, '4': 1, '5': 5, '10': 'cmdid'},
    const {'1': 'arg_int32', '3': 5, '4': 3, '5': 5, '10': 'argInt32'},
    const {'1': 'arg_string', '3': 6, '4': 3, '5': 9, '10': 'argString'},
    const {'1': 'arg_bytes', '3': 7, '4': 1, '5': 12, '10': 'argBytes'},
  ],
};

const RpcRequest$json = const {
  '1': 'RpcRequest',
  '2': const [
    const {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'devs', '3': 11, '4': 3, '5': 11, '6': '.DeviceStatusGet.QueryInfo', '10': 'devs'},
  ],
};

const RpcResponse$json = const {
  '1': 'RpcResponse',
  '2': const [
    const {'1': 'status', '3': 11, '4': 3, '5': 11, '6': '.DeviceStatusGet.StatusInfo', '10': 'status'},
  ],
};

