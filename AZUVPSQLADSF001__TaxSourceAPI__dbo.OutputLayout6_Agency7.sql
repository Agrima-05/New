SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON



CREATE View [dbo].[OutputLayout6_Agency7] 
AS

SELECT   

	Id
	,BatchId
	,ExternalKey,
	JSON_VALUE([PostBack], '$.PropertyId') AS PropertyId,
	JSON_VALUE([PostBack], '$.ReportName') AS ReportName,
	--	JSON_VALUE([PostBack], '$.ReportStatus') AS ReportStatus,

	case when SubmissionStatus ='Errored' then 'Errored' else JSON_VALUE([PostBack], '$.ReportStatus') end AS ReportStatus,

	JSON_VALUE([PostBack], '$.ReferenceId') AS ReferenceId,
	JSON_VALUE([PostBack], '$.OrderItemId') AS OrderItemId,
	JSON_VALUE([PostBack], '$.Data.SubjectProperty.SitusAddress.StreetAddress') AS StreetAddress,
	JSON_VALUE([PostBack], '$.Data.SubjectProperty.SitusAddress.City') AS City,
	JSON_VALUE([PostBack], '$.Data.SubjectProperty.SitusAddress.State') AS State,
	JSON_VALUE([PostBack], '$.Data.SubjectProperty.SitusAddress.Zip9') AS Zip9,
	JSON_VALUE([PostBack], '$.Data.SubjectProperty.SitusAddress.County') AS County,
	--JSON_VALUE([PostBack], '$.Data.SubjectProperty.SitusAddress.SitusCarrierRoute') AS SitusCarrierRoute,
	JSON_VALUE([PostBack], '$.Data.SubjectProperty.SitusAddress.APN') AS APN,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.StateFips') AS StateFips,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.CountyFips') AS CountyFips,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.ReportAsOfDate')) AS ReportAsOfDate,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.AssessorInformation.AssessorsAlternateParcelIdentifier') AS AssessorsAlternateParcelIdentifier,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.AssessorInformation.ExtendedLegalDescription') AS ExtendedLegalDescription,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.AssessorInformation.LandUse') AS LandUse,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.AssessorInformation.TraCode') AS TraCode,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.AssessorInformation.TraName') AS TraName,
	--JSON_VALUE([PostBack], '$.Data.TaxStatus.AssessorInformation.SitusAddress.Zip5') AS Zip5,
	--JSON_VALUE([PostBack], '$.Data.TaxStatus.AssessorInformation.SitusAddress.ZipPlus4') AS ZipPlus4,
	--JSON_VALUE([PostBack], '$.Data.TaxStatus.AssessorInformation.SitusAddress.AddressString') AS AddressString,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.AssessorInformation.PropertyOwners[0].OwnerNames') AS OwnerNames,
	
	--case when SubmissionStatus ='Errored' then 'Errored' else JSON_VALUE([PostBack], '$.ReportStatus') AS ReportStatus,

	case when SubmissionStatus ='Errored' 
	   then 
			case when ISJSON([Response]) = 1 then	
				case 
				when JSON_VALUE([Response], 'lax $.Reports[0].ReportStatus') <> 'Processing' 
					or JSON_VALUE([Response], 'lax $.Reports[0].OrderItemId') =  '0'   
					then	replace(replace(JSON_VALUE([Response], 'lax $.Reports[0].Message'),'[',''),']','') 	
					
				when JSON_VALUE([Response], 'lax $.StatusDescription') is not null	
					then	replace(replace(JSON_VALUE([Response], 'lax $.StatusDescription'),'[',''),']','') 
				when JSON_VALUE([Response], 'lax $.Message') is not null 
					then	replace(replace(JSON_VALUE([Response], 'lax $.Message'),'[',''),']','') 							
				else 
					'Unknown'
			end
			else 
				'Unknown'
			end
	else replace(replace(JSON_QUERY([PostBack], '$.Data.Errors'),'[',''),']','') 
	end AS Errors,
		
	--JSON_VALUE([PostBack], '$.Data.SearchRequestId') AS SearchRequestId,
	JSON_VALUE([PostBack], '$.Message') AS Message,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].MismoAgencyCode') AS Agency1_MismoAgencyCode,		
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].AgencyName') AS Agency1_Name,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].AgencyType') AS Agency1_AgencyType,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxCollectorUrl') AS Agency1_TaxCollectorUrl,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].PhoneNumber') AS Agency1_PhoneNumber,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].FaxNumber') AS Agency1_FaxNumber,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].Email') AS Agency1_Email,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].MakePayableTo') AS Agency1_MakePayableTo,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].StreetAddress') AS Agency1_StreetAddress,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].CityStateZip') AS Agency1_CityStateZip,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].MailingStreet') AS Agency1_MailingStreet,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].MailingCityStateZip') AS Agency1_MailingCityStateZip,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxYearType') AS Agency1_TaxYearType,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxYearDates') AS Agency1_TaxYearDates,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].CurrentTaxYear') AS Agency1_CurrentTaxYear,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].CollectsInArrears') AS Agency1_CollectsInArrears,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].DiscountAgency') AS Agency1_DiscountAgency,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].DuplicateBillRequired') AS Agency1_DuplicateBillRequired,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].DuplicateBillFee') AS Agency1_DuplicateBillFee,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].ExternalAgencyNotes') AS Agency1_ExternalAgencyNotes,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.AsOfDate')) AS TaxDetails_AsOfDate,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.SchoolDistrict') AS TaxDetails_SchoolDistrict,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxId') AS TaxDetails_TaxId,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.DelinquentTaxes') AS TaxDetails_DelinquentTaxes,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxReportStatus') AS TaxDetails_TaxReportStatus,
	--JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxYear') AS TaxDetails_TaxYear,


	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.DelinquencyTaxSaleYear') AS TaxDetails_DelinquencyTaxSaleYear,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.TaxYear') AS TaxYear,

	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.TaxType') AS TaxType,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.TaxSupplementalAPN') AS TaxSupplementalAPN,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.TotalTax') AS TotalTax,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.ImprovementValue') AS ImprovementValue,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.LandVal') AS LandVal,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.AssessedTotalValue') AS AssessedTotalValue,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.AssessedYear') AS AssessedYear,


	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.ExemptionType') AS ExemptionType,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.ExemptionAmount') AS ExemptionAmount,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.NetVal') AS NetVal,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.CertificateOfPurchase') AS CertificateOfPurchase,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.Message') AS TaxInstallmentsMessage,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.TaxBillNumber') AS TaxBillNumber,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[0].SequenceId') AS InstallmentDetail1_SequenceId,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[0].Amount') AS InstallmentDetail1_Amount,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[0].Status') AS InstallmentDetail1_Status,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[0].PaymentDate')) AS InstallmentDetail1_PaymentDate,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[0].AmountDue') AS InstallmentDetail1_AmountDue,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[0].PartialPayAmt') AS InstallmentDetail1_PartialPayAmt,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[0].DueDate')) AS InstallmentDetail1_DueDate,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[0].DelinquentDate')) AS InstallmentDetail1_DelinquentDate,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[0].EstimatedAmountGoodThrough')) AS InstallmentDetail1_EstimatedAmountGoodThrough,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[0].DiscountDate')) AS InstallmentDetail1_DiscountDate,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[0].Penalty') AS InstallmentDetail1_Penalty,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[0].Interest') AS InstallmentDetail1_Interest,
	
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[1].SequenceId') AS InstallmentDetail2_SequenceId,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[1].Amount') AS InstallmentDetail2_Amount,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[1].Status') AS InstallmentDetail2_Status,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[1].PaymentDate')) AS InstallmentDetail2_PaymentDate,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[1].AmountDue') AS InstallmentDetail2_AmountDue,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[1].PartialPayAmt') AS InstallmentDetail2_PartialPayAmt,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[1].DueDate')) AS InstallmentDetail2_DueDate,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[1].DelinquentDate')) AS InstallmentDetail2_DelinquentDate,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[1].EstimatedAmountGoodThrough')) AS InstallmentDetail2_EstimatedAmountGoodThrough,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[1].DiscountDate')) AS InstallmentDetail2_DiscountDate,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[1].Penalty') AS InstallmentDetail2_Penalty,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[1].Interest') AS InstallmentDetail2_Interest,

	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[2].SequenceId') AS InstallmentDetail3_SequenceId,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[2].Amount') AS InstallmentDetail3_Amount,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[2].Status') AS InstallmentDetail3_Status,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[2].PaymentDate')) AS InstallmentDetail3_PaymentDate,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[2].AmountDue') AS InstallmentDetail3_AmountDue,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[2].PartialPayAmt') AS InstallmentDetail3_PartialPayAmt,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[2].DueDate')) AS InstallmentDetail3_DueDate,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[2].DelinquentDate')) AS InstallmentDetail3_DelinquentDate,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[2].EstimatedAmountGoodThrough')) AS InstallmentDetail3_EstimatedAmountGoodThrough,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[2].DiscountDate')) AS InstallmentDetail3_DiscountDate,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[2].Penalty') AS InstallmentDetail3_Penalty,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[2].Interest') AS InstallmentDetail3_Interest,

	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[3].SequenceId') AS InstallmentDetail4_SequenceId,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[3].Amount') AS InstallmentDetail4_Amount,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[3].Status') AS InstallmentDetail4_Status,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[3].PaymentDate')) AS InstallmentDetail4_PaymentDate,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[3].AmountDue') AS InstallmentDetail4_AmountDue,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[3].PartialPayAmt') AS InstallmentDetail4_PartialPayAmt,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[3].DueDate')) AS InstallmentDetail4_DueDate,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[3].DelinquentDate')) AS InstallmentDetail4_DelinquentDate,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[3].EstimatedAmountGoodThrough')) AS InstallmentDetail4_EstimatedAmountGoodThrough,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[3].DiscountDate')) AS InstallmentDetail4_DiscountDate,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[3].Penalty') AS InstallmentDetail4_Penalty,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.TaxInstallments.InstallmentDetail[3].Interest') AS InstallmentDetail4_Interest,

	

	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].TaxYear') AS OtherTaxDetails1_TaxYear,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].TaxType') AS OtherTaxDetails1_TaxType,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].TaxSupplementalAPN') AS OtherTaxDetails1_TaxSupplementalAPN,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].TotalTax') AS OtherTaxDetails1_TotalTax,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].CertificateOfPurchase') AS OtherTaxDetails1_CertificateOfPurchase,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].Message') AS OtherTaxDetails1_Message,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].TaxBillNumber') AS OtherTaxDetails1_TaxBillNumber,

	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].InstallmentDetail[0].Amount') AS OtherTaxDetails1_InstallmentDetail1_Amount,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].InstallmentDetail[0].Status') AS OtherTaxDetails1_InstallmentDetail1_Status,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].InstallmentDetail[0].AmountDue') AS OtherTaxDetails1_InstallmentDetail1_AmountDue,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].InstallmentDetail[0].DelinquentDate')) AS OtherTaxDetails1_InstallmentDetail1_DelinquentDate,

	
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].InstallmentDetail[1].Amount') AS OtherTaxDetails1_InstallmentDetail2_Amount,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].InstallmentDetail[1].Status') AS OtherTaxDetails1_InstallmentDetail2_Status,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].InstallmentDetail[1].AmountDue') AS OtherTaxDetails1_InstallmentDetail2_AmountDue,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].InstallmentDetail[1].DelinquentDate')) AS OtherTaxDetails1_InstallmentDetail2_DelinquentDate,

	
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].InstallmentDetail[2].Amount') AS OtherTaxDetails1_InstallmentDetail3_Amount,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].InstallmentDetail[2].Status') AS OtherTaxDetails1_InstallmentDetail3_Status,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].InstallmentDetail[2].AmountDue') AS OtherTaxDetails1_InstallmentDetail3_AmountDue,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].InstallmentDetail[2].DelinquentDate')) AS OtherTaxDetails1_InstallmentDetail3_DelinquentDate,

	
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].InstallmentDetail[3].Amount') AS OtherTaxDetails1_InstallmentDetail4_Amount,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].InstallmentDetail[3].Status') AS OtherTaxDetails1_InstallmentDetail4_Status,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].InstallmentDetail[3].AmountDue') AS OtherTaxDetails1_InstallmentDetail4_AmountDue,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[0].InstallmentDetail[3].DelinquentDate')) AS OtherTaxDetails1_InstallmentDetail4_DelinquentDate,




	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].TaxYear') AS OtherTaxDetails2_TaxYear,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].TaxType') AS OtherTaxDetails2_TaxType,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].TaxSupplementalAPN') AS OtherTaxDetails2_TaxSupplementalAPN,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].TotalTax') AS OtherTaxDetails2_TotalTax,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].CertificateOfPurchase') AS OtherTaxDetails2_CertificateOfPurchase,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].Message') AS OtherTaxDetails2_Message,

	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].TaxBillNumber') AS OtherTaxDetails2_TaxBillNumber,

	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].InstallmentDetail[0].Amount') AS OtherTaxDetails2_InstallmentDetail1_Amount,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].InstallmentDetail[0].Status') AS OtherTaxDetails2_InstallmentDetail1_Status,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].InstallmentDetail[0].AmountDue') AS OtherTaxDetails2_InstallmentDetail1_AmountDue,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].InstallmentDetail[0].DelinquentDate')) AS OtherTaxDetails2_InstallmentDetail1_DelinquentDate,

	
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].InstallmentDetail[1].Amount') AS OtherTaxDetails2_InstallmentDetail2_Amount,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].InstallmentDetail[1].Status') AS OtherTaxDetails2_InstallmentDetail2_Status,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].InstallmentDetail[1].AmountDue') AS OtherTaxDetails2_InstallmentDetail2_AmountDue,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].InstallmentDetail[1].DelinquentDate')) AS OtherTaxDetails2_InstallmentDetail2_DelinquentDate,

	
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].InstallmentDetail[2].Amount') AS OtherTaxDetails2_InstallmentDetail3_Amount,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].InstallmentDetail[2].Status') AS OtherTaxDetails2_InstallmentDetail3_Status,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].InstallmentDetail[2].AmountDue') AS OtherTaxDetails2_InstallmentDetail3_AmountDue,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].InstallmentDetail[2].DelinquentDate')) AS OtherTaxDetails2_InstallmentDetail3_DelinquentDate,

	
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].InstallmentDetail[3].Amount') AS OtherTaxDetails2_InstallmentDetail4_Amount,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].InstallmentDetail[3].Status') AS OtherTaxDetails2_InstallmentDetail4_Status,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].InstallmentDetail[3].AmountDue') AS OtherTaxDetails2_InstallmentDetail4_AmountDue,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[1].InstallmentDetail[3].DelinquentDate')) AS OtherTaxDetails2_InstallmentDetail4_DelinquentDate,





	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].TaxYear') AS OtherTaxDetails3_TaxYear,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].TaxType') AS OtherTaxDetails3_TaxType,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].TaxSupplementalAPN') AS OtherTaxDetails3_TaxSupplementalAPN,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].TotalTax') AS OtherTaxDetails3_TotalTax,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].CertificateOfPurchase') AS OtherTaxDetails3_CertificateOfPurchase,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].Message') AS OtherTaxDetails3_Message,

	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].TaxBillNumber') AS OtherTaxDetails3_TaxBillNumber,

	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].InstallmentDetail[0].Amount') AS OtherTaxDetails3_InstallmentDetail1_Amount,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].InstallmentDetail[0].Status') AS OtherTaxDetails3_InstallmentDetail1_Status,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].InstallmentDetail[0].AmountDue') AS OtherTaxDetails3_InstallmentDetail1_AmountDue,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].InstallmentDetail[0].DelinquentDate')) AS OtherTaxDetails3_InstallmentDetail1_DelinquentDate,

	
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].InstallmentDetail[1].Amount') AS OtherTaxDetails3_InstallmentDetail2_Amount,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].InstallmentDetail[1].Status') AS OtherTaxDetails3_InstallmentDetail2_Status,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].InstallmentDetail[1].AmountDue') AS OtherTaxDetails3_InstallmentDetail2_AmountDue,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].InstallmentDetail[1].DelinquentDate')) AS OtherTaxDetails3_InstallmentDetail2_DelinquentDate,

	
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].InstallmentDetail[2].Amount') AS OtherTaxDetails3_InstallmentDetail3_Amount,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].InstallmentDetail[2].Status') AS OtherTaxDetails3_InstallmentDetail3_Status,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].InstallmentDetail[2].AmountDue') AS OtherTaxDetails3_InstallmentDetail3_AmountDue,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].InstallmentDetail[2].DelinquentDate')) AS OtherTaxDetails3_InstallmentDetail3_DelinquentDate,

	
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].InstallmentDetail[3].Amount') AS OtherTaxDetails3_InstallmentDetail4_Amount,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].InstallmentDetail[3].Status') AS OtherTaxDetails3_InstallmentDetail4_Status,
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].InstallmentDetail[3].AmountDue') AS OtherTaxDetails3_InstallmentDetail4_AmountDue,
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[2].InstallmentDetail[3].DelinquentDate')) AS OtherTaxDetails3_InstallmentDetail4_DelinquentDate,

	case when JSON_QUERY ([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails[3]') is not null then 'Y' else 'N' end AS AdditionalOtherTaxDetails,

	/*
	JSON_VALUE(dbo.OtherTaxDetailsCustomJson(ISNULL(JSON_QUERY([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails'),'')),  '$[0].TaxYear') as OtherTaxDetails1_TaxYear,
	JSON_VALUE(dbo.OtherTaxDetailsCustomJson(ISNULL(JSON_QUERY([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails'),'')),  '$[0].TaxType') as OtherTaxDetails1_TaxType,
	JSON_VALUE(dbo.OtherTaxDetailsCustomJson(ISNULL(JSON_QUERY([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails'),'')),  '$[0].TaxSupplementalAPN') as OtherTaxDetails1_TaxSupplementalAPN,
	JSON_VALUE(dbo.OtherTaxDetailsCustomJson(ISNULL(JSON_QUERY([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails'),'')),  '$[0].TotalTax') as OtherTaxDetails1_TotalTax,
	JSON_VALUE(dbo.OtherTaxDetailsCustomJson(ISNULL(JSON_QUERY([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails'),'')),  '$[0].CertificateOfPurchase') as OtherTaxDetails1_CertificateOfPurchase,
	JSON_VALUE(dbo.OtherTaxDetailsCustomJson(ISNULL(JSON_QUERY([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails'),'')),  '$[0].TaxBillNumber') as OtherTaxDetails1_TaxBillNumber,




	JSON_VALUE(dbo.OtherTaxDetailsCustomJson(ISNULL(JSON_QUERY([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails'),'')),  '$[1].TaxYear') as OtherTaxDetails2_TaxYear,
	JSON_VALUE(dbo.OtherTaxDetailsCustomJson(ISNULL(JSON_QUERY([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails'),'')),  '$[1].TaxType') as OtherTaxDetails2_TaxType,
	JSON_VALUE(dbo.OtherTaxDetailsCustomJson(ISNULL(JSON_QUERY([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails'),'')),  '$[1].TaxSupplementalAPN') as OtherTaxDetails2_TaxSupplementalAPN,
	JSON_VALUE(dbo.OtherTaxDetailsCustomJson(ISNULL(JSON_QUERY([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails'),'')),  '$[1].TotalTax') as OtherTaxDetails2_TotalTax,
	JSON_VALUE(dbo.OtherTaxDetailsCustomJson(ISNULL(JSON_QUERY([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails'),'')),  '$[1].CertificateOfPurchase') as OtherTaxDetails2_CertificateOfPurchase,
	JSON_VALUE(dbo.OtherTaxDetailsCustomJson(ISNULL(JSON_QUERY([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails'),'')),  '$[1].TaxBillNumber') as OtherTaxDetails2_TaxBillNumber,





	JSON_VALUE(dbo.OtherTaxDetailsCustomJson(ISNULL(JSON_QUERY([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails'),'')),  '$[2].TaxYear') as OtherTaxDetails3_TaxYear,
	JSON_VALUE(dbo.OtherTaxDetailsCustomJson(ISNULL(JSON_QUERY([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails'),'')),  '$[2].TaxType') as OtherTaxDetails3_TaxType,
	JSON_VALUE(dbo.OtherTaxDetailsCustomJson(ISNULL(JSON_QUERY([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails'),'')),  '$[2].TaxSupplementalAPN') as OtherTaxDetails3_TaxSupplementalAPN,
	JSON_VALUE(dbo.OtherTaxDetailsCustomJson(ISNULL(JSON_QUERY([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails'),'')),  '$[2].TotalTax') as OtherTaxDetails3_TotalTax,
	JSON_VALUE(dbo.OtherTaxDetailsCustomJson(ISNULL(JSON_QUERY([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails'),'')),  '$[2].CertificateOfPurchase') as OtherTaxDetails3_CertificateOfPurchase,
	JSON_VALUE(dbo.OtherTaxDetailsCustomJson(ISNULL(JSON_QUERY([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails'),'')),  '$[2].TaxBillNumber') as OtherTaxDetails3_TaxBillNumber,

	case when JSON_VALUE(dbo.OtherTaxDetailsCustomJson(ISNULL(JSON_QUERY([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.OtherTaxDetails'),'')),  '$[3].TaxYear') is not null then 'Y' else 'N' end AS AdditionalOtherTaxDetails,
	*/
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.RedemptionDetails[0].Amount') AS RedemptionDetails1_Amount,
	dbo.RemoveTimestamp(dbo.ChooseBestDate2(
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.RedemptionDetails[0].RedemptionDate'),
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.RedemptionDetails[0].Year'),
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.RedemptionDetails[0].Month') 
	))                                                                                                              AS RedemptionDetails1_RedemptionDate,	
	
	
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.RedemptionDetails[0].PaymentGoodThrough')) AS RedemptionDetails1_PaymentGoodThrough,


	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.RedemptionDetails[1].Amount') AS RedemptionDetails2_Amount,
	dbo.RemoveTimestamp(dbo.ChooseBestDate2(
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.RedemptionDetails[1].RedemptionDate'),
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.RedemptionDetails[1].Year'),
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.RedemptionDetails[1].Month') 
	))                                                                                                           AS RedemptionDetails2_RedemptionDate,	
	
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.RedemptionDetails[1].PaymentGoodThrough')) AS RedemptionDetails2_PaymentGoodThrough,


	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.RedemptionDetails[2].Amount') AS RedemptionDetails3_Amount,
	dbo.RemoveTimestamp(dbo.ChooseBestDate2(
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.RedemptionDetails[2].RedemptionDate'),
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.RedemptionDetails[2].Year'),
	JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.RedemptionDetails[2].Month') 
	))                                                                                                               AS RedemptionDetails3_RedemptionDate,	
	dbo.RemoveTimestamp(JSON_VALUE([PostBack], '$.Data.TaxStatus.Agencies[7].TaxDetails.RedemptionDetails[2].PaymentGoodThrough')) AS RedemptionDetails3_PaymentGoodThrough



	,DocStatus

	,[PostBack]
	,SubmissionStatus
  FROM [dbo].[Property] with(NOLOCK)


 

