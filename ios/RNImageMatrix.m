
#import "RNImageMatrix.h"
#import <React/RCTLog.h>
#import <UIKit/UIKit.h>

@implementation RNImageMatrix

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()
RCT_EXPORT_METHOD(
        getImageUrl:(NSString *)imageUrl
        rows:(NSInteger *)rows
        columns:(NSInteger *)columns
        resolver: (RCTPromiseResolveBlock)resolve
        rejecter:(RCTPromiseRejectBlock)reject) {
    RCTLogInfo(@"Image URL %@ at", imageUrl);
    NSLog(@"sequence = %i", rows);
    NSURL* fileURL = [[NSURL alloc] initFileURLWithPath:imageUrl];
    UIImage *image = [UIImage imageWithContentsOfFile:imageUrl];
    
    NSMutableArray *images = [self splitImage:image intoGridOfImagesWithRows:rows columns:columns];
    NSMutableArray *imagesPaths = [NSMutableArray new];
    int count = 0;
    for(UIImage *image in images) {
        NSString *imagePath = [[self documentPath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%d.jpg", count]];
        NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
        [imageData writeToFile:imagePath atomically:YES];
        [imagesPaths addObject:imagePath];
        count++;
    }
    resolve(imagesPaths);
}

- (NSString *)documentPath
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
}

- (NSMutableArray *)splitImage:(UIImage *)image intoGridOfImagesWithRows:(NSInteger)numberOfRows columns:(NSInteger)numberOfColumns
{
    CGFloat imageWidth = image.size.width * image.scale;
    CGFloat imageHeight = image.size.height * image.scale;
    CGSize imageSize = CGSizeMake(imageWidth, imageHeight);
    
    NSMutableArray *images = [NSMutableArray new];
    
    
    CGFloat xPos = 0.0, yPos = 0.0;
    CGFloat width = imageSize.width / numberOfColumns;
    CGFloat height = imageSize.height / numberOfRows;
    
    for (int y = 0; y < numberOfRows; y++) {
        xPos = 0.0;
        for (int x = 0; x < numberOfColumns; x++) {
            
            CGRect rect = CGRectMake(xPos, yPos, width, height);
            CGImageRef cImage = CGImageCreateWithImageInRect([image CGImage],  rect);
            
            UIImage *dImage = [[UIImage alloc] initWithCGImage:cImage];
            [images addObject:dImage];
            xPos += width;
        }
        yPos += height;
    }
    
    return images;
}
@end
  