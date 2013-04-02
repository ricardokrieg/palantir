module Github
    CONFIG = YAML.load_file(Rails.root.join('config', 'github.yml'))[Rails.env]

    APP_ID = CONFIG['app_id']
    APP_SECRET = CONFIG['app_secret']
end
