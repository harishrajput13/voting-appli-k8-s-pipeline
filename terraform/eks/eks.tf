
resource "aws_eks_cluster" "eks-cluster" {
  name     = "eks"
  role_arn = aws_iam_role.eks-role.arn

  vpc_config {
    subnet_ids = aws_subnet.public-subnet[*].id
  }
}


resource "aws_eks_node_group" "eks-node-group" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = "eks-node-group"
  node_role_arn   = aws_iam_role.eks-node-role.arn
  subnet_ids      = aws_subnet.public-subnet[*].id


  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  instance_types = [var.instance-type]
}
