set :stage, :production

server 'fleet@app.raven.com',
       user: 'fleet',
       roles: %w{web app db},
       ssh_options: {
           user: 'fleet',
           forward_agent: true,
           keys: %w(~/.ssh/id_rsa),
           auth_methods: %w(publickey)
       }
