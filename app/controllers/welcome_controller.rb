class WelcomeController < ApplicationController
  def home
    @family_members = FamilyMember.all
  end
end
