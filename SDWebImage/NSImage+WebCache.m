/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "NSImage+WebCache.h"

#if SD_MAC

@implementation NSImage (WebCache)

- (CGImageRef)CGImage {
    NSRect imageRect = NSMakeRect(0, 0, self.size.width, self.size.height);
    CGImageRef cgImage = [self CGImageForProposedRect:&imageRect context:NULL hints:nil];
    return cgImage;
}

- (NSArray<NSImage *> *)images {
    return nil;
}

- (BOOL)isGIF {
    BOOL isGIF = NO;
    for (NSImageRep *rep in self.representations) {
        if ([rep isKindOfClass:[NSBitmapImageRep class]]) {
            NSBitmapImageRep *bitmapRep = (NSBitmapImageRep *)rep;
            NSUInteger frameCount = [[bitmapRep valueForProperty:NSImageFrameCount] unsignedIntegerValue];
            if (frameCount > 1) {
                isGIF = YES;
                break;
            }
        }
    }
    return isGIF;
}

@end

#endif

