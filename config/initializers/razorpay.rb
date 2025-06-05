Razorpay.setup(ENV['RAZORPAY_KEY_ID'], ENV['RAZORPAY_KEY_SECRET'])

Rails.configuration.razorpay = {
  key_id: ENV['RAZORPAY_KEY_ID'],
  key_secret: ENV['RAZORPAY_KEY_SECRET']
} 