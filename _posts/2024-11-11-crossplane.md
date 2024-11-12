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

![image-left](/assets/images/test-diagram.png)

<style>
  .virtual-machine {
    width: 100px;
    height: 100px;
    background-color: #2f60c4;
    color: white;

  }
</style>
<div class="virtual-machine">
<div>Virtual Machine</div>
</div>
<div style="border:2px solid red; padding: 10px;">okay</div>




```mermaid
---
config:
  flowchart:
    htmlLabels: false
---
block-beta
  classDef transparent stroke-width:0,fill:transparent

  block:content
    columns 3
    block:vmBlock1
      columns 1

      vmLabel1("Virtual Machine 1")
      class vmLabel1 transparent

      block:innerBlock1
        columns 2
        class innerBlock1 transparent
        app1("App 1")
        app2("App 2")
        app3("App 3")
        app4("App 4")
      end

      os1("Guest Operating System")
    end

    block:vmBlock2
      columns 1

      vmLabel2("Virtual Machine 2")
      class vmLabel2 transparent

      block:innerBlock2
        columns 1
        class innerBlock2 transparent
        app5("App 5")
        space
      end

      os2("Guest Operating System")
    end

    block:vmBlock3
      columns 1

      vmLabel3("Virtual Machine 3")
      class vmLabel3 transparent

      block:innerBlock3
        columns 1
        class innerBlock3 transparent
        app6("App 6")
        app7("App 7")
      end

      os3("Guest Operating System")
    end

    block:bottomBlock:3
      columns 1
      hypervisor["Hypervisor"]
      infra["Infrastructure"]
    end
    %%class bottomBlock transparent

  end

  block:noteBlock
    columns 1
    osNote1>"This is the OS on the VM.\nIt can be Windows, Linux, etc."]-->os3

    space
    hypervisorNote>"This is software that runs virtual \nmachines, such as VMware ESXi."] --> hypervisor

    space
    infraNote>"This is hardware that runs virtual \nmachines, such as VMware ESXi."] --> infra

  end
```
