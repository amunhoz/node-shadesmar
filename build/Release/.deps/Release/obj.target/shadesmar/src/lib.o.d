cmd_Release/obj.target/shadesmar/src/lib.o := g++ -o Release/obj.target/shadesmar/src/lib.o ../src/lib.cpp '-DNODE_GYP_MODULE_NAME=shadesmar' '-DUSING_UV_SHARED=1' '-DUSING_V8_SHARED=1' '-DV8_DEPRECATION_WARNINGS=1' '-DV8_DEPRECATION_WARNINGS' '-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D_LARGEFILE_SOURCE' '-D_FILE_OFFSET_BITS=64' '-D__STDC_FORMAT_MACROS' '-DOPENSSL_NO_PINSHARED' '-DOPENSSL_THREADS' '-DBUILDING_NODE_EXTENSION' -I/home/ivuser/.cache/node-gyp/12.20.0/include/node -I/home/ivuser/.cache/node-gyp/12.20.0/src -I/home/ivuser/.cache/node-gyp/12.20.0/deps/openssl/config -I/home/ivuser/.cache/node-gyp/12.20.0/deps/openssl/openssl/include -I/home/ivuser/.cache/node-gyp/12.20.0/deps/uv/include -I/home/ivuser/.cache/node-gyp/12.20.0/deps/zlib -I/home/ivuser/.cache/node-gyp/12.20.0/deps/v8/include -I/home/ivuser/git/test/shadesmar/node_modules/node-addon-api -I/home/ivuser/git/test/shadesmar/node_modules/napi-thread-safe-callback -I../src/packages/shadesmar/include -I../src  -fPIC -pthread -Wall -Wextra -Wno-unused-parameter -m64 -O3 -fno-omit-frame-pointer -fno-rtti -fno-exceptions -std=gnu++1y -std=c++17 -O2 -Wall -fexceptions -MMD -MF ./Release/.deps/Release/obj.target/shadesmar/src/lib.o.d.raw   -c
Release/obj.target/shadesmar/src/lib.o: ../src/lib.cpp ../src/lib.h \
 /home/ivuser/git/test/shadesmar/node_modules/node-addon-api/napi.h \
 /home/ivuser/.cache/node-gyp/12.20.0/include/node/node_api.h \
 /home/ivuser/.cache/node-gyp/12.20.0/include/node/js_native_api.h \
 /home/ivuser/.cache/node-gyp/12.20.0/include/node/js_native_api_types.h \
 /home/ivuser/.cache/node-gyp/12.20.0/include/node/node_api_types.h \
 /home/ivuser/git/test/shadesmar/node_modules/node-addon-api/napi-inl.h \
 /home/ivuser/git/test/shadesmar/node_modules/node-addon-api/napi-inl.deprecated.h \
 /home/ivuser/git/test/shadesmar/node_modules/napi-thread-safe-callback/napi-thread-safe-callback.hpp \
 /home/ivuser/git/test/shadesmar/node_modules/napi-thread-safe-callback/napi-thread-safe-callback-impl.hpp \
 /home/ivuser/.cache/node-gyp/12.20.0/include/node/uv.h \
 /home/ivuser/.cache/node-gyp/12.20.0/include/node/uv/errno.h \
 /home/ivuser/.cache/node-gyp/12.20.0/include/node/uv/version.h \
 /home/ivuser/.cache/node-gyp/12.20.0/include/node/uv/unix.h \
 /home/ivuser/.cache/node-gyp/12.20.0/include/node/uv/threadpool.h \
 /home/ivuser/.cache/node-gyp/12.20.0/include/node/uv/linux.h \
 ../src/packages/shadesmar/include/shadesmar/memory/copier.h \
 ../src/packages/shadesmar/include/shadesmar/pubsub/publisher.h \
 ../src/packages/shadesmar/include/shadesmar/pubsub/topic.h \
 ../src/packages/shadesmar/include/shadesmar/concurrency/scope.h \
 ../src/packages/shadesmar/include/shadesmar/macros.h \
 ../src/packages/shadesmar/include/shadesmar/memory/memory.h \
 ../src/packages/shadesmar/include/shadesmar/concurrency/lockless_set.h \
 ../src/packages/shadesmar/include/shadesmar/concurrency/robust_lock.h \
 ../src/packages/shadesmar/include/shadesmar/concurrency/lock.h \
 ../src/packages/shadesmar/include/shadesmar/concurrency/rw_lock.h \
 ../src/packages/shadesmar/include/shadesmar/memory/allocator.h \
 ../src/packages/shadesmar/include/shadesmar/memory/tmp.h \
 ../src/packages/shadesmar/include/shadesmar/memory/filesystem.h \
 ../src/packages/shadesmar/include/shadesmar/pubsub/subscriber.h
../src/lib.cpp:
../src/lib.h:
/home/ivuser/git/test/shadesmar/node_modules/node-addon-api/napi.h:
/home/ivuser/.cache/node-gyp/12.20.0/include/node/node_api.h:
/home/ivuser/.cache/node-gyp/12.20.0/include/node/js_native_api.h:
/home/ivuser/.cache/node-gyp/12.20.0/include/node/js_native_api_types.h:
/home/ivuser/.cache/node-gyp/12.20.0/include/node/node_api_types.h:
/home/ivuser/git/test/shadesmar/node_modules/node-addon-api/napi-inl.h:
/home/ivuser/git/test/shadesmar/node_modules/node-addon-api/napi-inl.deprecated.h:
/home/ivuser/git/test/shadesmar/node_modules/napi-thread-safe-callback/napi-thread-safe-callback.hpp:
/home/ivuser/git/test/shadesmar/node_modules/napi-thread-safe-callback/napi-thread-safe-callback-impl.hpp:
/home/ivuser/.cache/node-gyp/12.20.0/include/node/uv.h:
/home/ivuser/.cache/node-gyp/12.20.0/include/node/uv/errno.h:
/home/ivuser/.cache/node-gyp/12.20.0/include/node/uv/version.h:
/home/ivuser/.cache/node-gyp/12.20.0/include/node/uv/unix.h:
/home/ivuser/.cache/node-gyp/12.20.0/include/node/uv/threadpool.h:
/home/ivuser/.cache/node-gyp/12.20.0/include/node/uv/linux.h:
../src/packages/shadesmar/include/shadesmar/memory/copier.h:
../src/packages/shadesmar/include/shadesmar/pubsub/publisher.h:
../src/packages/shadesmar/include/shadesmar/pubsub/topic.h:
../src/packages/shadesmar/include/shadesmar/concurrency/scope.h:
../src/packages/shadesmar/include/shadesmar/macros.h:
../src/packages/shadesmar/include/shadesmar/memory/memory.h:
../src/packages/shadesmar/include/shadesmar/concurrency/lockless_set.h:
../src/packages/shadesmar/include/shadesmar/concurrency/robust_lock.h:
../src/packages/shadesmar/include/shadesmar/concurrency/lock.h:
../src/packages/shadesmar/include/shadesmar/concurrency/rw_lock.h:
../src/packages/shadesmar/include/shadesmar/memory/allocator.h:
../src/packages/shadesmar/include/shadesmar/memory/tmp.h:
../src/packages/shadesmar/include/shadesmar/memory/filesystem.h:
../src/packages/shadesmar/include/shadesmar/pubsub/subscriber.h:
