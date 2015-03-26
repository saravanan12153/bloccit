class TopicPolicy < ApplicationPolicy

  def index?
    true 
  end

  def show?
    record.public? || user.present?
  end

  # only admins can create topics
  def create?
    user.present? && user.role?(:admin)
  end

  # only admins can update topics
  def update?
    create?
  end

  # only admins can destroy topics (i.e. this relegates to create? which requires user and that user admin)
  def destroy?
    create?
  end

end