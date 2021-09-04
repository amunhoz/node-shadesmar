#ifndef NODELIB_H
#define NODELIB_H

#define NAPI_EXPERIMENTAL
#include <napi.h>
#include <napi-thread-safe-callback.hpp>

#include <thread>
#include <map>
#include <vector>
#include <functional>
#include <future>  
#include <shadesmar/memory/copier.h>
#include <shadesmar/pubsub/publisher.h>
#include <shadesmar/pubsub/subscriber.h>


#include <iostream>

using namespace Napi;
using namespace std;

class NativeAddon : public Napi::ObjectWrap<NativeAddon>
{
public:

    static Napi::Object Init(Napi::Env env, Napi::Object exports);
    NativeAddon(const Napi::CallbackInfo&);    

    typedef struct {	                     
            string topic;
            shm::pubsub::Subscriber * sub;            
                
    } Subscription;

private:    
    bool DEBUG =false;
    bool CLOSED=false;
    static Napi::FunctionReference constructor;
    
    map<string, shm::pubsub::Subscriber> subscriptions;
    map<string, shm::pubsub::Publisher> publishers;

    std::shared_ptr<ThreadSafeCallback> onMessageFunc = nullptr;
    
    Napi::Value Publish(const Napi::CallbackInfo&);
    Napi::Value Subscribe(const Napi::CallbackInfo&);        
    Napi::Value Unsubscribe(const Napi::CallbackInfo&);        
    Napi::Value ClosePublish(const Napi::CallbackInfo&);        
    
    void OnMessage(const Napi::CallbackInfo&);         
    void Close(const Napi::CallbackInfo&);     
    void Spin(const Napi::CallbackInfo&);     
};

#endif

