<?php

$q = pl_menu_get('main_benefit');

/*echo "ALTER TABLE cases";

foreach($q as $key => $val)
{
	echo ",\nADD COLUMN litc_ci_{$key} TINYINT NULL DEFAULT NULL";
}
echo ";";


foreach($q as $key => $val)
{
	$safe_val = htmlentities($val);
	echo "%%[litc_ci_{$key},yes_no,checkbox]%%&nbsp;{$safe_val}<br>\n";
}
*/


// AMW I'm saving a list of the controversy issues here, for reference.
/*

1| Wages
2| Interest / Dividends (Schedule B)
3| Business Income (Schedule C)
4| Capital Gain or Loss (Schedule D)
5| IRA / Pension
6| Social Security Benefits
7| Alimony 
8| Rental, Royalty, Partnership, S Corp (Schedule E)
9| Farming Income (Schedule F)
10| Unemployment
11| Gambling Winnings
12| Cancellation of Debt
13| Settlement Proceeds
14| Other 
15| Alimony
16| Education Expenses (Including student loan interest)
17| Moving Expenses
18| IRA Deduction 
19| Medical and Dental Expenses
20| State and Local Taxes
21| Home Mortgage Interest
22| Other Interest Expenses
23| Charitable Contributions
24| Casualty and Theft Losses
25| Unreimbursed Employee Business Expenses 
26| Other Itemized Deductions
27| Business Expenses (Schedule C)
28| Child and Dependent Care Credit
29| Education Credits
30| Child Tax Credit / Additional Child Tax Credit
31| Earned Income Tax Credit
32| First-Time Homebuyer Credit
33| Other  
34| SSN / TIN
35| ITIN
36| Filing Status
37| Exemptions
38| Injured Spouse
39| Innocent Spouse 
40| Employment-Related Identity Theft
41| Refund-Related Identity Theft
42| Nonfiler
43| Worker Classification
44| Self-Employment Tax 
45| Return Preparer Fraud
46| Estimated Tax Payments 
47| Withholdings
48| Refund
49| Assessment Statute of Limitations
50| Collection Statute of Limitations
51| Refund Statute of Limitations
52| Trust Fund Recovery Penalty
53| Other Civil Penalties
54| Additional Tax on Distributions from Qualified Retirement Plans
55| Payments 
56| Installment Payment Agreement (IPA) 
57| Offer-In-Compromise (OIC)
58| Currently Not Collectible (CNC)
59| Liens
60| Levies (Including Federal Payment Levy Program)

*/

$menu_tax_years = array();
$current_year = date('Y');
for ($i=0;$i<30;$i++)
{
	$menu_tax_years[$current_year-$i] = $current_year-$i;
}

$litc_template = new pikaTempLib('subtemplates/case-litc.html',$case_row);
$litc_template->addMenu('tax_years',$menu_tax_years);
$C .= $litc_template->draw();
