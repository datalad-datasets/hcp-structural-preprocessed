#!/bin/bash

set -e -u

# get list of dirs once
for subdir in [0-9]*; do
    [ -d $subdir ] || continue

    newsub="sub-${subdir}"
    mkdir -p ${newsub}/anat
    # rename files
    git mv ${subdir}/T1w/T1w_acpc_dc.nii.gz ${newsub}/anat/${newsub}_desc-dc_T1w.nii.gz
    # sub-206828 is missing T1w_acpc_dc_restore
    git mv ${subdir}/T1w/T1w_acpc_dc_restore.nii.gz ${newsub}/anat/${newsub}_desc-dc-restore_T1w.nii.gz || true
    git mv ${subdir}/T1w/T1wDividedByT2w.nii.gz ${newsub}/anat/${newsub}_T1wDividedByT2w.nii.gz
    # sub-204622 is missing T2w_acpc_dc
    git mv ${subdir}/T1w/T2w_acpc_dc.nii.gz ${newsub}/anat/${newsub}_desc-dc_T2w.nii.gz || true
    git mv ${subdir}/T1w/T2w_acpc_dc_restore.nii.gz ${newsub}/anat/${newsub}_desc-dc-restore_T2w.nii.gz
    # get rid of the old dir
    git rm -r ${subdir} > /dev/null || rm -rf ${subdir}
done

# let git-annex ensure all file pointers are proper
git annex fsck

# create dataset_description.json
cat >> dataset_description.json << EOT
{
    "Name": "HCP Structural Preprocessed",
    "BIDSVersion": "1.3.0-dev (BEP003)",
    "PipelineDescription": {
        "Name": "HCP Pipelines - PreFreeSurfer",
        "Version": "",
        },
    "SourceDatasets": [
        {
            "DOI": "",
            "URL": "https://github.com/datalad-datasets/human-connectome-project-openaccess",
            "Version": ""
        }
    ]
}
EOT
