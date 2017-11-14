///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library ProductCmdAdd_ProductCmdAdd_pbjson;

const CmdInfo$json = const {
  '1': 'CmdInfo',
  '2': const [
    const {'1': 'cmdid', '3': 13, '4': 1, '5': 13, '10': 'cmdid'},
    const {'1': 'cmd_type', '3': 14, '4': 1, '5': 13, '10': 'cmdType'},
    const {'1': 'arg_v', '3': 15, '4': 1, '5': 9, '10': 'argV'},
    const {'1': 'arg_type', '3': 16, '4': 1, '5': 9, '10': 'argType'},
    const {'1': 'arg_detail_en', '3': 17, '4': 1, '5': 9, '10': 'argDetailEn'},
    const {'1': 'arg_detail_cn', '3': 18, '4': 1, '5': 9, '10': 'argDetailCn'},
  ],
};

const CmdAns$json = const {
  '1': 'CmdAns',
  '2': const [
    const {'1': 'cmdid', '3': 11, '4': 1, '5': 13, '10': 'cmdid'},
    const {'1': 'code', '3': 12, '4': 1, '5': 13, '10': 'code'},
    const {'1': 'code_msg', '3': 13, '4': 1, '5': 9, '10': 'codeMsg'},
  ],
};

const RpcRequest$json = const {
  '1': 'RpcRequest',
  '2': const [
    const {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'product_code', '3': 11, '4': 1, '5': 9, '10': 'productCode'},
    const {'1': 'rom_ver', '3': 12, '4': 1, '5': 13, '10': 'romVer'},
    const {'1': 'cmds', '3': 13, '4': 3, '5': 11, '6': '.ProductCmdAdd.CmdInfo', '10': 'cmds'},
  ],
};

const RpcResponse$json = const {
  '1': 'RpcResponse',
  '2': const [
    const {'1': 'ans', '3': 11, '4': 3, '5': 11, '6': '.ProductCmdAdd.CmdAns', '10': 'ans'},
  ],
};

