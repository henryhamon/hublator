module NestedResource
  protected
  def belongs_to(args = [])
    @parents = args
  end

  def parent_association
    @parent_association ||= parent_object.send(model_name.to_s.pluralize.to_sym)
  end

  def parent_type
    @parent_type ||= parent_type_from_params || parent_type_from_request
  end

  def parent_type_from_params
    @parents.find { |parent| !params["#{parent}_id".to_sym].nil? }
  end

  def parent_type_from_request
    @parents.find { |parent| request.path.split('/').include? parent.to_s }
  end

  def parent?
    !parent_type.nil?
  end

  def parent_singleton?
    !parent_type_from_request.nil? && parent_type_from_params.nil?
  end

  def parent_param
    params["#{parent_type}_id".to_sym]
  end

  def parent_model
    parent_type.to_s.camelize.constantize
  end

  def parent_object
    parent? && !parent_singleton? ? parent_model.find(parent_param) : nil
  end

  def end_of_association_chain
    parent? ? parent_association : model
  end
end

