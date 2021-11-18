resource "aws_eks_cluster" "todo_eks_cluster" {
  name     = "todo-eks-cluster"
  role_arn = aws_iam_role.todo_eks_cluster.arn

  vpc_config {
    subnet_ids = [aws_subnet.todo_private_subnet_1.id, aws_subnet.todo_private_subnet_2.id]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.todo-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.todo-AmazonEKSVPCResourceController,
  ]
}

output "endpoint" {
  value = aws_eks_cluster.todo_eks_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.todo_eks_cluster.certificate_authority[0].data
}