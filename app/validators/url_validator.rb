class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << "is invalid" unless url_valid?(value)
  end

  # a URL may be technically well-formed but may
  # not actually be valid, so this checks for both.
  def url_valid?(url)
    url = URI.parse(url) rescue false
    url.is_a?(URI::HTTP) || url.is_a?(URI::HTTPS)
  end
end
