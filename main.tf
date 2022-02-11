module "podtatohead" {
  source = "./modules/podtatohead"
  podtato_name = "app"
  hats_version = "v4"
  left_arm_version = "v1"
  left_leg_version = "v3"
  podtato_version = "v0.1.0"
  right_arm_version = "v2"
  right_leg_version = "v3"
}




output "url" {
  value = module.podtatohead.url
}

