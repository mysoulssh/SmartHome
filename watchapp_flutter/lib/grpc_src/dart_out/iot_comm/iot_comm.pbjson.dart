///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library iot_comm_pbjson;

const SIOTCMD$json = const {
  '1': 'SIOTCMD',
  '2': const [
    const {'1': 'cmd_type', '3': 1, '4': 1, '5': 5, '10': 'cmdType'},
    const {'1': 'device_id', '3': 5, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'sub_device_id', '3': 6, '4': 1, '5': 9, '10': 'subDeviceId'},
    const {'1': 'cmdid', '3': 11, '4': 1, '5': 5, '10': 'cmdid'},
    const {'1': 'arg_int32', '3': 12, '4': 3, '5': 5, '10': 'argInt32'},
    const {'1': 'arg_string', '3': 13, '4': 3, '5': 9, '10': 'argString'},
    const {'1': 'arg_bytes', '3': 14, '4': 1, '5': 12, '10': 'argBytes'},
  ],
};

const IOTCMD$json = const {
  '1': 'IOTCMD',
  '2': const [
    const {'1': 'cmd', '3': 1, '4': 3, '5': 11, '6': '.SIOTCMD', '10': 'cmd'},
  ],
};

const CmdRecord$json = const {
  '1': 'CmdRecord',
  '2': const [
    const {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'sub_device_id', '3': 2, '4': 1, '5': 9, '10': 'subDeviceId'},
    const {'1': 'cmdid', '3': 3, '4': 1, '5': 5, '10': 'cmdid'},
    const {'1': 'arg_int32', '3': 4, '4': 3, '5': 5, '10': 'argInt32'},
    const {'1': 'arg_string', '3': 5, '4': 3, '5': 9, '10': 'argString'},
    const {'1': 'arg_bytes', '3': 6, '4': 1, '5': 12, '10': 'argBytes'},
    const {'1': 'cmd_src', '3': 7, '4': 1, '5': 5, '10': 'cmdSrc'},
    const {'1': 'is_run', '3': 8, '4': 1, '5': 5, '10': 'isRun'},
    const {'1': 'create_time', '3': 9, '4': 1, '5': 3, '10': 'createTime'},
    const {'1': 'run_time', '3': 10, '4': 1, '5': 3, '10': 'runTime'},
    const {'1': 'user_id', '3': 11, '4': 1, '5': 13, '10': 'userId'},
  ],
};

const ExprInfo$json = const {
  '1': 'ExprInfo',
  '2': const [
    const {'1': 'expr_id', '3': 1, '4': 1, '5': 5, '10': 'exprId'},
    const {'1': 'class', '3': 2, '4': 1, '5': 5, '10': 'class'},
    const {'1': 'start_time', '3': 3, '4': 1, '5': 5, '10': 'startTime'},
    const {'1': 'end_time', '3': 4, '4': 1, '5': 5, '10': 'endTime'},
    const {'1': 'device_id', '3': 5, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'sub_device_id', '3': 6, '4': 1, '5': 9, '10': 'subDeviceId'},
    const {'1': 'item_type', '3': 7, '4': 1, '5': 5, '10': 'itemType'},
    const {'1': 'item_index', '3': 8, '4': 1, '5': 5, '10': 'itemIndex'},
    const {'1': 'expr', '3': 9, '4': 1, '5': 9, '10': 'expr'},
    const {'1': 'value', '3': 10, '4': 1, '5': 5, '10': 'value'},
  ],
};

const RhsInfo$json = const {
  '1': 'RhsInfo',
  '2': const [
    const {'1': 'action_type', '3': 1, '4': 1, '5': 5, '10': 'actionType'},
    const {'1': 'scene_id', '3': 11, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'delay_sec', '3': 12, '4': 1, '5': 5, '10': 'delaySec'},
    const {'1': 'cmd', '3': 13, '4': 1, '5': 11, '6': '.SIOTCMD', '10': 'cmd'},
  ],
};

const RuleInfo$json = const {
  '1': 'RuleInfo',
  '2': const [
    const {'1': 'et_id', '3': 1, '4': 1, '5': 9, '10': 'etId'},
    const {'1': 'device_id', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'et_name', '3': 3, '4': 1, '5': 9, '10': 'etName'},
    const {'1': 'prio', '3': 4, '4': 1, '5': 5, '10': 'prio'},
    const {'1': 'enable', '3': 5, '4': 1, '5': 5, '10': 'enable'},
    const {'1': 'only_time', '3': 6, '4': 1, '5': 5, '10': 'onlyTime'},
    const {'1': 'lhs', '3': 7, '4': 1, '5': 9, '10': 'lhs'},
    const {'1': 'exprs', '3': 8, '4': 3, '5': 11, '6': '.ExprInfo', '10': 'exprs'},
    const {'1': 'rhs', '3': 9, '4': 3, '5': 11, '6': '.RhsInfo', '10': 'rhs'},
    const {'1': 'is_end', '3': 10, '4': 1, '5': 5, '10': 'isEnd'},
    const {'1': 'et_type', '3': 11, '4': 1, '5': 5, '10': 'etType'},
    const {'1': 'house_guid', '3': 12, '4': 1, '5': 9, '10': 'houseGuid'},
    const {'1': 'user_id', '3': 13, '4': 1, '5': 13, '10': 'userId'},
  ],
};

const SceneInfo$json = const {
  '1': 'SceneInfo',
  '2': const [
    const {'1': 'scene_id', '3': 1, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'scene_type', '3': 3, '4': 1, '5': 5, '10': 'sceneType'},
    const {'1': 'enable', '3': 4, '4': 1, '5': 5, '10': 'enable'},
    const {'1': 'house_guid', '3': 5, '4': 1, '5': 9, '10': 'houseGuid'},
    const {'1': 'scene_name', '3': 11, '4': 1, '5': 9, '10': 'sceneName'},
    const {'1': 'cmd', '3': 12, '4': 1, '5': 11, '6': '.IOTCMD', '10': 'cmd'},
  ],
};

