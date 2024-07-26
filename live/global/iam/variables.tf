variable "user_names" {
  description = "Create users with these usernames"
  type        = list(string)
  default     = ["ahmad", "sajid", "tasmiah"]
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