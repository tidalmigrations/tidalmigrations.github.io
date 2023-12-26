Cloud migration is the process of moving your data, applications, and other
elements to the cloud. However, the path to the cloud can be long and painful
without proper planning and execution.  By following Tidal's five
discovery layering techniques, you will be migrating to the cloud with ease!

{% include image.html file="layered_discovery_expanded.png" caption="Tidal's
layered approach to application discovery, for cloud migration." %}

# Five Steps To Discovery Bliss

## 1) Import Your Spreadsheets

If your already have some data collected in spreadsheets, the first step to
begin your cloud migration project is importing a spreadsheet of Virtualization
Clusters, Servers, Databases Instances and Applications. Tidal's
importer will guide you through mapping your columns to our fields, create your
own fields and even make associations between dependencies if you have captured
these.

_NB: See additional ways on importing your [applications](importapps.html) and
[servers](import_servers.html) in the API docs._

---

## 2) Integrate Your Hypervisors

Once you have imported your data, you can begin to synchronize your inventories
via [`tidal sync servers`](sync-servers.html).  Tidal sync supports many server
inventory management tools such as VMWare and HyperV with more possible via
scripting ([ask us](https://tidalcloud.com/contact)).

If you have VM Ware's vSphere, [`tidal sync vsphere`](#vsphere-sync) will
handle everying with just read-only credentials required.


### Scheduling your sync:

It is useful to setup a cron job or Windows Scheduled Task for this process,
and we recommend synchronizing your inventories no more than once per day.

This will keep your resource inventory up to date and show you usage trends
over time in the _Analyze_ feature.

---

## 3) Aggregate Server Usage Statistics

Tidal provides you with a simple and effective way to [gather
machine statistics](https://github.com/tidalmigrations/machine_stats) (RAM,
Storage, CPU allocations and usage) from Windows and UNIX/Linux server
environmens.
In Windows, we use WinRM to Invoke-Command across your servers, and for *NIX we
leverage ansible. Both of these approaches output JSON which is securely sent
to your Tidal instance using the tidal command.

Checkout this [guide](sync_hyper-v.html) for a quick and clean approach to
gathering server usage statistics. See the
[machine_stats](https://github.com/tidalmigrations/machine_stats) repository
for more implementation details.

_NB: Feel free to fork the repo and modify to suit your needs, or to show your
security team and give them comfort.  This extensibility and transparency is
core to our approach._

---

## 4) Fingerprint Web Applications

**a.)** The initial step in your cloud journey is discovering what you have.
It can be hard to remain informed about all the domains and applications hosted
in your environment, which is why we created the `tidal discover` command.
With your customized _Discovery Plan_ you can obtain both private and public
domains within your datacentres in under 60 seconds.

[This tidal-tools guide](discover.html) contains examples for creating your own
_Discovery Plan_ to scan multiple networks and DNS services.

**b.)** With a list of domains in hand, the next step is to _analyze_ the
applications hosted on these domains.

`tidal analyze web` will fingerprint the technology on both your internet sites
and intranet applications behind your firewall in seconds, _without needing to
install agents._
Whether you have 1 or 1 million end points, Tidal Tools centralizes the data
gathered into our platform for you to analyze further and plan with,
simplifying your application centric cloud migration.

For detailed information and steps on analyzing your domains, be sure to
checkout this [guide](analyze.html).

---

## 5) Analyze Your Source Code

Finally, to find the applications which will migrate more easily to
cloud-native technologies you can analyze your source code and rank your
applications by _Cloud Readiness_.

Doing this for each of your custom applications which have a _Transition Type_
of Refactor or Replatform will give you the data needed to prioritize your
application migrations.  To analyze your source code, you need the `Application
ID`, to be logged in with tidal-tools and a copy of the source code checked
out.

You can find the `Application ID` in the URL bar when looking at an
application.  e.g. if I'm loking at an application in Tidal, the URL
will show `https://[your workspace].tidal.cloud/apps/111/overview`  Here, `111` is my
`Application ID`.

I can now analyze the source code with:

```
cd /path/to/source-code
tidal analyze code --app-id 111 .
```
To find additional information about this feature, visit the
[guide](analyze-source-code.html) on analyzing your source code.

