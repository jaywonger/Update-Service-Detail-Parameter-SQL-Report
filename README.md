# Update-Service-Detail-Parameter-SQL-Report
Update service detail parameters in Procura report 

"The purpose of this report is to display all active Home Support orders that do not have a service detail. Currently it only pulls service details with a NULL value and does not display blank service details. 
The department filtering is outdated and currently excludes all data due to the department naming scheme being changed as part of the upgrade to Procura 9.
Maintaining this report is difficult due to the nested views that it is based on. Combining them into a single report is necessary to maintain proper functionality."

Update the department filtering to match the new naming scheme. Add a filter to include blank service details. Remove outdated filters and convert the report to use report SQL instead of views.

"The following changes need to be made to this report:
- Update the Printed By field to include the standard prefix
- Update the report to remove the view and replace it with report SQL that replicates the existing functionality except for the below changes
- Update the department filter to only include departments starting with ""HS"" instead of ""Home S""
- Update the department status filter to also include held statuses
- Update the order filter to include orders with a future end date
- Remove the filter excluding departments called 'Home Support BC'
- Remove the filter excluding funders with a name like 'Call'
- Remove the filter excluding funders with a name like 'Client'"


