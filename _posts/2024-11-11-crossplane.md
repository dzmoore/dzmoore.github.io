---
title: "post"
date: 2024-05-04T20:51:00-07:00
categories:
  - blog
tags:
  - post
---

# Crossplane

# Intro to Crossplane
## Brief Intro to Containers and Kubernetes
* In order to understand Crossplane, you first need to understand a few things about Kubernetes.
* And in order to understand Kubernetes, you need to understand a few things about containers.

### Containers
* Containers are lightweight, portable, isolated environments that package an application along with its dependencies, libraries, and configuration files.
* Unlike Virtual Machines, containers share the host Operating System kernel, running in separate user spaces

![Three virtual machines containing different apps, each VM has its own guest os.  All VMs sit on top of a Hypervisor, and the hypervisor sits on top of the infrastructure](/assets/images/umlet/inverted/virtual-machines.png)

### Kubernetes
* Kubernetes is a platform for automating deployment, scaling, and management of containerized applications
* Kubernetes organizes containers into logical units called Pods, manages their lifecycle, and handles tasks like load balancing
* Kubernetes is declarative - you define the desired state of your system, rather than explicitly 
  coding the steps to achieve that state
* Concept of a control loop - Example is a thermostat
    * Desired state = set temperature
    * Current state = room temperature
    * Thermostat works to bring the current state closer to the desired state by turning equipment on or off
* In Kubernetes, a controller is software that watches a resource type (desired state) and does something to try to move the current state closer to the desired state

#### Kubernetes Cluster
* Kubernetes Cluster = Control Plane + Worker Nodes
* Control Plane makes global decisions about the cluster
* Worker Nodes run workloads (containers)
* Important component of the Control Plane: API Server
* API Server is the "frontend" for the Kubernetes Control Plane; it exposes Kubernetes APIs
* Kubernetes API lets you query or manipulate the state of objects in Kubernetes
* Resource is an endpoint in Kubernetes API that stores a collection of API Objects of a certain Kind
* There are built-in resources - like Pod
* Resource = Type; Object = Instance