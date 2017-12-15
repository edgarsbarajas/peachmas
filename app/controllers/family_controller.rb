class FamilyController < ApplicationController
  def index
    @peach_family = User.where(family_id: 1)
  end
end
