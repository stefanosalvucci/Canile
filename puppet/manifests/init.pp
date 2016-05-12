class { 'postgresql::server': }

class { 'postgresql::server': }

postgresql::server::db { 'canile_production':
  user     => 'vagrant',
  password => postgresql_password('vagrant', 'aswroma3'),
}

postgresql::server::role { 'vagrant':
password_hash => postgresql_password('vagrant', 'aswroma3'),
}

postgresql::server::database_grant { 'canile_production':
  privilege => 'ALL',
  db        => 'canile_production',
  role      => 'vagrant',
}
