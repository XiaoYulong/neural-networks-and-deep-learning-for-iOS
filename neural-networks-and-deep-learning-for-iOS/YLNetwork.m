//
//  YLNetwork.m
//  neural-networks-and-deep-learning-for-iOS
//
//  Created by yulong on 14/12/2017.
//  Copyright © 2017 yulong. All rights reserved.
//

#import "YLNetwork.h"
#include <stdlib.h>
#include <stdio.h>
#define PI 3.141592654
#define ARC4RANDOM_MAX      0x100000000
double gaussrand()
{
    static double U, V;
    static int phase = 0;
    double Z;
    
    if(phase == 0)
    {
        U = arc4random() / (ARC4RANDOM_MAX + 1.0);
        V = arc4random() / (ARC4RANDOM_MAX + 1.0);
        Z = sqrt(-2.0 * log(U)) * sin(2.0 * PI * V);
    }
    else
    {
        Z = sqrt(-2.0 * log(U)) * cos(2.0 * PI * V);
    }
    
    phase = 1 - phase;
    return Z;
}

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
                double singleBiases = gaussrand();
                [biasesOfEachLayer addObject:[NSNumber numberWithDouble:singleBiases]];
            }
            
            [tempBiases addObject:biasesOfEachLayer];
        }
        _biases = [tempBiases copy];
        
        NSMutableArray *tempWeights = [NSMutableArray arrayWithCapacity:_numbersOfLayers - 1];
        for (NSUInteger i = 1; i < _numbersOfLayers; ++i)
        {
            NSUInteger previousLayerSize = [_networkStructure[i - 1] unsignedIntegerValue];
            NSUInteger currentLayerSize = [_networkStructure[i] unsignedIntegerValue];
            NSMutableArray *weightsOfEachlayer = [NSMutableArray arrayWithCapacity:currentLayerSize];
            
            for (NSUInteger j = 0; j < currentLayerSize; ++j)
            {
                NSMutableArray *weightsOfEachNeuron = [NSMutableArray arrayWithCapacity:previousLayerSize];
                for (NSUInteger k = 0; k < previousLayerSize; ++k)
                {
                    [weightsOfEachNeuron addObject:@(gaussrand())];
                }
                [weightsOfEachlayer addObject:weightsOfEachNeuron];
            }
            [tempWeights addObject:weightsOfEachlayer];
            
        }
        _weights = [tempWeights copy];
    }
    
    return self;
}
@end
