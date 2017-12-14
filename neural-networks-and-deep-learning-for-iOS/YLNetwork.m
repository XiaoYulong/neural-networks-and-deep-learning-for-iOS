//
//  YLNetwork.m
//  neural-networks-and-deep-learning-for-iOS
//
//  Created by yulong on 14/12/2017.
//  Copyright © 2017 yulong. All rights reserved.
//

#import "YLNetwork.h"

@interface YLNetwork()
@property (nonatomic) NSUInteger numbersOfLayers;
@property (nonatomic, strong) NSArray *networkStructure;
@property (nonatomic, strong) NSArray *biases;
@property (nonatomic, strong) NSArray *weights;
@end

@implementation YLNetwork
- (instancetype)initWithNetworkStructure:(NSArray *)networkStructure
{
    self = [super init];
    if (self)
    {
        _numbersOfLayers = networkStructure.count;
        _networkStructure = networkStructure;
        
        NSMutableArray *tempBiases = [NSMutableArray arrayWithCapacity:_numbersOfLayers - 1];
        for (NSUInteger i = 1; i < _numbersOfLayers; ++i)
        {
            NSNumber *eachLayerSize = _networkStructure[i];
            NSMutableArray *biasesOfEachLayer = [[NSMutableArray alloc] initWithCapacity:[eachLayerSize unsignedIntegerValue]];
            
            for (NSUInteger j = 0; j < [eachLayerSize unsignedIntegerValue]; ++j)
            {
                //TODO: 
                double singleBiases = arc4random() ;
                [biasesOfEachLayer addObject:[NSNumber numberWithDouble:singleBiases]];
            }
            
            [tempBiases addObject:biasesOfEachLayer];
        }
        _biases = [tempBiases copy];
        
    }
    
    return self;
}
@end
