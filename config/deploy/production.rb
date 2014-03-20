set :stage, :production

server 'fapi001@app.raven.com',
       user: 'fapi001',
       roles: %w{web app db},
       ssh_options: {
           user: 'fapi001',
           forward_agent: true,
           keys: %w(~/.ssh/id_rsa),
           auth_methods: %w(publickey)
       }

server 'fapi002@app.raven.com',
       user: 'fapi002',
       roles: %w{web app db},
       ssh_options: {
           user: 'fapi002',
           forward_agent: true,
           keys: %w(~/.ssh/id_rsa),
           auth_methods: %w(publickey)
       }
