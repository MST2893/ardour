# MSVC_NMake/cairomm

# Input: mm_conf_data, cairommconfig_h_meson
# Output: cairomm_rc

cairomm_rc = configure_file(
  input: 'cairomm.rc.in',
  output: '@BASENAME@',
  configuration: mm_conf_data,
)

# Make a copy of the generated configuration header in the MSVC project directory.
configure_file(
  input: cairommconfig_h_meson,
  output: 'cairommconfig.h',
  configuration: mm_conf_data,
)
