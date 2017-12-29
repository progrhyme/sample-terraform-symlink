vpc_main = {
  cidr = "10.0.0.0/16"
}

subnets_main = {
  public  = ["10.0.0.0/24", "10.0.1.0/24"]
  private = ["10.0.2.0/24", "10.0.3.0/24"]
}

db_main = {
  family            = "mysql5.7"
  engine            = "mysql"
  engine_version    = "5.7.19"
  instance_class    = "db.t2.micro"
  storage_type      = "gp2"
  allocated_storage = 20
  name              = "<db-name>"
  username          = "<db-username>"
  password          = "<db-password>"
}
