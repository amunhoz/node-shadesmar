{
    "targets": [
        {
            "target_name": "shadesmar",
            "cflags_cc": [			
				"-std=c++17",
				"-O2",
				"-Wall",
				"-fexceptions"
			],
            "sources": [				
				"src/lib.cpp"		
			],
			"include_dirs": [
				"<!@(node -p \"require('node-addon-api').include\")",
				"<!@(node -p \"require('napi-thread-safe-callback').include\")",
				"src/packages/shadesmar/include",
				"src/"
							
			],
			"link_settings": {
				"libraries": [
					"-lpthread",
					"-lstdc++fs",
					"-lrt"
				]
			},
        }
    ]
}
