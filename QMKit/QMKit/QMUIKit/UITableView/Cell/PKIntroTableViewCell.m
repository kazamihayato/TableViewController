//
//  PKIntroTableViewCell.m
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import "PKIntroTableViewCell.h"

@implementation PKIntroDataModel

@end

#define CELL_HEIGHT 35  * displayScale

#define TAG_SHEET_CELL_TITLE            10000
#define TAG_SHEET_CELL_INFOLABEL        10001
#define TAG_SHEET_CELL_INDICATOR        10002

@implementation PKIntroTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setBackgroundColor:DEFAULT_WHITE];

    }
    return self;
}

-(void)setObject:(id)object
{
    if (self.item != object && object != nil) {
        self.item = object;
        self.item.cellInstance = self;
    }
    PKIntroDataModel* dataModel=(PKIntroDataModel*)self.item;
    
    
    PKLabel *title = (PKLabel*)[self.contentView viewWithTag:TAG_SHEET_CELL_TITLE];
    if (!title) {
        title=[[PKLabel alloc] initWithFrame:CGRectMake(15*displayScale, (CELL_HEIGHT-20.0f)/2, 90, 20)
                                        text:dataModel.title
                                   textColor:DARK_GRAY
                                        font:14+fontScale
                                      isBold:NO
                               textAlignment:NSTextAlignmentLeft];
        title.tag =TAG_SHEET_CELL_TITLE;
        [self.contentView addSubview:title];
        
    }
//    else
//    {
//        title.text=dataModel.title;
//    }
    
    PKLabel*infoLabel=(PKLabel*)[self.contentView viewWithTag:TAG_SHEET_CELL_INFOLABEL];
    if (!infoLabel && dataModel.value)
    {
        infoLabel=[[PKLabel alloc] initWithFrame:CGRectMake(MAX_X(title)+5.0f, (CELL_HEIGHT - 30.0f)/2, SCREEN_WIDTH-MAX_X(title)-5-40*displayScale, 30)
                                            text:dataModel.value
                                       textColor:dataModel.valueColor?dataModel.valueColor:DARK_GRAY
                                            font:14+fontScale
                                          isBold:NO
                                   textAlignment:NSTextAlignmentLeft];
        infoLabel.tag=TAG_SHEET_CELL_INFOLABEL;
        [self.contentView addSubview:infoLabel];
    }
    else
    {
        infoLabel.text=dataModel.value;
        infoLabel.textColor = dataModel.valueColor?dataModel.valueColor:DARK_GRAY;
    }
    switch (dataModel.cellStyle) {
        case PKIntroTableViewCellIndicatorStyle:
        {
            UIImageView*indicator=(UIImageView*)[self.contentView viewWithTag:TAG_SHEET_CELL_INDICATOR];
            if (!indicator) {
                indicator=[[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-30*displayScale, (CELL_HEIGHT - 12*displayScale)/2, 7*displayScale, 12*displayScale)];
                indicator.image=[UIImage imageNamed:@"bigIndicator"];
                indicator.tag=TAG_SHEET_CELL_INDICATOR;
                [self.contentView addSubview:indicator];
            }
        }
            break;
            
        default:
            break;
    }
}
+(CGFloat)heightForCell
{
    return CELL_HEIGHT;
}

@end
