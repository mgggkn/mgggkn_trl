@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'My Travel Processor for Projection Layer'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define  view entity ZDMO_GKG_BOOKINGSUP_PROCESSOR as projection on ZDMO_GKG_BOOKINGSUPPL
{
    key TravelId,
    key BookingId,

    key BookingSupplementId,
    @Consumption.valueHelpDefinition: [{  entity.name: '/DMO/I_Supplement',entity.element: 'SupplementId' }]
    SupplementId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    CurrencyCode,
    /* Associations */
    _Booking : redirected to parent ZDMO_GKG_BOOKING_PROCESSOR,
    _Supplement,
    _SupplementText,
// Here the Travel Processor is not direct parent rather Booking is direct parent for Booking supplement, but we need to specify the 
// redirected to to  ZDMO_GKG_TRAVEL_PROCESSOR   
    _Travel : redirected to ZDMO_GKG_TRAVEL_PROCESSOR  
}
