@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'My Travel Processor for Projection Layer'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZDMO_GKG_TRAVEL_PROCESSOR as projection on ZDMO_GKG_TRAVEL
{
    @ObjectModel.text.element: [ 'Description' ]
    //@Consumption.valueHelpDefinition: [{  entity.name: '/DMO/I_Travel_D',entity.element: 'TravelID' }]
    key TravelId,
    @ObjectModel.text.element: [ 'AgencyName' ]
    @Consumption.valueHelpDefinition: [{  entity.name: '/DMO/I_Agency',entity.element: 'AgencyID' }]
    AgencyId,
    _Agency.Name as AgencyName,
    @ObjectModel.text.element: [ 'CustomerName' ]
    @Consumption.valueHelpDefinition: [{  entity.name: '/DMO/I_Customer',entity.element: 'CustomerID' }]
    CustomerId,
    @Semantics.text: true
    _Customer.LastName as CustomerName,
    BeginDate,
    EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    CurrencyCode,
    Description,
    @ObjectModel.text.element: [ 'StatusText' ] // This is the Key
    @Consumption.valueHelpDefinition: [{  entity.name: '/DMO/I_Overall_Status_VH',entity.element: 'OverallStatus' }]
    OverallStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
   @Semantics.text: true  // This is the Text for OverAllStatus
    StatusText,
    Criticality,
    /* Associations */
    _Agency,
    _Booking : redirected to composition child ZDMO_GKG_BOOKING_PROCESSOR,
    _Currency,
    _Customer,
    _OverAllStatus
}
