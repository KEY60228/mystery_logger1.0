class Performance < ApplicationRecord
  def posts
    return Post.where(performance_id: self.id)
  end
end
