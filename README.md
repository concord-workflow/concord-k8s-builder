# Concord Kubernetes Builder

This is a work in progress.

## How to use

We realize this may not be the most ideal setup, but while we figure out the best pattern of reuse this is the method we have to share the bulk of the K8s builder while allowing customization for your organization.

1. Create a Git repository that will house two submodules (concord-k8s-builder-[your-organization])
	
```
mkdir concord-k8s-builder-superco
cd concord-k8s-builder-superco
git init
git remote add origin https://github.com/superco/concord-k8s-builder-superco
```
	
2. Add a submodule for the main concord-k8s-builder
	
```
git submodule add https://github.com/concord-workflow/concord-k8s-builder.git
```

3. Add a submodule for your organization specific profiles
	
```
git submodule add https://github.com/superco/concord-k8s-profiles.git
```

4. Add all the submodules and .gitsubmodules, commit and push
   
```
git add .gitmodules concord-k8s-builder concord-k8s-profiles   
git commit -m 'Adding Concord K8s Builder submodules'   
git push -u origin master
```
   
5. Symlink the `k8s-cluster` script in `concord-k8s-builder` to the top-level of your Git repo. From the top-level of your Git repo:

```
ln -s concord-k8s-builder/k8s-cluster k8s-cluster
```
   
Again this may not be the ideal setup, but we needed a way to share most of the mechanism with several distinct organizations so this is how it works for now. This should mesh with the way Concord checks out Git repositories so this should eventually work with Concord listening for triggers on a repository containing this structure.
      

