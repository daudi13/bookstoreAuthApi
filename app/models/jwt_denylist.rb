class JwtDenylist < ApplicationRecord
  Include Devise::JWT::RevocationStrategies::Denylist

  self.table_name = 'jwt_denylist'
end
