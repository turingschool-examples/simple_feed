Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github,    "63deb88d2ac451065ee6", "9ffc2408cbd9de4eeb52bf4d936ae6a8e63dd945", scope: "user,repo,gist"
  provider :twitter,   "p5JyWXRds3enfXqIzPg", "8umsQm6P2oTR0jKkSkFjYPNxc9FF9HoYLblGQFLaU"
  provider :instagram, "3b8cbaa65a54409ca4ad061b9ac5f502", "d495a8427d56481abe60ccf8ddd2f9ff"
end
