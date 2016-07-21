//
//  PKWLoginViewController.h
//  PKW
//
//  Created by peikua on 16/5/23.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "PKTableViewController.h"

@interface PKWLoginModel : PKDataModel

@property(nonatomic,strong)NSString * account;
@property(nonatomic,strong)NSString * password;
@property(nonatomic,strong)NSString * phomeNumber;
@property(nonatomic,strong)NSString * vcode;


- (NSDictionary*)accountLoginDictionaryValue;

- (NSDictionary*)vcodeLoginDictionaryValue;

@end



@interface PKWLoginViewController : PKTableViewController

@end
