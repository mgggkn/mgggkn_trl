@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Root by RAP'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZDMO_GKG_TRAVEL as select from /dmo/travel_m
//composition of target_data_source_name as _association_name
//Specify Composition for Travel via booking.

composition[0..*] of ZDMO_GKG_BOOKING as _Booking

// associations -- loose coupling to get dependent data
association[1] to /DMO/I_Agency as _Agency on 
$projection.AgencyId = _Agency.AgencyID

association[1] to /DMO/I_Customer as _Customer on
$projection.CustomerId = _Customer.CustomerID

association[1] to I_Currency as _Currency on
$projection.CurrencyCode = _Currency.Currency

association[1..1] to /DMO/I_Overall_Status_VH as _OverAllStatus on
$projection.OverallStatus = _OverAllStatus.OverallStatus
{
    key travel_id as TravelId,
    agency_id as AgencyId,
    customer_id as CustomerId,
    begin_date as BeginDate,
    end_date as EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    booking_fee as BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    description as Description,
    overall_status as OverallStatus,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true // This will update the last saved date automatically by RAP
    //Local ETag Field
    last_changed_at as LastChangedAt,
    case overall_status
    when 'O' then 'Open'
    when 'A' then 'Approved'
    when 'R' then 'Rejected'
    when 'X' then 'Cancelled'
    end as StatusText,
    
    case overall_status
    when 'O' then 2
    when 'A' then 3
    when 'R' then 1
    when 'X' then 1
    end as Criticality,
    //This is to have color code.
    
    /* Expose Associations */
    _Agency,
    _Customer,
    _Currency,
    _OverAllStatus,
    
    _Booking
    
}
