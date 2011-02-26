def recursive_symbolize_keys!(hash)
  hash.symbolize_keys!
  hash.values.select{|v| v.is_a? Hash}.each{|h| recursive_symbolize_keys!(h)}
end

AppSettings = YAML.load_file("#{Rails.root}/config/settings.yml")[Rails.env]
recursive_symbolize_keys!(AppSettings)

