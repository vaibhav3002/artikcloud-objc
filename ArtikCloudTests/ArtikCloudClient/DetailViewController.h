//
//  DetailViewController.h
//  ArtikCloudClient
//
//  Created by Maneesh Sahu-SSI on 3/29/16.
//  Copyright © 2016 Samsung Strategy and Innovation Center. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

