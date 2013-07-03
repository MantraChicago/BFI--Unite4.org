class CausePresenter
  def self.details
    [
      :id,
      :name,
      :cause_type_id,
      :twitter_handle,
      :city,
      :state,
      :website,
      :video_link,
      :twitter_handle,
      :facebook_url,
      :description,
      :mission_statement,
      :picture_url,
      :campaign_details,
      :locations_details
    ]
  end

  protected

    def self.all_columns
      Cause.column_names.map(&:to_sym)
    end
end
