def set_omniauth(opts = {})
    opts.reverse_merge!({
        provider: :github,
        uid: '1234',
        github: {
            email: 'ricardo.krieg@gmail.com',
            username: 'ricardokrieg'
        }
    })

    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[opts[:provider]] = OmniAuth::AuthHash.new({
        provider: opts[:provider].to_s,
        uid: opts[:uid],
        info: {
            email: opts[opts[:provider]][:email],
            nickname: opts[opts[:provider]][:username]
        }
    })
end

def set_invalid_omniauth(opts = {})
    opts.reverse_merge!({
        provider: :github,
        invalid: :invalid_credentials
    })

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[opts[:provider]] = opts[:invalid]
end
