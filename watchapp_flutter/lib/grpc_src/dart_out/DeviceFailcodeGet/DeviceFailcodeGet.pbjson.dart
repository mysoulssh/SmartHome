///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library DeviceFailcodeGet_DeviceFailcodeGet_pbjson;

const QueryInfo$json = const {
  '1': 'QueryInfo',
  '2': const [
    const {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'sub_device_id', '3': 2, '4': 1, '5': 9, '10': 'subDeviceId'},
  ],
};

const FailcodeInfo$json = const {
  '1': 'FailcodeInfo',
  '2': const [
    const {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'sub_device_id', '3': 2, '4': 1, '5': 9, '10': 'subDeviceId'},
    const {'1': 'fail_code', '3': 3, '4': 1, '5': 13, '10': 'failCode'},
    const {'1': 'time_stamp', '3': 4, '4': 1, '5': 13, '10': 'timeStamp'},
  ],
};

const RpcRequest$json = const {
  '1': 'RpcRequest',
  '2': const [
    const {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'query', '3': 11, '4': 3, '5': 11, '6': '.DeviceFailcodeGet.QueryInfo', '10': 'query'},
  ],
};

const RpcResponse$json = const {
  '1': 'RpcResponse',
  '2': const [
    const {'1': 'failcodes', '3': 11, '4': 3, '5': 11, '6': '.DeviceFailcodeGet.FailcodeInfo', '10': 'failcodes'},
  ],
};

