// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go sigs.k8s.io/kustomize/api/types

package types

#HelmDefaultHome: "charts"

#HelmGlobals: {
	// ChartHome is a file path, relative to the kustomization root,
	// to a directory containing a subdirectory for each chart to be
	// included in the kustomization.
	// The default value of this field is "charts".
	// So, for example, kustomize looks for the minecraft chart
	// at {kustomizationRoot}/{ChartHome}/minecraft.
	// If the chart is there at build time, kustomize will use it as found,
	// and not check version numbers or dates.
	// If the chart is not there, kustomize will attempt to pull it
	// using the version number specified in the kustomization file,
	// and put it there.  To suppress the pull attempt, simply assure
	// that the chart is already there.
	chartHome?: string @go(ChartHome)

	// ConfigHome defines a value that kustomize should pass to helm via
	// the HELM_CONFIG_HOME environment variable.  kustomize doesn't attempt
	// to read or write this directory.
	// If omitted, {tmpDir}/helm is used, where {tmpDir} is some temporary
	// directory created by kustomize for the benefit of helm.
	// Likewise, kustomize sets
	//   HELM_CACHE_HOME={ConfigHome}/.cache
	//   HELM_DATA_HOME={ConfigHome}/.data
	// for the helm subprocess.
	configHome?: string @go(ConfigHome)
}

#HelmChart: {
	// Name is the name of the chart, e.g. 'minecraft'.
	name?: string @go(Name)

	// Version is the version of the chart, e.g. '3.1.3'
	version?: string @go(Version)

	// Repo is a URL locating the chart on the internet.
	// This is the argument to helm's  `--repo` flag, e.g.
	// `https://itzg.github.io/minecraft-server-charts`.
	repo?: string @go(Repo)

	// ReleaseName replaces RELEASE-NAME in chart template output,
	// making a particular inflation of a chart unique with respect to
	// other inflations of the same chart in a cluster. It's the first
	// argument to the helm `install` and `template` commands, i.e.
	//   helm install {RELEASE-NAME} {chartName}
	//   helm template {RELEASE-NAME} {chartName}
	// If omitted, the flag --generate-name is passed to 'helm template'.
	releaseName?: string @go(ReleaseName)

	// Namespace set the target namespace for a release. It is .Release.Namespace
	// in the helm template
	namespace?: string @go(Namespace)

	// AdditionalValuesFiles are local file paths to values files to be used in
	// addition to either the default values file or the values specified in ValuesFile.
	additionalValuesFiles?: [...string] @go(AdditionalValuesFiles,[]string)

	// ValuesFile is a local file path to a values file to use _instead of_
	// the default values that accompanied the chart.
	// The default values are in '{ChartHome}/{Name}/values.yaml'.
	valuesFile?: string @go(ValuesFile)

	// ValuesInline holds value mappings specified directly,
	// rather than in a separate file.
	valuesInline?: {...} @go(ValuesInline,map[string]interface{})

	// ValuesMerge specifies how to treat ValuesInline with respect to Values.
	// Legal values: 'merge', 'override', 'replace'.
	// Defaults to 'override'.
	valuesMerge?: string @go(ValuesMerge)

	// IncludeCRDs specifies if Helm should also generate CustomResourceDefinitions.
	// Defaults to 'false'.
	includeCRDs?: bool @go(IncludeCRDs)

	// SkipHooks sets the --no-hooks flag when calling helm template. This prevents
	// helm from erroneously rendering test templates.
	skipHooks?: bool @go(SkipHooks)

	// ApiVersions is the kubernetes apiversions used for Capabilities.APIVersions
	apiVersions?: [...string] @go(ApiVersions,[]string)

	// KubeVersion is the kubernetes version used by Helm for Capabilities.KubeVersion"
	kubeVersion?: string @go(KubeVersion)

	// NameTemplate is for specifying the name template used to name the release.
	nameTemplate?: string @go(NameTemplate)

	// SkipTests skips tests from templated output.
	skipTests?: bool @go(SkipTests)
}

// HelmChartArgs contains arguments to helm.
// Deprecated.  Use HelmGlobals and HelmChart instead.
#HelmChartArgs: {
	chartName?:     string @go(ChartName)
	chartVersion?:  string @go(ChartVersion)
	chartRepoUrl?:  string @go(ChartRepoURL)
	chartHome?:     string @go(ChartHome)
	chartRepoName?: string @go(ChartRepoName)
	helmBin?:       string @go(HelmBin)
	helmHome?:      string @go(HelmHome)
	values?:        string @go(Values)
	valuesLocal?: {...} @go(ValuesLocal,map[string]interface{})
	valuesMerge?:      string @go(ValuesMerge)
	releaseName?:      string @go(ReleaseName)
	releaseNamespace?: string @go(ReleaseNamespace)
	extraArgs?: [...string] @go(ExtraArgs,[]string)
}
