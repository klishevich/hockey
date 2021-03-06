class Spark
  attr_reader :data

  def initialize(ogrn, type)
    client = Savon.client(wsdl: "http://sparkgatetest.interfax.ru/IfaxWebService/ifaxwebservice.asmx?WSDL")
    response = client.call(:authmethod, message: {"Login"=>"AlfaGate1","Password"=>"959awt2"})
    auth_cookies = response.http.cookies
    response = client.call(:find_company_by_code, message: {"companyCode"=>ogrn}, cookies: auth_cookies) if type == 'find_company_by_code'
    response = client.call(:check_company_status, message: {"ogrn"=>ogrn}, cookies: auth_cookies) if type == 'check_company_status'
    response = client.call(:get_company_accounting_report, message: {"ogrn"=>ogrn}, cookies: auth_cookies) if type == 'get_company_accounting_report'
    response = client.call(:get_company_accounting_report_date_list, message: {"ogrn"=>ogrn}, cookies: auth_cookies) if type == 'get_company_accounting_report_date_list'
    response = client.call(:get_company_coowners_history, message: {"ogrn"=>ogrn}, cookies: auth_cookies) if type == 'get_company_coowners_history'
    response = client.call(:get_company_extended_report, message: {"ogrn"=>ogrn}, cookies: auth_cookies) if type == 'get_company_extended_report'
    response = client.call(:get_company_licenses, message: {"ogrn"=>ogrn}, cookies: auth_cookies) if type == 'get_company_licenses'   
    response = client.call(:get_company_short_report, message: {"ogrn"=>ogrn}, cookies: auth_cookies) if type == 'get_company_short_report'
    response = client.call(:get_company_structure, message: {"ogrn"=>ogrn}, cookies: auth_cookies) if type == 'get_company_structure'
    response = client.call(:get_company_list_by_phone, message: {"phoneNumber"=>ogrn, "egrpoIncluded"=>1}, cookies: auth_cookies) if type == 'get_company_list_by_phone'
    response = client.call(:mon_activate, message: {"ogrn"=>ogrn}, cookies: auth_cookies) if type == 'mon_activate'
    response = client.call(:mon_get_companies_list, cookies: auth_cookies) if type == 'mon_get_companies_list'
    response = client.call(:mon_get_company_events, message: {"ogrn"=>ogrn, "includeProcessed"=>"1"}, cookies: auth_cookies) if type == 'mon_get_company_events'

    if response.success?
      @data = response.to_array#(:get_company_extended_report_response, :xml_data).first
    end
  end
end
