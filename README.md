# Azure-Web-Apps-with-App-Service-Environments-for-PCIDSS


The Web Apps feature of Azure App Service currently meets the requirements of PCI Data Security Standard (DSS) version 3.0 Level 1. We are also looking ahead to incorporate PCI DSS version 3.1 into our services. This integration is in the planning stages, where we are strategizing the adoption of this updated standard.

To comply with PCI DSS version 3.1, it's necessary to disable Transport Layer Security (TLS) 1.0. At present, this option is not readily available for most App Service plans. However, users who operate within the App Service Environment, or those considering a transition to it, can gain enhanced control over their settings. This includes the option to disable TLS 1.0, which can be done through coordination with Azure Support. We are also working towards enabling direct user access to these settings in the foreseeable future.