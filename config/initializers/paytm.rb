Rails.configuration.paytm = {
  merchant_id: ENV['PAYTM_MERCHANT_ID'],
  merchant_key: ENV['PAYTM_MERCHANT_KEY'],
  website: ENV['PAYTM_WEBSITE'] || 'DEFAULT',
  industry_type: ENV['PAYTM_INDUSTRY_TYPE_ID'] || 'Retail',
  channel_id: ENV['PAYTM_CHANNEL_ID'] || 'WEB',
  environment: ENV['PAYTM_ENVIRONMENT'] || 'test' # Use 'production' for live environment
} 