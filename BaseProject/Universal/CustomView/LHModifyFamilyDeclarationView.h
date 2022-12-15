//
//  LHModifyFamilyDeclarationView.h
//
//  Created by dc on 2022/2/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol LHModifyFamilyDeclarationViewDelegate <NSObject>

-(void)saveCompleteDeclaration:(NSString*)declaration;

@end

@interface LHModifyFamilyDeclarationView : UIView

@property(nonatomic,weak) id<LHModifyFamilyDeclarationViewDelegate> delegate;

- (void)nb_dismissViewAction;

@end
NS_ASSUME_NONNULL_END
