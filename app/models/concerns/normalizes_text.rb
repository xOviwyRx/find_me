module NormalizesText
  extend ActiveSupport::Concern

  NORMALIZER = ->(value) { value.to_s.downcase.gsub(/\s+/, "").gsub("test", "") }

  class_methods do
    def normalizes_text(*attributes)
      normalizes(*attributes, with: NORMALIZER)
    end
  end
end
