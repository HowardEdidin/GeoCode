#import <Foundation/Foundation.h>

#import "TMBGoogle.h"
#import "TMBChoreography.h"
#import "TMBTembooSession.h"

@interface TembooTask : NSObject <TMBChoreographyDelegate>

@property (nonatomic, strong) UILabel *label;

-(id)initWithLabel:(UILabel*)label;
-(void)runTask;
-(void)choreographyDidFailWithError:(NSError*)error;
-(void)choreographyDidFinishExecuting:(TMBGoogle_Geocoding_GeocodeByAddress_ResultSet*)result;

@end