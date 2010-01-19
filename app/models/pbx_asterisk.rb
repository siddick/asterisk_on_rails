class PbxAsterisk < Pbx

  has_many  :config_files,           :foreign_key => 'pbx_id'
# has_many  :config_file_tests,      :foreign_key => 'pbx_id'
  has_many  :config_file_sips,       :foreign_key => 'pbx_id'
  has_many  :config_file_extensions, :foreign_key => 'pbx_id'


  has_many  :sips,
    :class_name => 'AsteriskSip',
    :foreign_key => 'pbx_id'
  has_many  :extensions,
    :class_name => 'AsteriskExtension',
    :foreign_key => 'pbx_id'


  SIP       = AsteriskSip
  EXTENSION = AsteriskExtension

end
