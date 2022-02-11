name 'web'
description 'Web Server role'
run_list 'recipe[apache_old_way]'

default_attributes 'apache-test' => {
  'attr1': 'hello from attr1',
  'attr2': 'this is attr2 value',
}
