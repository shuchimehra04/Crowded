//
//  MapView.m
//  Crowded
//
//  Created by shuchi mehra on 8/8/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import "MapView.h"

@implementation MapView

-(id)init
{

    self = [super init];
    if (self) {
        self.mapView = [[MKMapView alloc] init];
        self.mapView.delegate = self;
        [self.mapView setMapType: MKMapTypeStandard];
        [self addSubview: self.mapView];
        
        
        MKCoordinateRegion newRegion;
        // configure region...
        [self.mapView setRegion:newRegion animated:YES];
        
        CLLocationCoordinate2D coordinate;
        //configure coordinate...
        
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
        [annotation setCoordinate:coordinate];
        [annotation setTitle:@"TEST"];
        [self.mapView addAnnotation:annotation];

        // Init code
            }
    return self;
    
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
