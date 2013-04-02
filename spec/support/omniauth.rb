def set_omniauth(opts = {})
    opts.reverse_merge!({
        provider: :github,
        uid: '1234',

        github: {
            email: 'ricardo.krieg@gmail.com',
            user_name: 'ricardokrieg'
        }
    })

    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[opts[:provider]] = {
        'uid' => opts[:uid],
        'extra' => {
            'email' => opts[opts[:provider]][:email],
            'user_name' => opts[opts[:provider]][:user_name]
        }
    }
end

def set_invalid_omniauth(opts = {})
    opts.reverse_merge!({
        provider: :github,
        invalid: :invalid_credentials
    })

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[opts[:provider]] = opts[:invalid]
end
