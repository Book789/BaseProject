//
//  SSL_Use.m
//  BaseProject
//
//  Created by Book on 2023/1/14.
//

#import "SSL_Use.h"
#import "RSAObjC.h"
#import "LH_Openssl.h"

@implementation SSL_Use

static NSData *base64_decode(NSString *str){
    NSData *data = [[NSData alloc] initWithBase64EncodedString:str options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return data;

}
static NSString *base64_encode_data(NSData *data){
    data = [data base64EncodedDataWithOptions:0];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return ret;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//私钥:
//    MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDB/Kt1tIisXRVcArbp4FcYAb9EFv/l5J88SK5AtO+zpeLSITb5s9eG7yr+LNl+nlmWE3jclEw65vjLsxDKZniExbGCq5Gc5O5Q+u4WDFpDHVdzW6xwJ0U1VLkkxpQGVMz3PaNbkVutfKk9tbYqmtic46pCMQgFkLeEJYOoDfsoPNlQRsBjZ+tzf09A4Kec9hnJ5SvB88vM2XNj8gUaxaY5AM0Jzunx/b0k116i+6xxpu9JRDkHpn9BlK9+nZkHagtuUO3kP3eFmqy5f0reVCTY49w8zTkyiFHveSQ8qgqeOzejjyUjQYj387wTv92idwS7Ae4pEuKVPhl4nJaIxbxDAgMBAAECggEBALGLXip2t3h6IWh7G4pmx4+zWakqG7//RTZZlxKmB5U2yKhluflEfoiDMag8yDs5FulinQXVvQdUCnX1R/LXYoqyncro2HbumKgJYgtP9vTiT/3G88YaSx+KkYF1NlmtF4NaKL9QBMZ+CC/wte+8lXDSdivq0Fq3nx8VbrBLS4oAvlLiZAq/50cp5MQVn1SpAUxOFm2BqinY2w+Ihm8Vl1Ig/AUgAIlsHshckm3K9X5DFPx4lS5Eh1q97b+fSqUdLv8Fr6jrr+zTxbw50yoN/SVEeyh3cdqAf3zM2aj9jw2y29CFFz/okLNf/sOfJGgWvrH8IFHHuzD97bOvLFhnbIECgYEA7meh3yCZedIz7fpfNB2Xa/YXkUATeAFnmsh2wHw4xnWuP8ModAhDieBWknxkTya8i8rc+m22YK6uhwGn6G3FnyIsAZoKmZ9F/kQWZwFq+ZOEakqnXCe8UGHKepr4limWWnajSYeDnResId4UZfDEv1phvaskkeFqWFxBBQDnSeECgYEA0E3RJKNxBuSG1TFlDgNZs+hpUhuMLpAvJrwXJGO0J49AkOubNjQbN+aIwhF8D6dJ39aJynD1WFJ/sPHhRVYdlL
//    RSA * _privateKey;
//    RSA * _publicKey;
//    NSString * _privateKeyBase64;
//    NSString * _publicKeyBase64;
//
//    while (1) {
//        if ([LPXRSATool generateRSAKeyPairWithKeySize:2048 publicKey:&_publicKey privateKey:&_privateKey]) {
//
//            _publicKeyBase64 = [LPXRSATool base64EncodedStringKey:_publicKey isPubkey:YES];
//            _privateKeyBase64 = [LPXRSATool base64EncodedStringKey:_privateKey isPubkey:NO];
//            NSLog(@"\n私钥:\n%@",_privateKeyBase64);
//            NSLog(@"\n公钥:\n%@",_publicKeyBase64);
//            RSA * publicKey11 = [LPXRSATool rsaFromBase64:_publicKeyBase64 isPubkey:YES];
//            if (_privateKeyBase64 && _publicKeyBase64) {
////                [ud setObject:_publicKeyBase64 forKey:cBase64_PubKey];
////                [ud setObject:_privateKeyBase64 forKey:cBase64_PriKey];
//
//                break;
//            }
//        }
//    }
    
    RSA * publicKey11 = [LH_Openssl rsaFromBase64:@"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzqz07rSKKcmXP7swCRUEaTnvw1mH9uqo+z2XBcXWvJyx+iwvAQwYxCj3wlWktirCY05NVUatyGzlX/2kvfHv3TKzPib10lbJyDy8N8Raiqp3H8tyQHUH1tWSPuX+Djo35PS7OoZFDCTaUt0Roj76TJuG7IF9BbGX7gRGXE0o4JiCSTTxV2DSXO/yBEE0vOX0B2tHP3d+YaBYH9rJyZArqmAOnGVbI+/5vfxnrwy0KCIZAYkZXRtxBCVq8fAeKDjWmJqOBmGMU4b+SsVtIwl9lU8RBloRw4OOORzkCm7wiH9TLsR5cOOsakiWRc1Q38Aq8JLopf7U84iVNgEed768rQIDAQAB" isPubkey:YES];
    
    RSA * publicKey22 = [LH_Openssl rsaFromBase64:@"MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDOrPTutIopyZc/uzAJFQRpOe/DWYf26qj7PZcFxda8nLH6LC8BDBjEKPfCVaS2KsJjTk1VRq3IbOVf/aS98e/dMrM+JvXSVsnIPLw3xFqKqncfy3JAdQfW1ZI+5f4OOjfk9Ls6hkUMJNpS3RGiPvpMm4bsgX0FsZfuBEZcTSjgmIJJNPFXYNJc7/IEQTS85fQHa0c/d35hoFgf2snJkCuqYA6cZVsj7/m9/GevDLQoIhkBiRldG3EEJWrx8B4oONaYmo4GYYxThv5KxW0jCX2VTxEGWhHDg445HOQKbvCIf1MuxHlw46xqSJZFzVDfwCrwkuil/tTziJU2AR53vrytAgMBAAECggEAeaYmGSbdOBF3XETi1kWvrfwzGynktLqUsiUjcntrlOMqgxVkqVokbbmrc5CTfcIXXvpk3G/YtGMcc+7I/CCezfUcudWW1bLN3HWbV7vUi1AhA+7tFfGMprBY/3rCmj88TSCb36vOkoJSm3mR+ozVKShWN3lUTHim86tCeuvTxrYOwu8ad3sp5Mfh/JuknyB3dkrUkQQdFKACMDHGA8KiFMztpbU3Y/wGh98lrFZWFjKAAfCdC3vm8cPSyLxban93FVht2JQXblooJqNG1WKcF4NC5MCOhbNMrMPvJPxnMUr2wQMRUHFRkAYsx3fdMSJTWjZUGYJIay8tPd3dPrhO4QKBgQDxz6i3O2iSg2Y5+CV3WtKueww4LyeeKumSbm6qhA/JoJOG9JpbHpfwM0DpPSNn2kX7v2z34Aa5HCG5M+nXSFvfnuqficwkTLIFEAgIeTB96YBgwR/6j3f4xjlq9thAWfLDvcfb4CdDO0+hvofkuNH5UAI9sXDSLLsUXqMw7HRJSQKBgQDazYM+yLffpgcMoBAvKoVtcQOYuw5XLF+ybRnDRGiop1B6mqCQ7rX/u+Wr4Z9FyJweLzY9FQrGMKo2Nv+5x0hZ+o9RpeVQwaZjoD22QrHeAPT8ElDg17h0FklZaig5SSPiOxtabY1WtJXXbhhPcWM+bOBKHiEe86QfU00oLEscRQKBgQCA0H6wHZW3dwgeGXLcAiX5jNMVmwkf2PxUZT/O1ksSvdfZLLSNld6atrL9jPQvfreJRJBn+4+ZTMMqRd1sMb+/gIi8NEvrim/LAp9E5EpQyPL6l+bRM1xVykMMGDNbFI+edprhJqfDyPTC1RzPWyWACn8nHj9btzhxwXhtt4i7AQKBgHGaYLl5Z5a0UlaoyJ5kmnBPTEnBXVm/jVRLtyOeYiSm8m8l15ZIirBj84SBmbuWxBAb/TJLuZNbcxTBC5d+s78cC8udselzEhwJ9+Co0kbtAkXakKmc94U2iRDmwEm2Au6UN8iEtuy8yEvZOsAMpDWmO/HfoNy8LYuiKZ5hGQJtAoGAKPt9SAIpkNc+QnuI5GNTlszlxcJHL+E9T9vRurZ3iR84B/+EYSG5ujcMNeHyFkurGBa3mEeN22dI1x9/MSTMU/VxSQ88ClmAN4dqP+p4gbskcRIukWARK/TW9snGpG2zd94IBms4mPuwI25mv58RmVkXMnD1PDlvY8s+UWH5/QI=" isPubkey:NO];

    
  
//
//
    NSData * data = [LH_Openssl decryptWithPrivateKey:publicKey22 cipherData:base64_decode(@"dXfle777XsoQqwC4OXdiPLw1q92/wBM6vd+KsWtMdian7pbd4NGL6lgBE9iFM8/9kBHBSojSTZXAkRahs4RkGL8B7gODMCcKP6wy9ri0gKWcd+5/tdMXOxrwYiAXItquiGlbXF9niJoqR1/m6KpNCcWnZxG3aI1wZyeH4+NtZwgRViwo3315tiGAYpnQeXI6KuMcnp/n/D8Lu2+Joa65X4F5+qfAOWtH3hPCfx5mbleLmIZHQ2hWAPSusY6lD2bqWwP/2pCWftLN4ecPZ1/s+a1innIr+ATqIadIXKMXDJAkCvd63s3Tm/rTDHXXh2rk3Mak0cxdvyQ6sJhwKSt/mA==") padding:Rsa_PKCS1_PADDING];
//    [RSAObjC decrypt:@"jIxL/UJinYkMkYD8YynSZk3X8v/JdPg4itVecl/ngGA8/Q8bpJOuuGw/SeFKvVzHv3ZX3xaXizHIx+APsLVjW6gwMzwr3ufyphi0LhMSD0SaxNwf1ddZVTTeNz7nHYfeeauWbPCw+90piN/45GCBU0U/mZPDw9rovAK7C6m3b/VJ82aPNYqIc+tFM5nN2VmXS2VrxRL4MmcOgtd4bZojvy1j+MfnM6RvZOc+SxL29bFF6qtVnvLj2WwoVFw6R4pnEC0eQmKexv1Gv5DGD+p4w6jF+ls0LK6z0U2/aSbInysvriJFtSPXf5GmnumZHDhwGVFTd3BRF+z2E6ZKFmv8FQ==" PrivateKey:@"MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDB/Kt1tIisXRVcArbp4FcYAb9EFv/l5J88SK5AtO+zpeLSITb5s9eG7yr+LNl+nlmWE3jclEw65vjLsxDKZniExbGCq5Gc5O5Q+u4WDFpDHVdzW6xwJ0U1VLkkxpQGVMz3PaNbkVutfKk9tbYqmtic46pCMQgFkLeEJYOoDfsoPNlQRsBjZ+tzf09A4Kec9hnJ5SvB88vM2XNj8gUaxaY5AM0Jzunx/b0k116i+6xxpu9JRDkHpn9BlK9+nZkHagtuUO3kP3eFmqy5f0reVCTY49w8zTkyiFHveSQ8qgqeOzejjyUjQYj387wTv92idwS7Ae4pEuKVPhl4nJaIxbxDAgMBAAECggEBALGLXip2t3h6IWh7G4pmx4+zWakqG7//RTZZlxKmB5U2yKhluflEfoiDMag8yDs5FulinQXVvQdUCnX1R/LXYoqyncro2HbumKgJYgtP9vTiT/3G88YaSx+KkYF1NlmtF4NaKL9QBMZ+CC/wte+8lXDSdivq0Fq3nx8VbrBLS4oAvlLiZAq/50cp5MQVn1SpAUxOFm2BqinY2w+Ihm8Vl1Ig/AUgAIlsHshckm3K9X5DFPx4lS5Eh1q97b+fSqUdLv8Fr6jrr+zTxbw50yoN/SVEeyh3cdqAf3zM2aj9jw2y29CFFz/okLNf/sOfJGgWvrH8IFHHuzD97bOvLFhnbIECgYEA7meh3yCZedIz7fpfNB2Xa/YXkUATeAFnmsh2wHw4xnWuP8ModAhDieBWknxkTya8i8rc+m22YK6uhwGn6G3FnyIsAZoKmZ9F/kQWZwFq+ZOEakqnXCe8UGHKepr4limWWnajSYeDnResId4UZfDEv1phvaskkeFqWFxBBQDnSeECgYEA0E3RJKNxBuSG1TFlDgNZs+hpUhuMLpAvJrwXJGO0J49AkOubNjQbN+aIwhF8D6dJ39aJynD1WFJ/sPHhRVYdlL"];
    NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    
    NSString * result = [RSAObjC decrypt:@"dXfle777XsoQqwC4OXdiPLw1q92/wBM6vd+KsWtMdian7pbd4NGL6lgBE9iFM8/9kBHBSojSTZXAkRahs4RkGL8B7gODMCcKP6wy9ri0gKWcd+5/tdMXOxrwYiAXItquiGlbXF9niJoqR1/m6KpNCcWnZxG3aI1wZyeH4+NtZwgRViwo3315tiGAYpnQeXI6KuMcnp/n/D8Lu2+Joa65X4F5+qfAOWtH3hPCfx5mbleLmIZHQ2hWAPSusY6lD2bqWwP/2pCWftLN4ecPZ1/s+a1innIr+ATqIadIXKMXDJAkCvd63s3Tm/rTDHXXh2rk3Mak0cxdvyQ6sJhwKSt/mA==" PrivateKey:@"MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDOrPTutIopyZc/uzAJFQRpOe/DWYf26qj7PZcFxda8nLH6LC8BDBjEKPfCVaS2KsJjTk1VRq3IbOVf/aS98e/dMrM+JvXSVsnIPLw3xFqKqncfy3JAdQfW1ZI+5f4OOjfk9Ls6hkUMJNpS3RGiPvpMm4bsgX0FsZfuBEZcTSjgmIJJNPFXYNJc7/IEQTS85fQHa0c/d35hoFgf2snJkCuqYA6cZVsj7/m9/GevDLQoIhkBiRldG3EEJWrx8B4oONaYmo4GYYxThv5KxW0jCX2VTxEGWhHDg445HOQKbvCIf1MuxHlw46xqSJZFzVDfwCrwkuil/tTziJU2AR53vrytAgMBAAECggEAeaYmGSbdOBF3XETi1kWvrfwzGynktLqUsiUjcntrlOMqgxVkqVokbbmrc5CTfcIXXvpk3G/YtGMcc+7I/CCezfUcudWW1bLN3HWbV7vUi1AhA+7tFfGMprBY/3rCmj88TSCb36vOkoJSm3mR+ozVKShWN3lUTHim86tCeuvTxrYOwu8ad3sp5Mfh/JuknyB3dkrUkQQdFKACMDHGA8KiFMztpbU3Y/wGh98lrFZWFjKAAfCdC3vm8cPSyLxban93FVht2JQXblooJqNG1WKcF4NC5MCOhbNMrMPvJPxnMUr2wQMRUHFRkAYsx3fdMSJTWjZUGYJIay8tPd3dPrhO4QKBgQDxz6i3O2iSg2Y5+CV3WtKueww4LyeeKumSbm6qhA/JoJOG9JpbHpfwM0DpPSNn2kX7v2z34Aa5HCG5M+nXSFvfnuqficwkTLIFEAgIeTB96YBgwR/6j3f4xjlq9thAWfLDvcfb4CdDO0+hvofkuNH5UAI9sXDSLLsUXqMw7HRJSQKBgQDazYM+yLffpgcMoBAvKoVtcQOYuw5XLF+ybRnDRGiop1B6mqCQ7rX/u+Wr4Z9FyJweLzY9FQrGMKo2Nv+5x0hZ+o9RpeVQwaZjoD22QrHeAPT8ElDg17h0FklZaig5SSPiOxtabY1WtJXXbhhPcWM+bOBKHiEe86QfU00oLEscRQKBgQCA0H6wHZW3dwgeGXLcAiX5jNMVmwkf2PxUZT/O1ksSvdfZLLSNld6atrL9jPQvfreJRJBn+4+ZTMMqRd1sMb+/gIi8NEvrim/LAp9E5EpQyPL6l+bRM1xVykMMGDNbFI+edprhJqfDyPTC1RzPWyWACn8nHj9btzhxwXhtt4i7AQKBgHGaYLl5Z5a0UlaoyJ5kmnBPTEnBXVm/jVRLtyOeYiSm8m8l15ZIirBj84SBmbuWxBAb/TJLuZNbcxTBC5d+s78cC8udselzEhwJ9+Co0kbtAkXakKmc94U2iRDmwEm2Au6UN8iEtuy8yEvZOsAMpDWmO/HfoNy8LYuiKZ5hGQJtAoGAKPt9SAIpkNc+QnuI5GNTlszlxcJHL+E9T9vRurZ3iR84B/+EYSG5ujcMNeHyFkurGBa3mEeN22dI1x9/MSTMU/VxSQ88ClmAN4dqP+p4gbskcRIukWARK/TW9snGpG2zd94IBms4mPuwI25mv58RmVkXMnD1PDlvY8s+UWH5/QI="];
    NSLog(@"result:%@",result);

}

@end
