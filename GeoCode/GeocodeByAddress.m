#import "TembooTask.h"

@implementation TembooTask

-(id)initWithLabel:(UILabel*) label {
	if(self = [super init]){
		self.label = label;
	}
	return self;
}

-(void)runTask {
	self.label.text = @"Triggered! Calling Choreo...";
	
	// Create a Temboo session 
	TMBTembooSession *session = [[TMBTembooSession alloc] initWithAccount:@"accountName" appKeyName:@"myFirstApp" andAppKeyValue:@"abc123xxxxxxxxxxxxxx"];
	
	// Create the Choreo object using your Temboo session
	TMBGoogle_Geocoding_GeocodeByAddress *geocodeByAddressChoreo = [[TMBGoogle_Geocoding_GeocodeByAddress alloc] initWithSession:session];	
	
	// Get Inputs object for the Choreo
	TMBGoogle_Geocoding_GeocodeByAddress_Inputs *geocodeByAddressInputs = [geocodeByAddressChoreo newInputSet];

	// Set inputs

	// Execute Choreo specifying this class as the Choreo delegate
	[geocodeByAddressChoreo executeWithInputs:geocodeByAddressInputs delegate:self];
}

// TMBChoreographyDelegate method implementation - handle Choreo errors
-(void)choreographyDidFailWithError:(NSError*)error {
	self.label.text = @"A Choreo error occurred. Check logs for details.\nhttp://temboo.com/activity/logs";
	// Log error to the console
	NSLog(@"Error - %@", [error userInfo]);
}

// TMBChoreographyDelegate method implementation - Choreo executed successfully
-(void)choreographyDidFinishExecuting:(TMBGoogle_Geocoding_GeocodeByAddress_ResultSet*)result {
	self.label.text = @"Done!";
	// Do something with result...
}

@end