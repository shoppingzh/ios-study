//
//  MSecClient.h
//

#ifndef MSecClient_h
#define MSecClient_h

@interface MSecClient : NSObject

+ (void)initialize;
+ (void)initialize:(NSString *_Nonnull)dataCollectServer;
+ (void)setUserId:(NSString *_Nullable)uid;
+ (void)connectWebView:(id _Nonnull)webview withDelegate:(id _Nullable )delegate;
+ (NSString *)getUrlWithToken:(NSString *)url;


+ (instancetype _Nullable )getClient:(NSString *_Nonnull)url;
- (NSString *_Nullable)getRequestHeader;
- (NSString *_Nullable)getRequestHeader:(int)flag;
- (NSString *_Nonnull)getHeaderKey;
- (int)onResponseHeader:(NSString *_Nullable)header;
- (NSData *_Nullable)encryptRequestBody:(NSData *_Nullable)data;
- (NSData *_Nullable)decryptResponseBody:(NSData *_Nullable)data;
+ (void)logDetail:(Boolean)state;


//for wrapper
+ (void)Hook:(Class _Nonnull)hclass;
+ (void)protectBody;
+ (void)protectLocalHtml:(Class _Nonnull)hclass;
+ (void)protectLocalHtml;
+ (void)initializeAllInOneStep;
+ (void)initializeAllInOneStep:(NSString *_Nonnull)dataCollectServer;




@end


#endif /* MSecClient_h */
