class CalendarsController < ApplicationController
  def show
    @family_members = FamilyMember.all
  end
end
