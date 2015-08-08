//
//  MapView.h
//  Crowded
//
//  Created by shuchi mehra on 8/8/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapView.h"
#import <MapKit/MapKit.h>


@interface MapView : UIView<MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end
