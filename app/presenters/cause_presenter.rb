class CausePresenter

  def default
    [
      :id,
      :name,
      :locations,
      :cause_types,
      :location,
      :active_campaign,
      :twitter_handle,
      :city,
      :state,
      :website,
      :video_link,
      :twitter_handle,
      :facebook_url,
      :description,
      :mission_statement
    ]
  end

  protected

    def all_columns
      Cause.column_names.map(&:to_sym)
    end
end
