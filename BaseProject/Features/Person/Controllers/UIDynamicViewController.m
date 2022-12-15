//
//  UIDynamicViewController.m
//  Project
//
//  Created by a on 2022/5/19.
//

#import "UIDynamicViewController.h"

@interface UIDynamicViewController ()<UICollisionBehaviorDelegate>

@property (nonatomic, strong)UIDynamicAnimator* animater;
@end

@implementation UIDynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    NSMutableArray *array  =[NSMutableArray array];
    for (int i = 0; i<5; i++) {
       srand((unsigned int)time(NULL));
       UIView *vienw = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
       vienw.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];  //随机色
       [self.view addSubview:vienw];
       [array addObject:vienw];
       
       /*
       给每个物理元素(vienw)添加一个不同角度的推力
       */
       UIPushBehavior *gravityBehavior = [[UIPushBehavior alloc]initWithItems:@[vienw] mode:UIPushBehaviorModeInstantaneous];
       //创建一个推力
       //[gravityBehavior addItem:vienw];
       gravityBehavior.angle = i *0.15;  //设置推力的角度
       //加速度
       gravityBehavior.magnitude = 0.2; //加速度，越大力越大
       gravityBehavior.active = YES;  //激活力的作用
       [self.animater  addBehavior:gravityBehavior];//加入仿真器
       
   }

   UIDynamicItemBehavior * itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:array];    //将所有物理元素添加动力元素行为
   itemBehavior.elasticity = 0.9;     //设置弹性越大弹的越猛（笔者试了几次，发现1是原来的力气反弹，比1大会弹回去加力，比1小会衰减）
   itemBehavior.friction = 0;       // 磨擦力
   itemBehavior.density = 0.1;      //密度，，密度*体积等于质量 物理元素越大密度越大，越难推动
   itemBehavior.resistance = 0;   // 抗阻力 0~CGFLOAT_MAX ，阻碍原有所加注的行为（如本来是重力自由落体行为，则阻碍其下落，阻碍程度根据其值来决定）
   itemBehavior.allowsRotation = YES;//是否允许旋转
   [self.animater addBehavior:itemBehavior];

   /*
       添加碰撞行为
   */

   UICollisionBehavior *cont = [[UICollisionBehavior alloc]initWithItems:array];
   cont.collisionDelegate = self;//(如果需要截获碰撞发生时的事件的话可以使用)
   cont.collisionMode = UICollisionBehaviorModeEverything;
   //枚举：碰撞所有物体（包括边界 和 物理元素：该物理元素必须是该行为的元素数组，如果给每一个vienw实例化一个碰撞行为的话，他们之间是不会发生碰撞的）

   cont.translatesReferenceBoundsIntoBoundary = YES;  //是否设置参照物为边界
   //[cont setTranslatesReferenceBoundsIntoBoundaryWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];   //设置参照物为边界 ,并限制了边界范围;
   // [cont addBoundaryWithIdentifier:@"conditon1" fromPoint:CGPointMake(0, 0) toPoint:CGPointMake(self.view.frame.size.width, self.view.frame.size.height)];设置两个点之间的连线为边界
   [self.animater addBehavior:cont];
}

 
- (UIDynamicAnimator*)animater{
    if (!_animater) {
   //仿真器实例化
       _animater = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];  //参考视图
   }
   return _animater;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
