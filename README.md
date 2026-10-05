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


This homelab project is base around GitLab and DevSecOps principles. I used Terraform with the Proxmox API to provision a dedicated Ubuntu GitLab Runner VM and Ansible to configure Docker and GitLab Runner. I registered the runner using the Docker executor and built a GitLab pipeline that validates the Python application, executes unit tests, builds a container image, pushes it to the GitLab Container Registry, and scans the image with Trivy.
I also built security controls into the pipeline. HIGH or CRITICAL vulnerabilities with available fixes fail the pipeline. In fact, during testing Trivy identified a HIGH CVE in a Debian package and correctly blocked the pipeline.
One of the more interesting troubleshooting problems was container builds. Rootless BuildKit was blocked by seccomp, and rootless Docker-in-Docker ran into Ubuntu user-namespace/AppArmor restrictions. Rather than disabling the host security controls globally, I restricted privileged execution specifically to the Docker-in-Docker build service while keeping normal CI job containers unprivileged.


My next phase is deploying the scanned image into Kubernetes using a least-privileged Kubernetes service account and custom manifests.”
