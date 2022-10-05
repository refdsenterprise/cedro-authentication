import Foundation

public struct EnvironmentModel: CedroModel {
    public var webfeeder: EnvironmentWebfeederModel?
    public var apiUrls: EnvironmentApiUrlsModel?
    public var paths: EnvironmentPathsModel?
    public var systemVariables: EnvironmentSystemVariablesModel?
    public var afterLoginMessage: EnvironmentAfterLoginMessageModel?

    enum CodingKeys: String, CodingKey {
        case webfeeder = "WEBFEEDER"
        case apiUrls = "API_URLS"
        case paths = "PATHS"
        case systemVariables = "SYSTEM_VARIABLES"
        case afterLoginMessage = "AFTER_LOGIN_MESSAGE"
    }
}

// MARK: - AfterLoginMessage
public struct EnvironmentAfterLoginMessageModel: CedroModel {
    public var title, content, effectiveDate: String?

    enum CodingKeys: String, CodingKey {
        case title = "TITLE"
        case content = "CONTENT"
        case effectiveDate = "EFFECTIVE_DATE"
    }
}

// MARK: - ApiUrls
public struct EnvironmentApiUrlsModel: CedroModel {
    public var webfeederRestApiFacade, workspaceRestApiFacade: String?
    public var webfeederRestApiWso2, workspaceRestApiWso2, cedroAccountApiWso2, webfeederRestApiAdapterAuth: String?
    public var webfeederRestApiAdapterWso2, workspaceRestApiAdapter, eletronicSignatureApiAdapter, termSuitabilityApiAdapter: String?
    public var saveChartApi: String?
    public var userApi, storeUrl, fastMarket, addressViaCepApi: String?
    public var redirectLogout, redirectLogin: String?

    enum CodingKeys: String, CodingKey {
        case webfeederRestApiFacade = "WEBFEEDER_REST_API_FACADE"
        case workspaceRestApiFacade = "WORKSPACE_REST_API_FACADE"
        case webfeederRestApiWso2 = "WEBFEEDER_REST_API_WSO2"
        case workspaceRestApiWso2 = "WORKSPACE_REST_API_WSO2"
        case cedroAccountApiWso2 = "CEDRO_ACCOUNT_API_WSO2"
        case webfeederRestApiAdapterAuth = "WEBFEEDER_REST_API_ADAPTER_AUTH"
        case webfeederRestApiAdapterWso2 = "WEBFEEDER_REST_API_ADAPTER_WSO2"
        case workspaceRestApiAdapter = "WORKSPACE_REST_API_ADAPTER"
        case eletronicSignatureApiAdapter = "ELETRONIC_SIGNATURE_API_ADAPTER"
        case termSuitabilityApiAdapter = "TERM_SUITABILITY_API_ADAPTER"
        case saveChartApi = "SAVE_CHART_API"
        case userApi = "USER_API"
        case storeUrl = "STORE_URL"
        case fastMarket = "FAST_MARKET"
        case addressViaCepApi = "ADDRESS_VIA_CEP_API"
        case redirectLogout = "REDIRECT_LOGOUT"
        case redirectLogin = "REDIRECT_LOGIN"
    }
}

// MARK: - Paths
public struct EnvironmentPathsModel: CedroModel {
    public var webfeederAdapter, tradingviewAdapter, webfeederWso2, tradingviewWso2: String?
    public var userIdentityWso2, portalBusinessWso2, registrationSystemSuitability: String?

    enum CodingKeys: String, CodingKey {
        case webfeederAdapter = "WEBFEEDER_ADAPTER"
        case tradingviewAdapter = "TRADINGVIEW_ADAPTER"
        case webfeederWso2 = "WEBFEEDER_WSO2"
        case tradingviewWso2 = "TRADINGVIEW_WSO2"
        case userIdentityWso2 = "USER_IDENTITY_WSO2"
        case portalBusinessWso2 = "PORTAL_BUSINESS_WSO2"
        case registrationSystemSuitability = "REGISTRATION_SYSTEM_SUITABILITY"
    }
}

// MARK: - SystemVariables
public struct EnvironmentSystemVariablesModel: CedroModel {
    public var orderHistoryFilterRange, extractFinancialFilterRange, modalNewsFilterRange: Int?
    public var googleTagManagerID, brokerageValue, newsAgency: String?
    public var registerIdentity: Bool?

    enum CodingKeys: String, CodingKey {
        case orderHistoryFilterRange = "ORDER_HISTORY_FILTER_RANGE"
        case extractFinancialFilterRange = "EXTRACT_FINANCIAL_FILTER_RANGE"
        case modalNewsFilterRange = "MODAL_NEWS_FILTER_RANGE"
        case googleTagManagerID = "GOOGLE_TAG_MANAGER_ID"
        case brokerageValue = "BROKERAGE_VALUE"
        case newsAgency = "NEWS_AGENCY"
        case registerIdentity = "REGISTER_IDENTITY"
    }
}

// MARK: - Webfeeder
public struct EnvironmentWebfeederModel: CedroModel {
    public var urlWebFeederFacade, urlWebFeederWso2, urlWebFeederAdapter: String?

    enum CodingKeys: String, CodingKey {
        case urlWebFeederFacade = "URL_WEB_FEEDER_FACADE"
        case urlWebFeederWso2 = "URL_WEB_FEEDER_WSO2"
        case urlWebFeederAdapter = "URL_WEB_FEEDER_ADAPTER"
    }
}
