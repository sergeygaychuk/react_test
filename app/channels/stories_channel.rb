class StoriesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "StoriesChannel"
  end
end
