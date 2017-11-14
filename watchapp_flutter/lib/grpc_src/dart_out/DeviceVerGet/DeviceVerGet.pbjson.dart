///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library DeviceVerGet_DeviceVerGet_pbjson;

const DeviceVer$json = const {
  '1': 'DeviceVer',
  '2': const [
    const {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'sub_device_id', '3': 2, '4': 1, '5': 9, '10': 'subDeviceId'},
    const {'1': 'sw_ver', '3': 3, '4': 1, '5': 5, '10': 'swVer'},
    const {'1': 'hw_ver', '3': 4, '4': 1, '5': 5, '10': 'hwVer'},
  ],
};

const QueryInfo$json = const {
  '1': 'QueryInfo',
  '2': const [
    const {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'sub_device_id', '3': 2, '4': 1, '5': 9, '10': 'subDeviceId'},
  ],
};

const RpcRequest$json = const {
  '1': 'RpcRequest',
  '2': const [
    const {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'query', '3': 11, '4': 3, '5': 11, '6': '.DeviceVerGet.QueryInfo', '10': 'query'},
  ],
};

const RpcResponse$json = const {
  '1': 'RpcResponse',
  '2': const [
    const {'1': 'vers', '3': 11, '4': 3, '5': 11, '6': '.DeviceVerGet.DeviceVer', '10': 'vers'},
  ],
};

