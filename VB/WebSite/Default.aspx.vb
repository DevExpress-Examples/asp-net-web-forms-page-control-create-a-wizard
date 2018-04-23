Imports Microsoft.VisualBasic
Imports DevExpress.Web.ASPxEditors

Imports System
Partial Public Class _Default
	Inherits System.Web.UI.Page

	Protected Sub showTabs_Init(ByVal sender As Object, ByVal e As EventArgs)
		If (Not IsCallback) AndAlso (Not IsPostBack) Then
			Dim cb As ASPxCheckBox = CType(sender, ASPxCheckBox)
			cb.Checked = pageControl.ShowTabs
		End If
	End Sub
	Protected Sub showTabs_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
		Dim cb As ASPxCheckBox = CType(sender, ASPxCheckBox)
		pageControl.ShowTabs = cb.Checked
		popupControl.ShowOnPageLoad = False
	End Sub

End Class
