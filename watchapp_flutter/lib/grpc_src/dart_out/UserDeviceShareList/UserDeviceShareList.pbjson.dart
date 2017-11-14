///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library UserDeviceShareList_UserDeviceShareList_pbjson;

const ShareInfo$json = const {
  '1': 'ShareInfo',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 13, '10': 'userId'},
    const {'1': 'share_user_id', '3': 2, '4': 1, '5': 13, '10': 'shareUserId'},
    const {'1': 'device_id', '3': 3, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'device_name', '3': 4, '4': 1, '5': 9, '10': 'deviceName'},
    const {'1': 'create_time', '3': 5, '4': 1, '5': 13, '10': 'createTime'},
  ],
};

const RpcRequest$json = const {
  '1': 'RpcRequest',
  '2': const [
    const {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'page', '3': 11, '4': 1, '5': 13, '10': 'page'},
    const {'1': 'page_size', '3': 12, '4': 1, '5': 13, '10': 'pageSize'},
    const {'1': 'share_user_id', '3': 21, '4': 1, '5': 13, '10': 'shareUserId'},
  ],
};

const RpcResponse$json = const {
  '1': 'RpcResponse',
  '2': const [
    const {'1': 'total', '3': 1, '4': 1, '5': 13, '10': 'total'},
    const {'1': 'shares', '3': 2, '4': 3, '5': 11, '6': '.UserDeviceShareList.ShareInfo', '10': 'shares'},
  ],
};

