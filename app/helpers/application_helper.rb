module ApplicationHelper

  # @param [ActiveModel::Errors] errors
  # @return [Array<String>] the plain error messages
  def error_messages_for(errors)
    errors.values.flatten
  end

end
