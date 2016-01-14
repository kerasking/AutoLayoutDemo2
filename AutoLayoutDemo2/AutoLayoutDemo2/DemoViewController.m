//
//  DemoViewController.m
//  AutoLayoutDemo2
//
//  Created by ColeXm on 16/1/13.
//  Copyright © 2016年 ColeXm. All rights reserved.
//

#import "DemoViewController.h"
#import "DemoCell.h"

static NSString *kCellIdentifier = @"DemoCell";


@interface DemoViewController (){

    __weak IBOutlet UITableView *tableViewMain;
    DemoCell *cellTag;
}

@property (nonatomic,copy) NSArray *dataArray;

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [tableViewMain registerNib:[UINib nibWithNibName:kCellIdentifier bundle:nil] forCellReuseIdentifier:kCellIdentifier];
    tableViewMain.tableFooterView = [UIView new];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!cellTag) {
        cellTag = (DemoCell *)[[NSBundle mainBundle] loadNibNamed:kCellIdentifier owner:self options:nil].lastObject;
    }
    
    cellTag.bean = _dataArray[indexPath.row];
    return [cellTag.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height+1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DemoCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.bean = _dataArray[indexPath.row];
    return cell;
}


-(NSArray *)dataArray{

    if (!_dataArray) {
        
        DemoBean *bean1 = [DemoBean new];
        bean1.text1 = @"";
        bean1.text2 = @"ddsadas";
        
        DemoBean *bean2 = [DemoBean new];
        bean2.text1 = @"dashdihafssi";
        bean2.text2 = @"dsad";
        
        DemoBean *bean3 = [DemoBean new];
        bean3.text1 = @"dashdisdofjodsfhoadhsfihsadiofhoadfhiasdhfiopsdjfoasdjfopsajdfojsdofhasi";
        bean3.text2 = @"dsad";
        
        
        DemoBean *bean4 = [DemoBean new];
        bean4.text1 = @"dashdihasi";
        bean4.text2 = @"dsafdshfihdsifohasidofhioasdhfioashfiodshafiohdsiofhsidofhsoaifhioddfhiosdhfiod";
        
        _dataArray = @[bean1,bean2,bean3,bean4];
    }
    
    return _dataArray;
}




@end
