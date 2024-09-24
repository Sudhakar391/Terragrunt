include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/eks"
}

inputs = {
  region          = "us-west-2"
  cluster_name    = "my-cluster"
  cluster_version = "1.21"
  subnets         = ["${dependency.vpc.outputs.public_subnets}"]
  vpc_id          = "${dependency.vpc.outputs.vpc_id}"
}
