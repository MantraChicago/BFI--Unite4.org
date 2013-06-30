class CausePresenter

  def default
    base = [
      :id,
      :name,
      :twitter_handle,
      :city,
      :state,
      :website,
      :video_link,
      :twitter_handle,
      :facebook_url,
      :description,
      :mission_statement,
      :picture_url
    ]

    base << {
      attribute: :campaign,
      presenter: :default,
      method: :active_campaign
    }

    base << {
      attribute: :locations,
      presenter: :default
    }

    base
  end

  def complete

  end

  protected

    def all_columns
      Cause.column_names.map(&:to_sym)
    end
end
