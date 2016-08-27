class Ph2
  module Domain
    def self.repositories
      constants.map do |constant|
        [constant.downcase, const_get(constant)::Repository]
      end.to_h
    end

    def self.modules
      constants.map do |module_name|
        module_name.to_s.downcase
      end
    end

    def self.use_cases
      constants.flat_map do |domain_module|
        const_get(domain_module)::UseCases.constants.map do |use_case|
          [ [ domain_module.to_s.underscore.to_sym, use_case.to_s.underscore.to_sym],
            const_get(domain_module)::UseCases.const_get(use_case)]
        end
      end.to_h
    end
  end
end

Dir[File.dirname(__FILE__) + "/domain/**/*.rb"].each { |file| require file }
