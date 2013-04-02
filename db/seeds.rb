Site.create! [
    {name: 'Google', url: 'google.com'},
    {name: 'Gmail', url: 'gmail.com'},
    {name: 'GitHub', url: 'github.com'},
]

User.create! [
    {username: 'ricardokrieg', email: 'ricardo.krieg@gmail.com', provider: 'github', uid: '825215'},
]

Category.create! [
    {name: 'Developer'},
    {name: 'Designer'},
]

Development.create! [
    {user_id: 1, site_id: 1, category_id: 1},
    {user_id: 1, site_id: 2, category_id: 2},
    {user_id: 1, site_id: 3, category_id: 1},
]
