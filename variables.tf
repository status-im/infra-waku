variable "domain" {
  description = "DNS Domain to update"
  type        = string
  default     = "status.im"
}

variable "cf_zone_id" {
  description = "ID of CloudFlare zone for host record."
  type        = string
  default     = "fd48f427e99bbe1b52105351260690d1" /* status.im */
}
