# Get data from a subset (structural preprocessed data) from the Human Connectome Project Open Access dataset with DataLad

[![made-with-datalad](https://www.datalad.org/badges/made_with.svg)](https://datalad.org)

This dataset enables data retrieval for a **subset** of the [HCP Open Access
dataset](https://registry.opendata.aws/hcp-openaccess/) for users that accepted
the WU-Minn HCP Consortium Open Access Data Use Terms and obtained valid AWS
credentials via [db.humanconnectome.org](http://db.humanconnectome.org).

## Structural preprocessed data subset

**Important**: For a DataLad dataset of the *full* HCP Open Access dataset,
please go to
[github.com/datalad-datasets/human-conntectome-project-openaccess](https://github.com/datalad-datasets/human-connectome-project-openaccess).

This subset comprises the preprocessed, structural files of each subject in the
HCP Open Access dataset. Specifically, these files are

```
- <sub>/T1w/T{1,2}w_acpc_dc.nii.gz
- <sub>/T1w/T{1,2}w_acpc_dc_restore.nii.gz
- <sub>/T1w/T1wDividedByT2w.nii.gz
```

The directory structure and the file names in this subset are kept identical to
the full HCP dataset. However, an additional BIDS-formatted view of the dataset
is available in the `bids` branch.

The purpose of this dataset as to be a *single* dataset resource with all data
relevant for, e.g. voxel-based morphometry (VBM) like analyses. Compared to the
[full HCP open access DataLad
dataset](https://github.com/datalad-datasets/human-connectome-project-openaccess),
due to its reduced number of files and mono-repo structure, this dataset is
much faster to ``clone``. If only the files included in this subset are of
relevance to you, using this repository is a more efficient alternative to the
full HCP dataset.


## Human Connectome Project

The Human [Connectome Project (HCP)](http://www.humanconnectomeproject.org/about/)
aims to construct a map of the complete structural and functional neural
connections in vivo within and across individuals.

Its 'WU-Minn HCP Open Access Data' data release includes high-resolution 3T MR
scans from young healthy adult twins and non-twin siblings (ages 22-35) using
four imaging modalities: structural images (T1w and T2w), resting-state fMRI (rfMRI),
task-fMRI (tfMRI), and high angular resolution diffusion imaging (dMRI). It
further includes behavioral and other individual subject measure data for all,
and MEG data and 7T MR data for a subset of subjects (twin pairs).

## Data access and retrieval with DataLad

To retrieve HCP Open Access data included in this dataset via DataLad, you need to agree
to the [WU-Minn HCP Consortium Open Access Data Use Terms](./DATA_USE_AGREEMENT.md)
and obtain valid AWS credentials:

- Create an account at http://db.humanconnectome.org.
- Log into your account and accept the data use terms of the "WU-Minn HCP Data -
  1200 Subjects" data release.
- Enable Amazon S3 access for your Amazon account to get an access key ID
  and a secret access secret key (click on the button with the S3 logo).
  - The access key ID is a character string similar to this: ``AKIAXOX5CT57GHZ4SVFV``
  - The secret access key is a character string similar to this: ``vntFcVA+YI0Ii3tVZPpdyQrgp2H05YjesyXKGE+n``

You will be asked to supply your AWS credentials the first time you use `datalad get`
to retrieve file content of your choice from
the [HCP Open Access dataset](https://registry.opendata.aws/hcp-openaccess/). You
should only need to provide credentials once, and all subsequent `datalad get` commands
will retrieve data without asking them again.

## Dataset structure

Unlike the [full HCP open access DataLad dataset](https://github.com/datalad-datasets/human-connectome-project-openaccess),
this repository is a single dataset without any subdatasets.

If you have never used [DataLad](https://www.datalad.org/) before, please read the
section on DataLad datasets below.

## DataLad datasets and how to use them

This repository is a [DataLad](https://www.datalad.org/) dataset. It allows fine-grained
data access up to the level of single files of the HCP Open Access dataset without hosting
the HCP data. In order to use this repository for data retrieval,
[DataLad](https://www.datalad.org/) is required. It is a free and open source command line
tool, available for all major operating systems, and builds up on Git and
[git-annex](https://git-annex.branchable.com/) to allow sharing, synchronizing, and version
controlling collections of large files. You can find information on how to install DataLad
at [handbook.datalad.org/en/latest/intro/installation.html](http://handbook.datalad.org/en/latest/intro/installation.html).

### Get the dataset

A DataLad dataset can be `cloned` by running

```
datalad clone <url>
```
Once a dataset is cloned, it is a light-weight directory on your local machine.
At this point, it contains only small metadata and information on the identity of
the files in the dataset, but not actual *content* of the (sometimes large) data files.

### Retrieve dataset content

After cloning a dataset, you can retrieve file contents by running
```
datalad get <path/to/directory/or/file>
```
This command will trigger a download of the files, directories, or subdatasets you have specified.

DataLad datasets can contain other datasets, so called *subdatasets*. If you clone the top-level
dataset, subdatasets do not yet contain metadata and information on the identity of files,
but appear to be empty directories. In order to retrieve file availability metadata in
subdatasets, run

```
datalad get -n <path/to/subdataset>
```
Afterwards, you can browse the retrieved metadata to find out about subdataset contents, and
retrieve individual files with `datalad get`. If you use `datalad get <path/to/subdataset>`,
all contents of the subdataset will be downloaded at once.

### Stay up-to-date

DataLad datasets can be updated. The command `datalad update` will *fetch* updates and store them
on a different branch (by default `remotes/origin/master`). Running
```
datalad update --merge
```
will *pull* available updates and integrate them in one go.

### More information

More information on DataLad and how to use it can be found in the DataLad Handbook at
[handbook.datalad.org](http://handbook.datalad.org/en/latest/index.html). The chapter
"DataLad datasets" can help you to familiarize yourself with the concept of a dataset.
