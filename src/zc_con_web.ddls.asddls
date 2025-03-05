@Metadata.allowExtensions: true
@EndUserText.label: 'Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_CON_WEB
  provider contract transactional_query
  as projection on ZR_CON_WEB
{
  key Email,
  ConsentGiven,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt
  
}
