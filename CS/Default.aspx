<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />

    <script type="text/javascript">
        function onButtonClick(s, e) {
            var indexTab = (pageControl.GetActiveTab()).index;

            var tabName = (pageControl.GetActiveTab()).name;
            if (ASPxClientEdit.ValidateGroup('group' + tabName))
                pageControl.SetActiveTab(pageControl.GetTab(indexTab + 1));

        }
        function onFinishClick(s, e) {
            if (ASPxClientEdit.ValidateGroup('groupTabContact')) {
                var str = '<b>Personal Info:</b><br />' + txtFirstName.GetValue() + '<br />' + txtLastName.GetValue() + '<hr />';
                str += '<b>Date Info:</b><br />' + getShortDate(deAnyDate.GetValue().toString()) + '<br />' + cbStates.GetValue() + '<hr />';
                str += '<b>Contact Info:</b><br />' + txtEmail.GetValue();
                popupControl.SetContentHtml(str);
                popupControl.ShowAtElement(pageControl.GetMainElement());
                popupControl.UpdatePositionAtElement(pageControl.GetMainElement());

                var progressBar = ASPxClientControl.GetControlCollection().GetByName("progressBar" + pageControl.GetActiveTabIndex());
                progressBar.SetPosition(100);
                updateLastTabContent(true);
            }
        }

        function updateLastTabContent(isVisible) {
            panel.SetVisible(!isVisible);
            repeatButton.SetVisible(isVisible);
        }

        function onActiveTabChanged(s, e) {
            var tabIndex = s.GetActiveTabIndex();
            var tabCount = s.GetTabCount();
            var progressBar = ASPxClientControl.GetControlCollection().GetByName("progressBar" + tabIndex);
            progressBar.SetPosition(100 * tabIndex / tabCount);

        }

        const group1 = "groupTabPersonal";
        const group2 = "groupTabDate";
        const group3 = "groupTabContact";

        function onTabClick(s, e) {
            var group = null;
            var activeTabIndex = s.GetActiveTabIndex();
            if (e.tab.index < activeTabIndex)
                return;

            if (activeTabIndex == 0) {
                group = group1;
            } else if (activeTabIndex == 1) {
                group = group2;
            } else if (activeTabIndex == 2) {
                group = group3;
            }
            e.cancel = !ASPxClientEdit.ValidateGroup(group);
        }

        function onRepeatButtonClick(s, e) {
            var container = pageControl.GetMainElement();
            ASPxClientEdit.ClearEditorsInContainer(container, group1, true);
            ASPxClientEdit.ClearEditorsInContainer(container, group2, true);
            ASPxClientEdit.ClearEditorsInContainer(container, group3, true);
            updateLastTabContent(false);
            pageControl.SetActiveTabIndex(0);
            popupControl.Hide();
        }

        function getShortDate(longDate) {
            var date = new Date(longDate);
            var month = date.getMonth() + 1;
            var str = month.toString() + '/' + date.getDate().toString() + '/' + date.getFullYear().toString();
            return str;
        }
    </script>
    <style>
        .center {
            align-items: center;
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="center">
                <dx:ASPxPageControl ID="pageControl" ClientInstanceName="pageControl" runat="server"
                    ActiveTabIndex="0" EnableHierarchyRecreation="true" Theme="Office365">
                    <ClientSideEvents TabClick="onTabClick" ActiveTabChanged="onActiveTabChanged" />
                    <TabPages>
                        <dx:TabPage Name="TabPersonal" Text="Personal">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <dx:ASPxProgressBar Width="100%" ClientInstanceName="progressBar0" runat="server" Theme="iOS" ID="progressBar">
                                        <IndicatorStyle>
                                            <BorderBottom BorderColor="#F87C1D" />
                                        </IndicatorStyle>

                                    </dx:ASPxProgressBar>
                                    <dx:ASPxTextBox Caption="First name" CaptionSettings-Position="Top" ID="txtFirstName" runat="server" Width="170px" ClientInstanceName="txtFirstName">
                                        <ValidationSettings SetFocusOnError="True" ValidationGroup="groupTabPersonal">
                                            <RequiredField IsRequired="True" ErrorText="First Name is required" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                    <hr />
                                    <dx:ASPxTextBox ID="txtLastName" Caption="Last name" CaptionSettings-Position="Top" runat="server" Width="170px" ClientInstanceName="txtLastName">
                                        <ValidationSettings SetFocusOnError="true" ValidationGroup="groupTabPersonal">
                                            <RequiredField IsRequired="true" ErrorText="Last Name is required" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                    <hr />
                                    <dx:ASPxCheckBox ID="checkBox" runat="server" ClientInstanceName="checkBox" Text="I agree">
                                        <ValidationSettings SetFocusOnError="True" ValidationGroup="groupTabPersonal">
                                            <RequiredField IsRequired="True" ErrorText="I agree is required" />
                                        </ValidationSettings>
                                    </dx:ASPxCheckBox>
                                    <hr />
                                    <dx:ASPxButton ID="btnNextPersonal" runat="server" Text="Next" ClientInstanceName="btnNextPersonal"
                                        AutoPostBack="false" ValidationGroup="groupTabPersonal">
                                        <ClientSideEvents Click="onButtonClick" />
                                    </dx:ASPxButton>
                                    <dx:ASPxValidationSummary ID="validSummaryPersonal" runat="server" ValidationGroup="groupTabPersonal">
                                    </dx:ASPxValidationSummary>
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Name="TabDate" Text="Date">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <dx:ASPxProgressBar Width="100%" runat="server" Theme="iOS" ClientInstanceName="progressBar1" ID="progressBar1">
                                        <IndicatorStyle>
                                            <BorderBottom BorderColor="#F87C1D" />
                                        </IndicatorStyle>
                                    </dx:ASPxProgressBar>
                                    <dx:ASPxDateEdit ID="deAnyDate" Caption="Any Date" CaptionSettings-Position="Top" runat="server" ClientInstanceName="deAnyDate">
                                        <ValidationSettings ValidationGroup="groupTabDate" ValidateOnLeave="true" SetFocusOnError="true">
                                            <RequiredField IsRequired="true" ErrorText="Any Date is required" />
                                        </ValidationSettings>
                                    </dx:ASPxDateEdit>
                                    <hr />
                                    <dx:ASPxComboBox ID="cbStates" runat="server" Caption="State" CaptionSettings-Position="Top" ValueType="System.String" ClientInstanceName="cbStates">
                                        <Items>
                                            <dx:ListEditItem Value="Alaska" Text="Alaska" />
                                            <dx:ListEditItem Value="Indiana" Text="Indiana" />
                                            <dx:ListEditItem Value="Kentucky" Text="Kentucky" />
                                            <dx:ListEditItem Value="Minnesota" Text="Minnesota" />
                                            <dx:ListEditItem Value="Nevada" Text="Nevada" />
                                        </Items>
                                        <ValidationSettings ValidationGroup="groupTabDate" ValidateOnLeave="true" SetFocusOnError="true">
                                            <RequiredField IsRequired="true" ErrorText="States is required" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                    <hr />
                                    <dx:ASPxButton ID="btnNext" ValidationGroup="groupTabDate" runat="server" Text="Next"
                                        ClientInstanceName="btnNextDate" AutoPostBack="false">
                                        <ClientSideEvents Click="onButtonClick" />
                                    </dx:ASPxButton>
                                    <dx:ASPxValidationSummary ID="validSummaryDate" runat="server" ValidationGroup="groupTabDate">
                                    </dx:ASPxValidationSummary>
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Name="TabContact" Text="Contact">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <dx:ASPxProgressBar Width="100%" ClientInstanceName="progressBar2" Theme="iOS" runat="server" ID="progressBar2">
                                        <IndicatorStyle>
                                            <BorderBottom BorderColor="#F87C1D" />
                                        </IndicatorStyle>
                                    </dx:ASPxProgressBar>
                                    <br />
                                    <center>
                                        <dx:ASPxButton runat="server" ClientInstanceName="repeatButton" Text="Repeat" AutoPostBack="false" ClientVisible="false">
                                            <ClientSideEvents Click="onRepeatButtonClick" />
                                        </dx:ASPxButton>
                                    </center>
                                    <dx:ASPxPanel runat="server" ID="panel" ClientInstanceName="panel">
                                        <PanelCollection>
                                            <dx:PanelContent>
                                                <dx:ASPxTextBox ID="txtEmail" runat="server" Caption="E-Mail" CaptionSettings-Position="Top" ClientInstanceName="txtEmail" Width="170px">
                                                    <ValidationSettings SetFocusOnError="True" ValidationGroup="groupTabContact">
                                                        <RegularExpression ErrorText="Invalid E-Mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                        <RequiredField IsRequired="True" ErrorText="E-Mail is required" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                                <hr />
                                                <dx:ASPxButton ID="btnFinish" runat="server" Text="Finish" ValidationGroup="groupTabContact"
                                                    AutoPostBack="false">
                                                    <ClientSideEvents Click="onFinishClick" />
                                                </dx:ASPxButton>
                                                <dx:ASPxValidationSummary ID="validSummaryContact" ValidationGroup="groupTabContact"
                                                    runat="server">
                                                </dx:ASPxValidationSummary>
                                            </dx:PanelContent>
                                        </PanelCollection>
                                    </dx:ASPxPanel>
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                    </TabPages>
                </dx:ASPxPageControl>
            </div>
        </div>
        <dx:ASPxPopupControl ID="popupControl" runat="server" CloseAction="CloseButton" ClientInstanceName="popupControl"
            HeaderText="Summary" PopupHorizontalAlign="OutsideRight" PopupHorizontalOffset="10">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </form>
</body>
</html>
