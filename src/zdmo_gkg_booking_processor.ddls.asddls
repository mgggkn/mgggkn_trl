@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'My Travel Processor for Projection Layer'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define  view entity ZDMO_GKG_BOOKING_PROCESSOR as projection on ZDMO_GKG_BOOKING
{
        key TravelId,
        key BookingId,
        BookingDate,
        @Consumption.valueHelpDefinition: [{  entity.name: '/DMO/I_Customer',entity.element: 'CustomerID' }]
        CustomerId,
        @Consumption.valueHelpDefinition: [{  entity.name: '/DMO/I_Carrier',entity.element: 'AirlineID' }]
        CarrierId,
        //_Carrier.Name as CarrierName,
        @Consumption.valueHelpDefinition: [
            {  entity.name: '/DMO/I_Connection',
            entity.element: 'ConnectionID',
            additionalBinding: 
                [
                    { localElement: 'CarrierId', element: 'AirlineID'  }
                ]
            }]
        ConnectionId,
        FlightDate,
        @Semantics.amount.currencyCode: 'CurrencyCode'
        FlightPrice,
        CurrencyCode,
        @Consumption.valueHelpDefinition: [{  entity.name: '/DMO/I_Booking_Status_VH',entity.element: 'BookingStatus' }]
        BookingStatus,
        LastChangedAt,
        /* Associations */
        _BookingStatus,
        _BookingSuppl : redirected to composition child ZDMO_GKG_BOOKINGSUP_PROCESSOR,
        _Carrier,
        _Connection,
        _Customer,
        _Travel: redirected to parent ZDMO_GKG_TRAVEL_PROCESSOR
}
