class JournalPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def new?
    user.present?
  end

  def create?
    author?
  end

  def manage?
    author?
  end
end
