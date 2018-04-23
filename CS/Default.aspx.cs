using System;
using DevExpress.Web.ASPxEditors;

public partial class _Default : System.Web.UI.Page {
    protected void showTabs_Init(object sender, EventArgs e) {
        if (!IsCallback && !IsPostBack) {
            ASPxCheckBox cb = (ASPxCheckBox)sender;
            cb.Checked = pageControl.ShowTabs;
        }
    }
    protected void showTabs_CheckedChanged(object sender, EventArgs e) {
        ASPxCheckBox cb = (ASPxCheckBox)sender;
        pageControl.ShowTabs = cb.Checked;
        popupControl.ShowOnPageLoad = false;
    }
}
