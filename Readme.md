<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128564818/21.2.5%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E3050)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
[![](https://img.shields.io/badge/💬_Leave_Feedback-feecdd?style=flat-square)](#does-this-example-address-your-development-requirementsobjectives)
<!-- default badges end -->
# Page Control for ASP.NET Web Forms - How to create a wizard interface

This example demonstrates how to use the [Page Control](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxPageControl) to create a wizard interface.

![Create a Wizard](create-a-wizard.png)

In the example, every wizard step is a [tab page](https://docs.devexpress.com/AspNet/DevExpress.Web.TabPage) that displays multiple fields. Mandatory fields are marked with an asterisk. You need to fill in the mandatory fields to move forward but you can keep them empty to move backwards. Click the **Next** button at the bottom of the current page to proceed to the next step, or click the **Personal**, **Date**, or **Contact** tab to navigate to the corresponding step.

Before you proceed to the next step, the [Validation Summary](https://docs.devexpress.com/AspNet/11626/components/data-editors/validationsummary) control validates values of the editors displayed on the current page and shows all validation errors. Fix the errors to move forward.

## Files to Review

* [Default.aspx](./CS/Default.aspx)
* [Default.aspx.cs](./CS/Default.aspx.cs) 

## Documentation

* [How to Validate a Group of Editors](https://docs.devexpress.com/AspNet/11132/components/data-editors/common-concepts/validation/examples/how-to-validate-a-group-of-editors)

## More Examples

- [Page Control for ASP.NET MVC - How to create a wizard interface](https://github.com/DevExpress-Examples/how-to-organize-wizard-interface-within-pagecontrol-extension-e3403)
- [Page and Menu Controls for ASP.NET Web Forms - How to create a wizard interface](https://github.com/DevExpress-Examples/how-to-organize-wizard-interface-within-aspxpagecontrol-and-aspxmenu-e3052)
- [Page Control for ASP.NET Web Forms - How to validate editor values](https://github.com/DevExpress-Examples/validation-within-a-multi-page-container-e12)
- [Page Control for ASP.NET Web Forms - How to validate editor values on callbacks](https://github.com/DevExpress-Examples/validation-within-a-multipage-container-on-callbacks-e334)
<!-- feedback -->
## Does this example address your development requirements/objectives?

[<img src="https://www.devexpress.com/support/examples/i/yes-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=asp-net-web-forms-page-control-create-a-wizard&~~~was_helpful=yes) [<img src="https://www.devexpress.com/support/examples/i/no-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=asp-net-web-forms-page-control-create-a-wizard&~~~was_helpful=no)

(you will be redirected to DevExpress.com to submit your response)
<!-- feedback end -->
