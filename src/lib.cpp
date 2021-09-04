#include "lib.h"
//#include <shadesmar/memory/copier.h>
//#include <shadesmar/pubsub/publisher.h>
//#include <shadesmar/pubsub/subscriber.h>

using namespace Napi;
using namespace std::placeholders;

Napi::FunctionReference NativeAddon::constructor;

//************************************************************************************
//************************************************************************************
//initiate addon
//************************************************************************************
//************************************************************************************
Napi::Object NativeAddon::Init(Napi::Env env, Napi::Object exports) {
  Napi::HandleScope scope(env);

  Napi::Function func =
      DefineClass(env,
                  "shadesmar",
                  {
                        InstanceMethod("publish", &NativeAddon::Publish),
                        InstanceMethod("subscribe", &NativeAddon::Subscribe),                   
                        InstanceMethod("unsubscribe", &NativeAddon::Unsubscribe),        
                        InstanceMethod("closePublish", &NativeAddon::ClosePublish),   
                        InstanceMethod("onMessage", &NativeAddon::OnMessage),
                        InstanceMethod("close", &NativeAddon::Close),
                        InstanceMethod("spin", &NativeAddon::Spin)
                   });

  constructor = Napi::Persistent(func);
  constructor.SuppressDestruct();  
  exports.Set("shadesmar", func);
  return exports;
}

// Initialize native add-on
Napi::Object Init (Napi::Env env, Napi::Object exports) {
    NativeAddon::Init(env, exports);    
    return exports;
}
// Register and initialize native add-on
NODE_API_MODULE(addon, Init)



//************************************************************************************
//************************************************************************************
//************************************************************************************
//Class methods
//************************************************************************************
//************************************************************************************
//************************************************************************************
NativeAddon::NativeAddon(const Napi::CallbackInfo& info) : ObjectWrap(info) {
   //initialize maps    
   
   /* 
    //do i need this???
    subscriptions = std::make_shared<   std::map<string, shm::pubsub::Subscriber>    >
                                    (
                                      std::initializer_list<std::map<string, shm::pubsub::Subscriber>::value_type>{}
                                    );
    
    publishers = std::make_shared<   std::map<string, shm::pubsub::Publisher*>    >
                                    (
                                      std::initializer_list<std::map<string, shm::pubsub::Publisher*>::value_type>{}
                                    );
                                    */
                                    
    /*           

    //not working, how to spin in a separeted thread?
    std::thread nativeThread = std::thread( [this] {          
        while (true) {
            for (auto &item : subscriptions) {                 
               item.second.spin_once();
            } 
            std::this_thread::sleep_for(std::chrono::milliseconds(1));        
            if (CLOSED) break;
        }        
    });    

    */

}

Napi::Value NativeAddon::Publish(const Napi::CallbackInfo& info) {
    Napi::Env env = info.Env();
    string topic = info[0].As<Napi::String>().Utf8Value();
    
    if (!publishers.count(topic)) {        
        //shm::memory::DefaultCopier *cpy = new shm::memory::DefaultCopier(); //is this the best way to keep cpy in memory?
        shm::pubsub::Publisher pub = shm::pubsub::Publisher(topic, nullptr);                
        Napi::Buffer<char> buffer = info[1].As<Napi::Buffer<char>>();         
        pub.publish(reinterpret_cast<void *>(buffer.Data()), buffer.Length());  //do i need to treat buffer.Data() in any way?
        publishers.insert({topic, std::move(pub)});
    } else {
       Napi::Buffer<char> buff = info[1].As<Napi::Buffer<char>>();             
       publishers.at(topic).publish((char *)buff.Data(), (int) buff.Length());        
    }        
    
    return Napi::Boolean::New(env, true);
}

Napi::Value NativeAddon::Subscribe(const Napi::CallbackInfo& info) {
    Napi::Env env = info.Env();
    string topic = info[0].As<Napi::String>().Utf8Value();
    
    if (subscriptions.count(topic)) {
        return Napi::Boolean::New(env, false);
    }        
    auto callback = [&](shm::memory::Memblock *msg) {
        if (onMessageFunc){                        
            onMessageFunc->call([msg](Napi::Env env, std::vector<napi_value> &args) {                
                Napi::Object payload = Napi::Object::New(env);                         
                char * buff = reinterpret_cast<char *>(msg->ptr);   //BUG: receive wrong data               
                args = {Napi::Buffer<char>::Copy(env, buff, (int) msg->size)};                
            });
        }        
    };
    //shm::memory::DefaultCopier cpy;
    shm::pubsub::Subscriber sub(topic, callback, nullptr);    
    subscriptions.insert({topic, std::move(sub)});
    return Napi::Boolean::New(env, true);    
}

Napi::Value NativeAddon::Unsubscribe(const Napi::CallbackInfo& info) {
    Napi::Env env = info.Env();    
    string topic = info[0].As<Napi::String>().Utf8Value();
     if (subscriptions.count(topic)) {
        subscriptions.erase(topic);
        return Napi::Boolean::New(env, true);
    }   
    return Napi::Boolean::New(env, false);    
}

Napi::Value NativeAddon::ClosePublish(const Napi::CallbackInfo& info) {
    Napi::Env env = info.Env();    
    string topic = info[0].As<Napi::String>().Utf8Value();
     if (publishers.count(topic)) {
        publishers.erase(topic);
        return Napi::Boolean::New(env, true);
    }   
    return Napi::Boolean::New(env, false);    
}

void NativeAddon::OnMessage(const Napi::CallbackInfo& info) {
     onMessageFunc = std::make_shared<ThreadSafeCallback>(info[0].As<Napi::Function>());
}

void NativeAddon::Close(const Napi::CallbackInfo&) {
    CLOSED = true;
    subscriptions.clear();
    publishers.clear();
}


void NativeAddon::Spin(const Napi::CallbackInfo&) {
    for (auto &item : subscriptions) {          
                std::cerr << "SPIN: "<< item.first << std::endl;           
               item.second.spin_once();
    } 
}




