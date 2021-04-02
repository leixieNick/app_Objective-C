#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "SEGAppboyHelper.h"
#import "SEGAppboyIntegration.h"
#import "SEGAppboyIntegrationFactory.h"

FOUNDATION_EXPORT double Segment_AppboyVersionNumber;
FOUNDATION_EXPORT const unsigned char Segment_AppboyVersionString[];

