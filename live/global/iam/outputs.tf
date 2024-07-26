output "for_directive_index_if_else_strip" {
value = <<EOF
%{~ for i, name in var.user_names ~}
${name}%{ if i < length(var.user_names) - 1 }, %{ else }.%{ endif }
%{~ endfor ~}
EOF
}