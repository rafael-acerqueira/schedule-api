module ErrorSerializer
  def self.serialize(errors)
    return if errors.nil?

    error_hash = errors.to_hash.flat_map do |k, v|
      v.map do |msg|
        { id: k, title: msg }
      end
    end
    Hash.new.tap do |h|
      h[:errors] = error_hash
    end
  end
end
