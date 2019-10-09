#ifndef MOBILE_CORELIB_MSEC_H_
#define MOBILE_CORELIB_MSEC_H_

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif





extern const int MSEC_FLAG_NATIVE;
extern const int MSEC_FLAG_WEBVIEW;
extern const int MSEC_FLAG_ENCRYPTED;
extern const int MSEC_FLAG_LOCAL_WEBVIEW;
extern const int MSEC_FLAG_CORDOVA_PLUGIN;
extern const int MSEC_FLAG_URL;

int getClientHandle(const char *url);
int getRequestHeader(int handle, int flag, const char *url, char *header, size_t *len);
int onResponseHeader(int handle, const char *header, const char *url);
const char *getHeaderKey(void);
void setUserId(const char *userId, size_t len);

    

    
    
#ifdef __cplusplus
}
#endif



#endif
