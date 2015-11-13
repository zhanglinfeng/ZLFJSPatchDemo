require('UIView, UIColor, UILabel, NSInteger')
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

