class { 'postgresql::server':
  ip_mask_deny_postgres_user => '0.0.0.0/32',
  ip_mask_allow_all_users    => '0.0.0.0/0',
  listen_addresses           => '*',
  postgres_password          => 'aswroma3',
}

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