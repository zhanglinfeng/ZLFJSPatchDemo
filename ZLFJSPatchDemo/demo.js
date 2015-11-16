require('UIView, UIColor, UILabel, NSInteger', 'NSString', 'UIAlertView')
defineClass('AppDelegate', {
    // replace the -genView method
    genView: function() {
        var view = self.ORIGgenView();
        view.setBackgroundColor(UIColor.redColor())
        var label = UILabel.alloc().initWithFrame(view.frame());
        label.setText("JSPatch");
        label.setTextAlignment(1);
        view.addSubview(label);
        return view;
    }
});

defineClass('ReplaceFunctionCaseController', {
    nextBody: function() {
        var index = self.index();
        var array1 = self.array1();
            index = index + 1;
        if (index < self.array1().count()) {
            self.setIndex(index);
            self.lb1().setText(self.array1().objectAtIndex(index)) ;
        } else {
            var alertView = require('UIAlertView').alloc().initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles("Alert","已是最后一位", self, "OK", null);
            alertView.show();
        }
    }
})


defineClass("NewFunctionController: UIViewController <UIAlertViewDelegate>", {

    viewDidAppear: function(animated) {
            require('UIAlertView');
            var alert = UIAlertView.alloc().initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles("提示", "显示信息？", self, "是", null);
            alert.setTag(0);
            alert.show();
    },
    //新增方法，参数类型都是 id
    addName: function(idx) {
        require('UIAlertView');
        var alert = UIAlertView.alloc().initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles("提示", idx.toJS() + ' ' + 6 + ' years old', self, "是", null);
        alert.setTag(1);
        alert.show();
            
    },
    //新增delegate方法
    alertView_clickedButtonAtIndex: function(alertView, buttonIndex) {
            if(buttonIndex == 0 && alertView.tag() == 0) {
            self.addName('jack');

            }
    
    }
})


defineClass('MainTableViewController : UITableViewController', {
    tableView_didSelectRowAtIndexPath: function(tableView, indexPath) {
            if (indexPath.row() == 2) {
                var tableViewCtrl = JPTableViewController.alloc().init()
                self.navigationController().pushViewController_animated(tableViewCtrl, YES)
            }
    }
})


defineClass('JPTableViewController : UITableViewController <UIAlertViewDelegate>', {
    //生成数据方法
    dataSource: function() {
        var data = self.getProp('data')
        if (data) return data;
        var data = [];
        for (var i = 0; i < 20; i ++) {
            data.push("cell from js " + i);
        }
        self.setProp_forKey(data, 'data')
        return data;
    },
    numberOfSectionsInTableView: function(tableView) {
        return 1;
    },
    tableView_numberOfRowsInSection: function(tableView, section) {
        return self.dataSource().count();
    },
    tableView_cellForRowAtIndexPath: function(tableView, indexPath) {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if (!cell) {
            cell = require('UITableViewCell').alloc().initWithStyle_reuseIdentifier(0, "cell")
        }
        cell.textLabel().setText(self.dataSource().objectAtIndex(indexPath.row()))
        return cell
    },
    tableView_heightForRowAtIndexPath: function(tableView, indexPath) {
            return 60
    },
    tableView_didSelectRowAtIndexPath: function(tableView, indexPath) {
        var alertView = require('UIAlertView').alloc().initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles("Alert",self.dataSource().objectAtIndex(indexPath.row()), self, "OK", null);
        alertView.show()
    },
    alertView_willDismissWithButtonIndex: function(alertView, idx) {
        console.log('click btn ' + alertView.buttonTitleAtIndex(idx).toJS())
    }
})

