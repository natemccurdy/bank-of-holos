// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/holos-run/holos/api/core/v1alpha3

package v1alpha3

// FilePath represents a file path.
#FilePath: string

// FileContent represents file contents.
#FileContent: string

// FileContentMap represents a mapping of file paths to file contents.
#FileContentMap: {[string]: #FileContent}

// BuildPlan represents a build plan for the holos cli to execute.  The purpose
// of a BuildPlan is to define one or more [Component] kinds.  For example a
// [HelmChart], [KustomizeBuild], or [KubernetesObjects].
//
// A BuildPlan usually has an additional empty [KubernetesObjects] for the
// purpose of using the [Component] DeployFiles field to deploy an ArgoCD
// or Flux gitops resource for the holos component.
#BuildPlan: {
	kind:       string & "BuildPlan"            @go(Kind)
	apiVersion: string & (string | *"v1alpha3") @go(APIVersion)
	spec:       #BuildPlanSpec                  @go(Spec)
}

// BuildPlanSpec represents the specification of the build plan.
#BuildPlanSpec: {
	// Disabled causes the holos cli to take no action over the [BuildPlan].
	disabled?: bool @go(Disabled)

	// Components represents multiple [HolosComponent] kinds to manage.
	components?: #BuildPlanComponents @go(Components)
}

#BuildPlanComponents: {
	resources?: {[string]: #KubernetesObjects} @go(Resources,map[InternalLabel]KubernetesObjects)
	kubernetesObjectsList?: [...#KubernetesObjects] @go(KubernetesObjectsList,[]KubernetesObjects)
	helmChartList?: [...#HelmChart] @go(HelmChartList,[]HelmChart)
	kustomizeBuildList?: [...#KustomizeBuild] @go(KustomizeBuildList,[]KustomizeBuild)
}

// Kustomize represents resources necessary to execute a kustomize build.
// Intended for at least two use cases:
//
//  1. Process a [KustomizeBuild] [Component] which represents raw yaml
//     file resources in a holos component directory.
//  2. Post process a [HelmChart] [Component] to inject istio, patch jobs,
//     add custom labels, etc...
#Kustomize: {
	// KustomizeFiles holds file contents for kustomize, e.g. patch files.
	kustomizeFiles?: #FileContentMap @go(KustomizeFiles)

	// ResourcesFile is the file name used for api objects in kustomization.yaml
	resourcesFile?: string @go(ResourcesFile)
}
