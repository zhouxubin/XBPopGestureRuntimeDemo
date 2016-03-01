#与QQ,微博一样的pop返回手势  
---  
**	从ios7.0以后系统就自带了一个可以从屏幕边缘滑动从而来实现pop的手势,这个对于屏幕大的iPhone来说是非常方便的,但是系统自带的需要从屏幕边缘才可以触发这个手势,从而pop,本demo优化了系统的pop手势,可以在屏幕的任何地方滑动屏幕来触发pop手势返回!**  
  
---  
###效果图  
![Smaller icon](https://github.com/zhouxubin/XBPopGestureRuntimeDemo/blob/master/popGesture.gif)  
  
---  
**只要在基类导航控制器里做一次性设置就可以了**  
// 这段代码只要执行一次  

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIGestureRecognizer *gesture = self.interactivePopGestureRecognizer;
        gesture.enabled = NO;
        UIView *gestureView = gesture.view;
        NSMutableArray *_targets = [gesture valueForKey:@"_targets"];
        id gestureRecognizerTarget = [_targets firstObject];
        id navigationInteractiveTransition = [gestureRecognizerTarget valueForKey:@"_target"];
        SEL handleNavigationTransition = NSSelectorFromString(@"handleNavigationTransition:");
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:navigationInteractiveTransition action:handleNavigationTransition];
        [gestureView addGestureRecognizer:panGesture];
    });`  

