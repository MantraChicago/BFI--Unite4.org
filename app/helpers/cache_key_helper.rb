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

  def cache_key_for_causes_by_city city_slug, filters={}
    count = Cause.by_city_slug(city_slug)
    maximum_updated_at = Cause.by_city_slug(city_slug).maximum(:updated_at).try(:utc).try(:to_s,:number)
    base = "causes/by_city_slug-#{ count }-#{ maximum_updated_at }"

    return base if filters.empty?

    base + "/" + cache_key_from_params(filters)
  end

  def cache_key_for_causes_by_cause_type cause_type_slug
    count = Cause.by_cause_type(cause_type_slug)
    maximum_updated_at = Cause.by_cause_type(cause_type_slug).maximum(:updated_at).try(:utc).try(:to_s,:number)
    "causes/by_cause_type-#{ cause_type_slug }-#{ count }-#{ maximum_updated_at }"
  end

  def cache_key_for_causes_by_city_and_cause_type city_slug, cause_type_slug
    causes = Cause.by_city_slug(city_slug).by_cause_type(cause_type_slug)
    count = causes.count
    maximum_updated_at = causes.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "causes/by_city_and_cause_type-#{ city_slug }-#{ cause_type_slug }-#{ count }-#{ maximum_updated_at }"
  end

  def cache_key_for_cities_grouped_by_cause_type cause_type_slug
    count = Cause.by_cause_type(cause_type_slug).count
    maximum_updated_at = Cause.by_cause_type(cause_type_slug).maximum(:updated_at)
    "cities/grouped-by-cause-type/#{ cause_type_slug }-#{ count }-#{ maximum_updated_at }"
  end

  def cache_key_for_cause_types_grouped_by_city city_slug
    count = Cause.by_city_slug(city_slug).count
    maximum_updated_at = CauseType.joins(:causes).where("causes.city_slug = ?", city_slug).maximum(:updated_at).try(:utc).try(:to_s, :number)
    "cause_types/grouped-by-city/#{ city_slug }-#{ count }-#{ maximum_updated_at }"
  end

  def cache_key_from_params(hash={})
    cache_key = hash.inject([]) do |memo,pair|
      key, value = pair
      memo += "#{key}:#{ value }"
    end

    cache_key.join ':::'
  end

end
