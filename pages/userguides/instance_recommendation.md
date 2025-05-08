---
toc: false
parent: User Guides
title: Cloud Instance Recommendations
keywords: vm, ec2, instance, cloud, recommendation, cpu usage
last_updated: September, 2024
summary: "A step by step guide to generating accurate cloud instance recommendations for your server inventory. We will walk you through organizing your server inventory into projects and migration waves, then gathering the required data for your servers. Plus, learn how you can gather CPU utilization data over time to generate recommendations that become more accurate as you learn more about the workload of your servers."
permalink: instance-recommendation.html
---

Tidal Accelerator analyzes your servers and generates data-driven cloud instance recommendations which meet performance requirements for your workloads at the best possible value.

Instance recommendation is currently available for Azure and Amazon Web Services.

## How does it work?

Tidal Accelerator's cloud instance recommendation uses a proven scientific approach to compare the CPU performance of your on-premise servers with their cloud compute equivalent. This allows us to recommend instances which will meet performance requirements for your workloads while delivering the best possible value, ensuring that workloads are not over-provisioned.

We consider CPU age and processing power, as well as RAM and storage usage to generate our recommendations. As you discover more about your server infrastructure, your instance recommendations change and become more refined, based on real-world usage data.

Under the hood, we leverage the approach described in Amazon Web Service's whitepaper <a target="_blank" href="https://s3.ca-central-1.amazonaws.com/tidal.assets/aws-demystifying-vcpus.pdf">Demystifying the Number of vCPUs for Optimal Workload Performance</a>.

This proven methodology drives the CPU performance aspect of our recommendations.

## Where do I start?

### Projects

Projects are how we determine the cloud provider used for instance recommendation. You can set the target cloud provider for a project when it is created, or you can update an existing project. You can also set cloud region at the project level. See [our documentation](assessment-projects.html#creating-a-project) for more information on creating a project.

{% include image.html file="instance_rec_1.png" %}

To assign servers to a project, you must create a migration wave. Simply create the migration wave for your project.

{% include image.html file="instance_rec_2.png" %}

After navigating to your migration wave, you can then add servers (and their dependencies, if required).

All servers in this project will use the project's cloud provider and cloud region by default. If you need more granular control over cloud region, you can set this at the server level as well.

{: .warning }
Changing cloud provider or region at the project level will clear server-level cloud region settings, and re-generate recommendations for all servers in the project.

### Gathering data

After servers are assigned to a project, instance recommendation occurs automatically when your servers have enough data for us to begin making recommendations.

{: .note }
The recommendation process can sometimes take several minutes to complete.

The best place to start is by using Machine Stats and Tidal Tools to analyze your servers and upload the data to Tidal Accelerator. This will provide us with the following information:
- CPU name
- RAM used
- Storage used
- Logical CPU count

See [our documentation](machine_stats.html) for detailed instructions on gathering machine stats with Tidal Tools.

If you'd prefer to enter these details manually, you can do so by editing the server directly.

From here, we can begin generating recommendations for this server. You can find your recommendation in the server overview under Transition Planning > Cloud Instance Target. If server doesn't have a recommendation yet, you should be able to hover over this field and see what information you need to gather to generate the recommendation.

{% include image.html file="instance_rec_3.png" %}

### Refining your recommendation

In order to generate the best possible recommendation, we can leverage CPU utilization data that you gather for your server. For details on how to do this, see our documentation on gathering CPU utilization time-series data. As you gather CPU utilization data for your server, we will aggregate this data behind the scenes, and update your recommendation every 12 hours as data is received. A summary of your server's CPU utilization is displayed on the server overview.

{% include image.html file="instance_rec_4.png" %}

We recommend gathering CPU utilization data over as long a time period as possible - at least a full week - in order to get the best possible picture of a server's CPU workload. If you decide against capturing CPU utilization data, we will assume that the server if operating at 100% utilization.

By following the above steps, you have now organized your server inventory into projects and migration waves, while also generating cloud instance recommendations for eligible servers. Remember, the more you discover about your servers - the more accurate the recommendations become.
