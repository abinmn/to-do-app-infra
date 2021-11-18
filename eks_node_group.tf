resource "aws_eks_node_group" "todo_eks_node_group" {
  cluster_name    = aws_eks_cluster.todo_eks_cluster.name
  node_group_name = "todo"
  node_role_arn   = aws_iam_role.todo_IAM_worker_nodes.arn
  subnet_ids = [
    aws_subnet.todo_private_subnet_1.id,
    aws_subnet.todo_private_subnet_2.id
  ]

  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 2
  }

  update_config {
    max_unavailable_percentage = 50
  }

  depends_on = [
    aws_iam_role_policy_attachment.todo_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.todo_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.todo_AmazonEC2ContainerRegistryReadOnly,
  ]
}