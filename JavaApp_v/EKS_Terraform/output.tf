output "cluster_id" {
  value = aws_eks_cluster.ritvik.id
}

output "node_group_id" {
  value = aws_eks_node_group.ritvik.id
}

output "vpc_id" {
  value = aws_vpc.ritvik_vpc.id
}

output "subnet_ids" {
  value = aws_subnet.ritvik_subnet[*].id
}
