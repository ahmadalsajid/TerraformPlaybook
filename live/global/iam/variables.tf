variable "user_names" {
  description = "Create users with these usernames"
  type        = list(string)
  default     = ["neo", "trinity", "morpheus"]
}

variable "hero_thousand_faces" {
  description = "map"
  type        = map(string)
  default = {
    neo      = "hero"
    trinity  = "love interest"
    morpheus = "mentor"
  }
}

variable "give_neo_full_access" {
  description = "if true, neo gets full access to cloudwatch"
  type        = bool
  default     = false
}