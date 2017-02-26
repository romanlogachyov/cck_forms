# Represents a single checkbox.
#
class CckForms::ParameterTypeClass::Boolean
  include CckForms::ParameterTypeClass::Base

  def self.name
    'Галочка (да/нет)'
  end

  # Is it true?
  def value?
    value.present? && value != '0'
  end

  # Anything -> boolean
  def mongoize
    value?
  end

  # 'yes/no' string
  def to_s(options = nil)
    value? ? 'да' : 'нет'
  end

  # Checkbox HTML
  def build_form(form_builder, options)
    set_value_in_hash options
    form_builder.check_box :value, options.merge(value: 1, checked: value?)
  end
end
