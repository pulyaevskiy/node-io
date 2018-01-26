/// Node I/O system for Dart.
///
/// This library is designed so that you should be able to replace imports of
/// `dart:io` with `package:node_io/node_io.dart` and get the same functionality
/// working.
library node_io;

import 'dart:async';
import 'package:node/node.dart';
import 'package:node/stream.dart';
import 'src/streams.dart';
import 'dart:io' as io;

import 'src/http_server.dart';

int get exitCode => process.exitCode;

set exitCode(int value) {
  process.exitCode = value;
}

void exit([int code]) {
  if (code is! int) {
    throw new ArgumentError("Integer value for exit code expected");
  }
  process.exit(code);
}

int get pid => process.pid;

abstract class HttpServer implements io.HttpServer {
  static Future<io.HttpServer> bind(address, int port,
          {int backlog: 0, bool v6Only: false, bool shared: false}) =>
      NodeHttpServer.bind(address, port,
          backlog: backlog, v6Only: v6Only, shared: shared);
}

class Stdin extends ReadableStream<List<int>> implements Stream<List<int>> {
  Stdin(Readable nativeInstance) : super(nativeInstance);
}

// TODO: below:
// part 'bytes_builder.dart';
// part 'common.dart';
// part 'crypto.dart';
// part 'data_transformer.dart';
// part 'directory.dart';
// part 'directory_impl.dart';
// part 'eventhandler.dart';
// part 'file.dart';
// part 'file_impl.dart';
// part 'file_system_entity.dart';
// part 'http.dart';
// part 'http_date.dart';
// part 'http_headers.dart';
// part 'http_impl.dart';
// part 'http_parser.dart';
// part 'http_session.dart';
// part 'io_resource_info.dart';
// part 'io_sink.dart';
// part 'io_service.dart';
// part 'link.dart';
// part 'platform.dart';
// part 'platform_impl.dart';
// part 'process.dart';
// part 'secure_server_socket.dart';
// part 'secure_socket.dart';
// part 'security_context.dart';
// part 'service_object.dart';
// part 'socket.dart';
// part 'stdio.dart';
// part 'string_transformer.dart';
// part 'sync_socket.dart';
// part 'websocket.dart';
// part 'websocket_impl.dart';
