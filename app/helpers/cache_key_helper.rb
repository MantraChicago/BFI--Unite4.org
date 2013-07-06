module CacheKeyHelper
  def cache_key_for_featured_campaigns
    count = Campaign.featured.count
    maximum_updated_at = Campaign.featured.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "campaigns/featured-#{ count }-#{ maximum_updated_at }"
  end

  def cache_key_for_cause_types
    count = CauseType.count
    maximum_updated_at = CauseType.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "products/by-name-#{ count }-#{ maximum_updated_at }"
  end
end
