#DevSecOps Homelab

Production-style DevSecOps lab built to practice infrastructure
automation, GitLab CI/CD, containerization, vulnerability scanning,
and Kubernetes deployment.

## Architecture

Terraform → Proxmox → Ubuntu
                    ↓
                  Ansible
                    ↓
              GitLab Runner
                    ↓
             Docker Executor
                    ↓
        Validate → Test → Build → Scan
                    ↓
          GitLab Container Registry

## Technologies

- Linux / Ubuntu
- Terraform
- Proxmox
- Ansible
- GitLab CI/CD
- GitLab Runner
- Docker
- Trivy
- Kubernetes

## CI/CD Pipeline

1. Validate Python source
2. Execute automated tests
3. Build container image
4. Push image to GitLab Container Registry
5. Scan image with Trivy
6. Block HIGH/CRITICAL vulnerabilities
7. Kubernetes deployment - in progress
